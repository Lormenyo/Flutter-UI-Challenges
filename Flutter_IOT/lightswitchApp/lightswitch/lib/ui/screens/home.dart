import 'package:flutter/material.dart';
import 'package:lightswitch/helpers/size_helper.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Light Switch"),
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
