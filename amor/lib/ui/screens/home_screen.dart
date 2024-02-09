import 'package:amor/constants/assets_constants.dart';
import 'package:amor/ui/screens/rizz_screen.dart';
import 'package:amor/ui/screens/shoot_shot_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hannah",
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge
                      ?.copyWith(fontSize: 20),
                ),
                SvgPicture.asset(
                  kAppLogo,
                  width: 200,
                )
              ],
            ),
            selectedPageIndex == 0
                ? const RizzScreen()
                : const ShootShotScreen()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedPageIndex,
          onTap: (index) {
            setState(() {
              selectedPageIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                label: "Rizz Up", icon: Icon(Icons.chat_outlined)),
            BottomNavigationBarItem(
                label: "Shoot Your Shot", icon: Icon(Icons.favorite)),
          ]),
    );
  }
}
