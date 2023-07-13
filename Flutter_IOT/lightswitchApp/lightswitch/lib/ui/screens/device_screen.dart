import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class DeviceScreen extends StatelessWidget {
  const DeviceScreen({Key? key, required this.device}) : super(key: key);

  final BluetoothDevice device;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text('$device.name'),
        ),
        body: const Column(
          children: [],
        ));
  }

  unPairDevice() async {
    if (device.isBonded) {
      // ignore: avoid_print
      print('Unbonding from ${device.address}...');

      await FlutterBluetoothSerial.instance
          .removeDeviceBondWithAddress(device.address);
      // ignore: avoid_print
      print('Unbonding from ${device.address} has succed');
    }
  }
}
