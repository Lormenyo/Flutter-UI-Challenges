import 'package:ecg/helpers/constants/asset_constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Stack(
        children: [
          Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('Hello Hannah'),
                  Image.asset(
                    kHandWave,
                    width: 20,
                    height: 20,
                  ),
                  const Spacer(),
                  const CircleAvatar(
                    backgroundImage: AssetImage(kHannahProfile),
                  )
                ],
              ))
        ],
      ),
    ));
  }
}
