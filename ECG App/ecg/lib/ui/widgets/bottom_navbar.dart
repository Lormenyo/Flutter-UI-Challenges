import 'package:ecg/controllers/app_theme_controller.dart';
import 'package:ecg/ui/theme/app_colors.dart';
import 'package:ecg/controllers/bottom_navbar_controller.dart';
import 'package:ecg/helpers/constants/asset_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ECGBottomNavBar extends StatelessWidget {
  const ECGBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appTheme = Provider.of<AppThemeNotifier>(context);

    return Consumer<BottomNavBarNotifier>(
        builder: (context, bottomNavState, _) {
      return BottomNavigationBar(
        backgroundColor:
            appTheme.isDarkMode ? AppColors.ecgDark300 : AppColors.ecgWhite,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(kPresentation),
            label: 'Home',
            activeIcon: SvgPicture.asset(kPresentation),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(kNotifications),
            label: 'Notifications',
            activeIcon: SvgPicture.asset(kNotifications),
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.ecgBlue700,
                    boxShadow: [
                      BoxShadow(
                          color: appTheme.isDarkMode
                              ? AppColors.ecgDark300
                              : AppColors.ecgBlue200,
                          spreadRadius: 15,
                          blurRadius: 7,
                          offset: const Offset(0, 0))
                    ]),
                child: const Icon(
                  Icons.add,
                  color: AppColors.ecgWhite,
                ),
              ),
              onTap: () {},
            ),
            label: 'Add',
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(kSettings),
              label: 'Settings',
              activeIcon: SvgPicture.asset(kSettings)),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(kProfile),
              label: 'Profile',
              activeIcon: SvgPicture.asset(kProfile)),
        ],
        currentIndex: bottomNavState.index,
        selectedItemColor: AppColors.ecgBlue700,
        onTap: (int value) {
          bottomNavState.updateIndex(value);
        },
      );
    });
  }
}
