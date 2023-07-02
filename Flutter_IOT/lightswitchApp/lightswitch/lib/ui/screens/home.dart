import 'package:flutter/material.dart';
import 'package:lightswitch/constants/assert_paths.dart';
import 'package:lightswitch/constants/colors.dart';
import 'package:lightswitch/helpers/size_helper.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool lightOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightOn ? AppColors.brightColor : AppColors.darkColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Light Switch",
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: SizedBox(
        height: getDisplayHeight(context),
        width: getDisplayWidth(context),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                  height: 400,
                  width: getDisplayWidth(context),
                  child:
                      Image.asset(Assets.bulbWithLine, fit: BoxFit.fitHeight)),
            ),
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    lightOn = !lightOn;
                  });
                },
                child: lightOn ? lightToggleSwitch() : darkToggleSwitch(),
              ),
            )
          ],
        ),
      ),
    );
  }

  darkToggleSwitch() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(Assets.darkToggle))),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.only(left: 51, bottom: 5),
          child: const CircleAvatar(
            radius: 42,
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }

  lightToggleSwitch() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(Assets.lightToggle))),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          margin: const EdgeInsets.only(right: 50, bottom: 10),
          child: CircleAvatar(
            radius: 40,
            backgroundColor: AppColors.brightColor,
          ),
        ),
      ),
    );
  }
}
