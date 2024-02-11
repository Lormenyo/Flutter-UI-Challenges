import 'package:amor/constants/assets_constants.dart';
import 'package:amor/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class YesScreen extends StatelessWidget {
  const YesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: false,
        title: Align(
          alignment: Alignment.bottomRight,
          child: SvgPicture.asset(
            kAppLogo,
            width: 200,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Yaaaaaaaayyyy",
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: AppColors.darkBlueColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Image.asset(kExcitedDance)
          ],
        ),
      ),
    );
  }
}
