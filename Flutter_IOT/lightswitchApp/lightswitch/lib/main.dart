// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:lightswitch/ui/screens/bluetooth_off_screen.dart';
import 'package:lightswitch/ui/screens/find_devices.dart';
import 'package:lightswitch/ui/theme/app_theme.dart';
// import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const LightSwitchApp());
}

class LightSwitchApp extends StatefulWidget {
  const LightSwitchApp({Key? key}) : super(key: key);

  @override
  State<LightSwitchApp> createState() => _LightSwitchAppState();
}

class _LightSwitchAppState extends State<LightSwitchApp> {
  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;

  @override
  void initState() {
    super.initState();

    // Get current state
    FlutterBluetoothSerial.instance.state.then((state) {
      setState(() {
        _bluetoothState = state;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.buildTheme(),
        home: _bluetoothState.isEnabled
            ? const FindDevicesScreen()
            : const BluetoothOffScreen());
  }
}
