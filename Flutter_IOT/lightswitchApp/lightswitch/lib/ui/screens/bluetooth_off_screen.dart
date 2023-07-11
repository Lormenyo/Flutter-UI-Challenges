import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:lightswitch/constants/colors.dart';

class BluetoothOffScreen extends StatefulWidget {
  const BluetoothOffScreen({super.key});

  @override
  State<BluetoothOffScreen> createState() => _BluetoothOffScreenState();
}

class _BluetoothOffScreenState extends State<BluetoothOffScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Icon(
              Icons.bluetooth_disabled,
              size: 200.0,
              color: Colors.white54,
            ),
            Text(
              'Your Bluetooth is OFF ',
              style: Theme.of(context)
                  .primaryTextTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: onTurnOnPressed,
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.brightColor)),
              child: const Text(
                'TURN ON',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onTurnOnPressed() {
    // Do the request and update with the true value then
    future() async {
      await FlutterBluetoothSerial.instance.requestEnable();
    }

    future().then((_) {
      setState(() {});
    });
  }
}
