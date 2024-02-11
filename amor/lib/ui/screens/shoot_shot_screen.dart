import 'package:amor/constants/assets_constants.dart';
import 'package:amor/helpers/randomizer.dart';
import 'package:amor/ui/screens/yes_screen.dart';
import 'package:amor/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShootShotScreen extends StatefulWidget {
  const ShootShotScreen({super.key});

  @override
  State<ShootShotScreen> createState() => _ShootShotScreenState();
}

class _ShootShotScreenState extends State<ShootShotScreen> {
  double noButtonLeft = 130;
  double noButtonRight = 0;
  double noButtonBottom = 100;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 270,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned(
              left: 0, right: 0, top: 10, child: SvgPicture.asset(kValentine)),
          Positioned(
            left: 0,
            right: 0,
            top: 350,
            child: Text(
              "Will you be my Valentine?",
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
              left: 0,
              right: 100,
              bottom: 100,
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                      width: 100,
                      child: FilledButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const YesScreen()));
                          },
                          child: const Text("Yes"))))),
          Positioned(
            left: noButtonLeft,
            right: noButtonRight,
            bottom: noButtonBottom,
            child: Align(
              child: SizedBox(
                width: 100,
                child: FilledButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.redColor),
                    ),
                    onPressed: onNoButtonInteract,
                    onHover: (value) => onNoButtonInteract(),
                    child: const Text("No")),
              ),
            ),
          )
        ],
      ),
    );
  }

  onNoButtonInteract() {
    var newWidth =
        Randomizer.random(0, MediaQuery.of(context).size.width.toInt() - 100);

    var newHeight = Randomizer.random(0, 200);

    setState(() {
      noButtonBottom = newHeight.toDouble();
      noButtonLeft = newWidth.toDouble();
    });
  }
}
