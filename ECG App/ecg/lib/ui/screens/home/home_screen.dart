import 'package:ecg/ui/theme/app_colors.dart';
import 'package:ecg/controllers/app_theme_controller.dart';
import 'package:ecg/helpers/constants/asset_constants.dart';
import 'package:ecg/ui/widgets/badge.dart' as badge;
import 'package:ecg/ui/widgets/bottom_navbar.dart';
import 'package:ecg/ui/widgets/topup_card.dart';
import 'package:flutter/material.dart';
import 'package:ecg/ui/theme/app_text_theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum Menu { darkMode, logOut }

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: const ECGBottomNavBar(),
    );
  }

  Widget getBody() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 70,
          ),
          getTopBar(),
          const SizedBox(
            height: 20,
          ),
          getTopCard(context),
          const SizedBox(
            height: 20,
          ),
          getEnergyUsage(),
          const SizedBox(
            height: 20,
          ),
          getActionSection(),
          const SizedBox(
            height: 20,
          ),
          getRecentTopUp()
        ],
      ),
    );
  }

  Widget getTopBar() {
    var appTheme = Provider.of<AppThemeNotifier>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Hello Hannah',
            style: Theme.of(context).textTheme.ecgTitle700.copyWith(
                color: appTheme.isDarkMode
                    ? AppColors.ecgWhite
                    : AppColors.ecgBlack),
          ),
          const SizedBox(
            width: 7,
          ),
          Image.asset(
            kHandWave,
            width: 20,
            height: 20,
          ),
          const Spacer(),
          getProfileDropdown(context)
        ],
      ),
    );
  }

  Widget getTopCard(BuildContext context) {
    var appTheme = Provider.of<AppThemeNotifier>(context);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      shadowColor: AppColors.ecgBlue200,
      elevation: 4,
      child: Container(
        height: 106,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: AppColors.ecgDeepBlueGradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                  color: appTheme.isDarkMode
                      ? AppColors.ecgDark400
                      : AppColors.ecgBlue200,
                  blurRadius: 3,
                  spreadRadius: 5,
                  offset: const Offset(6, 10)),
            ],
            borderRadius: BorderRadius.circular(16)),
        child: Stack(
          children: [
            Positioned(
                top: 15,
                left: 15,
                child: SizedBox(
                  width: 196,
                  child: Text(
                    'What would you like to do today',
                    style: Theme.of(context)
                        .textTheme
                        .ecgTitle700
                        .copyWith(color: AppColors.ecgWhite),
                  ),
                )),
            Positioned(
                bottom: 15,
                left: 15,
                child: Text(
                  '23 Feb 2022',
                  style: Theme.of(context)
                      .textTheme
                      .ecgBody100
                      .copyWith(color: AppColors.ecgBlue300),
                )),
            Positioned(
                top: 0,
                right: 30,
                child: Image.asset(
                  kLightBulbColor,
                  width: 100,
                ))
          ],
        ),
      ),
    );
  }

  Widget getEnergyUsage() {
    var appTheme = Provider.of<AppThemeNotifier>(context);

    return Container(
      padding: const EdgeInsets.only(left: 10, right: 5),
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: appTheme.isDarkMode
              ? AppColors.ecgDark300a60
              : AppColors.ecgBlue200),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Text('Energy usage today',
              style: Theme.of(context).textTheme.ecgTitle700.copyWith(
                  fontSize: 12,
                  color: appTheme.isDarkMode
                      ? AppColors.ecgBlue750
                      : AppColors.ecgBlue700)),
          const Spacer(),
          Container(
            height: 40,
            width: 126,
            padding:
                const EdgeInsets.only(left: 15, right: 0, top: 5, bottom: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: appTheme.isDarkMode
                    ? AppColors.ecgDark500
                    : AppColors.ecgBlue300),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '30.4kWh',
                  style: Theme.of(context).textTheme.ecgTitle700.copyWith(
                      fontSize: 12,
                      color: appTheme.isDarkMode
                          ? AppColors.ecgWhite
                          : AppColors.ecgDarkBlue),
                ),
                const Spacer(),
                CircleAvatar(
                    backgroundColor: AppColors.ecgWhite20,
                    radius: 28,
                    child: CircleAvatar(
                        radius: 26,
                        backgroundColor: appTheme.isDarkMode
                            ? AppColors.ecgBlack
                            : AppColors.ecgWhite,
                        child: Image.asset(
                          kLightning,
                        )))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getActionSection() {
    var appTheme = Provider.of<AppThemeNotifier>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Actions',
            style: Theme.of(context).textTheme.ecgTitle900.copyWith(
                color: appTheme.isDarkMode
                    ? AppColors.ecgWhite
                    : AppColors.ecgBlack),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 71,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      color: AppColors.ecgBlue700,
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    children: [
                      CircleAvatar(
                          backgroundColor:
                              const Color.fromRGBO(255, 255, 255, 0.4),
                          child: SvgPicture.asset(
                            kLightBulb,
                            color: AppColors.ecgWhite,
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Text(
                          'Meter Management',
                          style: Theme.of(context)
                              .textTheme
                              .ecgBody700
                              .copyWith(
                                  color: AppColors.ecgWhite,
                                  fontWeight: FontWeight.normal),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  height: 71,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      color: appTheme.isDarkMode
                          ? AppColors.ecgGrey100
                          : AppColors.ecgWhite,
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    children: [
                      CircleAvatar(
                          backgroundColor: AppColors.ecgBlue200,
                          child: SvgPicture.asset(kComment)),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Report issue',
                        style: Theme.of(context).textTheme.ecgTitle700.copyWith(
                            color: appTheme.isDarkMode
                                ? AppColors.ecgWhite
                                : AppColors.ecgBlack),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        getToken()
      ],
    );
  }

  Widget getToken() {
    var appTheme = Provider.of<AppThemeNotifier>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor:
            appTheme.isDarkMode ? AppColors.ecgGrey100 : AppColors.ecgWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        leading: CircleAvatar(
          backgroundColor: AppColors.ecgBlue200,
          child: SvgPicture.asset(kShield),
        ),
        title: Text(
          'Tokens',
          style: Theme.of(context).textTheme.ecgTitle700.copyWith(
              color: appTheme.isDarkMode
                  ? AppColors.ecgWhite
                  : AppColors.ecgBlack),
        ),
        subtitle: Text(
          'Credit didn’t reflect? Find all your tokens.',
          style: Theme.of(context).textTheme.ecgBody100.copyWith(
              color: appTheme.isDarkMode
                  ? AppColors.ecgWhite40
                  : AppColors.ecgGrey100),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: AppColors.ecgBlack,
        ),
      ),
    );
  }

  Widget getRecentTopUp() {
    var appTheme = Provider.of<AppThemeNotifier>(context);

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Recent Top Ups',
                  style: Theme.of(context).textTheme.ecgTitle900.copyWith(
                      color: appTheme.isDarkMode
                          ? AppColors.ecgWhite
                          : AppColors.ecgBlack),
                ),
                const Spacer(),
                Text(
                  'View all',
                  style: Theme.of(context).textTheme.ecgBody100.copyWith(
                      color: appTheme.isDarkMode
                          ? AppColors.ecgGrey250
                          : AppColors.ecgGrey100),
                ),
                const SizedBox(
                  width: 7,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: appTheme.isDarkMode
                      ? AppColors.ecgGrey250
                      : AppColors.ecgGrey100,
                  size: 10,
                )
              ],
            ),
          ),
          Expanded(
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return const TopUpCard();
                  }),
            ),
          )
        ],
      ),
    );
  }
}

// Widget getProfileDropdown() {
//   return DropdownButton<St>(
//     value: "dropdownValue",
//     icon:           const Badge(
//             badgeColor: AppColors.ecgPurple,
//             child: CircleAvatar(
//               backgroundImage: AssetImage(kHannahProfile),
//               radius: 15,
//             ),

//           ),
//     elevation: 16,
//     style: const TextStyle(color: Colors.deepPurple),
//     underline: Container(
//       height: 2,
//       color: Colors.deepPurpleAccent,
//     ),
//     onChanged: (String? newValue) {

//     },
//     items: [],
//   );
// }

Widget getProfileDropdown(BuildContext context) {
  var apptheme = Provider.of<AppThemeNotifier>(context);

  return PopupMenuButton<Menu>(
      icon: const badge.Badge(
        badgeColor: AppColors.ecgPurple,
        child: CircleAvatar(
          backgroundImage: AssetImage(kHannahProfile),
          radius: 15,
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      // Callback that sets the selected popup menu item.
      onSelected: (Menu item) {},
      itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
            PopupMenuItem<Menu>(
              value: Menu.darkMode,
              child: Row(
                children: [
                  Icon(
                      apptheme.isDarkMode ? Icons.light_mode : Icons.dark_mode),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    apptheme.isDarkMode ? 'Light Mode' : 'Dark Mode',
                    style: TextStyle(
                        color: apptheme.isDarkMode
                            ? AppColors.ecgWhite
                            : AppColors.ecgBlack),
                  ),
                ],
              ),
              onTap: () {
                apptheme.updateTheme(!apptheme.isDarkMode);
              },
            ),
            PopupMenuItem<Menu>(
              value: Menu.logOut,
              child: Row(
                children: [
                  const Icon(Icons.logout),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Log Out',
                    style: TextStyle(
                        color: apptheme.isDarkMode
                            ? AppColors.ecgWhite
                            : AppColors.ecgBlack),
                  )
                ],
              ),
            ),
          ]);
}
