import 'package:flutter/material.dart';
import 'package:lightswitch/constants/colors.dart';
import 'package:lightswitch/helpers/size_helper.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int scaffoldBgColor = AppColors.darkColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(scaffoldBgColor),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Light Switch",
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        height: getDisplayHeight(context),
        width: getDisplayWidth(context),
        decoration: const BoxDecoration(),
        child: const Stack(
          children: [],
        ),
      ),
    );
  }
}
