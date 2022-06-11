import 'package:ecg/config/theme/app_colors.dart';
import 'package:ecg/controllers/bottom_navbar_controller.dart';
import 'package:ecg/helpers/constants/asset_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ECGBottomNavBar extends StatelessWidget {
  const ECGBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavBarNotifier>(
        builder: (context, bottomNavState, _) {
      return BottomNavigationBar(
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
            icon: Container(),
            label: '',
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
