import 'package:amor/ui/screens/sign_up.dart';
import 'package:amor/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      sliderPage(
          context,
          "Rizz up your Rizz",
          "This is where your love finds rhythm, and your heart dances to its melody. Get ready to turn up the heat this Valentine's Day!",
          "assets/svg/rizz-onboarding.svg"),
      sliderPage(
          context,
          "Shoot your shot",
          "This is where every shot is a chance at love. Get ready to take aim at Cupid's arrow this Valentine's Day!",
          'assets/svg/shoot-shot.svg')
    ];

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 50,
              right: 20,
              child: SvgPicture.asset(
                'assets/svg/amor-logo.svg',
                width: 200,
              )),
          Positioned(
            top: 200,
            left: 20,
            child: pages[pageIndex],
          ),
          Positioned(
              bottom: 70,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: pageIndex == 0
                            ? AppColors.darkBlueColor
                            : AppColors.lightGreyColor,
                        radius: 5,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      CircleAvatar(
                        backgroundColor: pageIndex == 1
                            ? AppColors.darkBlueColor
                            : AppColors.lightGreyColor,
                        radius: 5,
                      ),
                    ],
                  ),
                  FilledButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp()));
                      },
                      child: const Row(
                        children: [
                          Text("Skip"),
                          Icon(Icons.keyboard_double_arrow_right),
                        ],
                      ))
                ],
              ))
        ],
      ),
    );
  }

  Widget sliderPage(
      BuildContext context, String title, String subTitle, String svgPath) {
    return GestureDetector(
      onPanUpdate: (details) {
        // Swiping in right direction.
        if (details.delta.dx > 0) {
          setState(() {
            pageIndex = 1;
          });
        }
        // Swiping in left direction.
        if (details.delta.dx < 0) {
          setState(() {
            pageIndex = 0;
          });
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(
            width: 350,
            child: Text(
              subTitle,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          const SizedBox(
            height: 150,
          ),
          SvgPicture.asset(
            svgPath,
            width: 350,
          ),
        ],
      ),
    );
  }
}
