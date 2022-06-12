import 'package:ecg/config/theme/app_colors.dart';
import 'package:ecg/helpers/constants/asset_constants.dart';
import 'package:flutter/material.dart';
import 'package:ecg/config/theme/app_text_theme.dart';
import 'package:flutter_svg/svg.dart';

class TopUpCard extends StatelessWidget {
  const TopUpCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: AppColors.ecgWhite, borderRadius: BorderRadius.circular(16)),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColors.ecgYellow100,
                child: SvgPicture.asset(kLightBulb),
              ),
              title: Text(
                'Recharge successful',
                style: Theme.of(context).textTheme.ecgBody700,
              ),
              subtitle: RichText(
                text: TextSpan(
                    text:
                        'Your recharge was successfully processed. Transaction id ',
                    children: [
                      TextSpan(
                          text: 'PRE99037303090271',
                          style: Theme.of(context)
                              .textTheme
                              .ecgBody100
                              .copyWith(
                                  color: AppColors.ecgGrey300,
                                  fontWeight: FontWeight.normal)),
                      const TextSpan(text: '; Meter number...')
                    ],
                    style: Theme.of(context)
                        .textTheme
                        .ecgBody100
                        .copyWith(color: AppColors.ecgGrey100)),
              ),
            ),
          ),
          Positioned(
              bottom: 5,
              left: 15,
              right: 15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '21 Feb',
                    style: Theme.of(context)
                        .textTheme
                        .ecgBody100
                        .copyWith(color: AppColors.ecgGrey100),
                  ),
                  CircleAvatar(
                    backgroundColor: AppColors.ecgBlue200,
                    child: SvgPicture.asset(kCopyIcon),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
