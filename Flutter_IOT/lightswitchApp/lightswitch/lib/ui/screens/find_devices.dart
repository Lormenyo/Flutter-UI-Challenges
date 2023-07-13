import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:lightswitch/helpers/size_helper.dart';
import 'package:lightswitch/ui/screens/device_screen.dart';
import 'package:lightswitch/ui/widgets/BluetoothDeviceListEntry.dart';
import 'package:lightswitch/constants/colors.dart';

class FindDevicesScreen extends StatefulWidget {
  /// If true, discovery starts on page start, otherwise user must press action button.
  final bool start;

  const FindDevicesScreen({Key? key, this.start = true}) : super(key: key);

  @override
  State<FindDevicesScreen> createState() => _FindDevicesScreenState();
}

class _FindDevicesScreenState extends State<FindDevicesScreen> {
  StreamSubscription<BluetoothDiscoveryResult>? _streamSubscription;
  List<BluetoothDiscoveryResult> results =
      List<BluetoothDiscoveryResult>.empty(growable: true);
  bool isDiscovering = false;
  List pairedDevices = [];

  _FindDevicesScreenState();

  @override
  void initState() {
    super.initState();

    isDiscovering = widget.start;
    if (isDiscovering) {
      _startDiscovery();
    }
  }

  void _restartDiscovery() {
    setState(() {
      results.clear();
      pairedDevices.clear();
      isDiscovering = true;
    });

    _startDiscovery();
  }

  void _startDiscovery() {
    _streamSubscription =
        FlutterBluetoothSerial.instance.startDiscovery().listen((r) {
      setState(() {
        final existingIndexInAvailableDevices = results.indexWhere(
            (element) => element.device.address == r.device.address);
        final existingIndexInPairedDevices = results.indexWhere(
            (element) => element.device.address == r.device.address);
        if (existingIndexInAvailableDevices >= 0) {
          results[existingIndexInAvailableDevices] = r;
        } else if (existingIndexInPairedDevices >= 0) {
          pairedDevices[existingIndexInPairedDevices] = r;
        } else if (r.device.isBonded) {
          pairedDevices.add(r);
        } else {
          results.add(r);
        }
      });
    });

    _streamSubscription!.onDone(() {
      setState(() {
        isDiscovering = false;
      });
    });
  }

  @override
  void dispose() {
    // cancel discovery
    _streamSubscription?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.darkColor,
        appBar: AppBar(
          elevation: 2,
          title: isDiscovering
              ? const Text('Discovering devices')
              : const Text('Discovered devices'),
          actions: <Widget>[
            isDiscovering
                ? FittedBox(
                    child: Container(
                      margin: const EdgeInsets.all(16.0),
                      child: const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  )
                : IconButton(
                    icon: const Icon(Icons.replay),
                    onPressed: _restartDiscovery,
                  )
          ],
        ),
        body: SizedBox(
          height: getDisplayHeight(context),
          width: getDisplayWidth(context),
          child: SingleChildScrollView(
            child: SizedBox(
              width: getDisplayWidth(context),
              height: getDisplayHeight(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Paired Devices"),
                  ),
                  getPairedDevices(),
                  const SizedBox(
                    height: 50,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Available Devices"),
                  ),
                  getAvailableDevices()
                ],
              ),
            ),
          ),
        ));
  }

  getAvailableDevices() {
    return Expanded(
      child: SizedBox(
        width: getDisplayWidth(context),
        child: Column(
            children: List.generate(
          results.length,
          (index) {
            BluetoothDiscoveryResult result = results[index];
            final device = result.device;
            final address = device.address;
            if (device.name != null) {
              return BluetoothDeviceListEntry(
                device: device,
                rssi: result.rssi,
                onTap: () async {
                  try {
                    bool bonded = false;

                    // ignore: avoid_print
                    print('Bonding with ${device.address}...');
                    setState(() {
                      results[results.indexOf(result)] =
                          BluetoothDiscoveryResult(
                              device: BluetoothDevice(
                                name: device.name ?? '',
                                address: "Connecting",
                                type: device.type,
                                bondState: bonded
                                    ? BluetoothBondState.bonded
                                    : BluetoothBondState.none,
                              ),
                              rssi: result.rssi);
                    });
                    bonded = (await FlutterBluetoothSerial.instance
                        .bondDeviceAtAddress(address))!;
                    // ignore: avoid_print
                    print(
                        'Bonding with ${device.address} has ${bonded ? 'succeeded' : 'failed'}.');

                    setState(() {
                      // remove from available devices
                      results.removeAt(results.indexOf(result));
                      //add to paired devices
                      pairedDevices.add(BluetoothDiscoveryResult(
                          device: BluetoothDevice(
                            name: device.name ?? '',
                            address: address,
                            type: device.type,
                            bondState: bonded
                                ? BluetoothBondState.bonded
                                : BluetoothBondState.none,
                          ),
                          rssi: result.rssi));
                    });
                  } catch (ex) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Error occured while bonding'),
                          content: Text(ex.toString()),
                          actions: <Widget>[
                            TextButton(
                              child: const Text("Close"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              );
            } else {
              return Container();
            }
          },
        )),
      ),
    );
  }

  getPairedDevices() {
    return SizedBox(
      width: getDisplayWidth(context),
      child: Column(
          children: List.generate(
        pairedDevices.length,
        (index) {
          BluetoothDiscoveryResult result = pairedDevices[index];
          final device = result.device;

          if (device.name != null) {
            return BluetoothDeviceListEntry(
              device: device,
              rssi: result.rssi,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DeviceScreen(device: device)));
              },
            );
          } else {
            return Container();
          }
        },
      )),
    );
  }
}
