import 'package:ecg/config/theme/app_colors.dart';
import 'package:ecg/helpers/constants/asset_constants.dart';
import 'package:flutter/material.dart';
import 'package:ecg/config/theme/app_text_theme.dart';
import 'package:flutter_svg/svg.dart';

class TopUpCard extends StatelessWidget {
  const TopUpCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: AppColors.ecgYellow100,
            child: SvgPicture.asset(kLightBulb),
          ),
          title: Text(
            'Recharge successful',
            style: Theme.of(context).textTheme.ecgBody700,
          ),
        ),
      ],
    );
  }
}
