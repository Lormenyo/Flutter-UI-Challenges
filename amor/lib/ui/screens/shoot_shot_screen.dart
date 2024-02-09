import 'package:amor/constants/assets_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShootShotScreen extends StatefulWidget {
  const ShootShotScreen({super.key});

  @override
  State<ShootShotScreen> createState() => _ShootShotScreenState();
}

class _ShootShotScreenState extends State<ShootShotScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(kValentine),
        Text(
          "Will you be my Valentine?",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(onPressed: () {}, child: Text("Yes")),
            const SizedBox(
              width: 10,
            ),
            FilledButton(onPressed: () {}, child: Text("No"))
          ],
        )
      ],
    );
  }
}
