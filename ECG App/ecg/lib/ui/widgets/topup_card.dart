import 'package:ecg/controllers/app_theme_controller.dart';
import 'package:ecg/ui/theme/app_colors.dart';
import 'package:ecg/helpers/constants/asset_constants.dart';
import 'package:flutter/material.dart';
import 'package:ecg/ui/theme/app_text_theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class TopUpCard extends StatelessWidget {
  const TopUpCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appTheme = Provider.of<AppThemeNotifier>(context);

    return Container(
      height: 125,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color:
              appTheme.isDarkMode ? AppColors.ecgDark300 : AppColors.ecgWhite,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 0),
                color: appTheme.isDarkMode
                    ? Colors.transparent
                    : const Color.fromRGBO(127, 131, 156, 0.15),
                blurRadius: 2,
                spreadRadius: 2)
          ]),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: ListTile(
              leading: Container(
                height: 52,
                width: 52,
                decoration: BoxDecoration(
                    color: appTheme.isDarkMode
                        ? AppColors.ecgBrown100
                        : AppColors.ecgYellow100,
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                    child: SvgPicture.asset(
                  kLightBulb,
                )),
              ),
              title: Text(
                'Recharge successful',
                style: Theme.of(context).textTheme.ecgTitle500.copyWith(
                    color: appTheme.isDarkMode
                        ? AppColors.ecgWhite
                        : AppColors.ecgBlack),
              ),
              subtitle: RichText(
                text: TextSpan(
                    text:
                        'Your recharge was successfully processed. Transaction id ',
                    children: [
                      TextSpan(
                          text: 'PRE99037303090271',
                          style:
                              Theme.of(context).textTheme.ecgTitle700.copyWith(
                                    color: AppColors.ecgGrey300,
                                  )),
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
                    backgroundColor: appTheme.isDarkMode
                        ? Colors.transparent
                        : AppColors.ecgBlue200,
                    child: SvgPicture.asset(kCopyIcon),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
