import 'package:ecg/config/theme/app_colors.dart';
import 'package:ecg/helpers/constants/asset_constants.dart';
import 'package:ecg/ui/widgets/badge.dart';
import 'package:ecg/ui/widgets/bottom_navbar.dart';
import 'package:ecg/ui/widgets/topup_card.dart';
import 'package:flutter/material.dart';
import 'package:ecg/config/theme/app_text_theme.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: getFloatingActionButton(),
      // floatingActionButtonLocation:
      //     FloatingActionButtonLocation.miniCenterDocked,
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('Hello Hannah'),
          Image.asset(
            kHandWave,
            width: 20,
            height: 20,
          ),
          const Spacer(),
          const Badge(
            badgeColor: AppColors.ecgPurple,
            child: CircleAvatar(
              backgroundImage: AssetImage(kHannahProfile),
              radius: 15,
            ),
          )
        ],
      ),
    );
  }

  Widget getTopCard(BuildContext context) {
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
            boxShadow: const [
              BoxShadow(
                  color: AppColors.ecgBlue200,
                  blurRadius: 0,
                  spreadRadius: 3,
                  offset: Offset(6, 10)),
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
                        .ecgBody700
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
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 5),
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppColors.ecgBlue200),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Text('Energy usage today',
              style: Theme.of(context)
                  .textTheme
                  .ecgBody700
                  .copyWith(fontSize: 12, color: AppColors.ecgBlue700)),
          const Spacer(),
          Container(
            height: 40,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.ecgBlue300),
            child: Row(
              children: [
                Text(
                  '30.4kWh',
                  style: Theme.of(context)
                      .textTheme
                      .ecgBody700
                      .copyWith(fontSize: 12, color: AppColors.ecgDarkBlue),
                ),
                CircleAvatar(
                    backgroundColor: AppColors.ecgWhite,
                    child: Image.asset(kLightning))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getActionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Actions',
            style: Theme.of(context).textTheme.ecgTitle900,
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
                          backgroundColor: AppColors.ecgBlue200,
                          child: SvgPicture.asset(
                            kLightBulb,
                            color: AppColors.ecgWhite40,
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
                      color: AppColors.ecgWhite,
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
                        'Report',
                        style: Theme.of(context).textTheme.ecgBody700,
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: AppColors.ecgWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        leading: CircleAvatar(
          backgroundColor: AppColors.ecgBlue200,
          child: SvgPicture.asset(kShield),
        ),
        title: Text(
          'Tokens',
          style: Theme.of(context).textTheme.ecgBody700,
        ),
        subtitle: Text(
          'Credit didn’t reflect? Find all your tokens.',
          style: Theme.of(context)
              .textTheme
              .ecgBody100
              .copyWith(color: AppColors.ecgGrey100),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: AppColors.ecgBlack,
        ),
      ),
    );
  }

  Widget getRecentTopUp() {
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
                  style: Theme.of(context).textTheme.ecgTitle900,
                ),
                const Spacer(),
                Text(
                  'View all',
                  style: Theme.of(context)
                      .textTheme
                      .ecgBody100
                      .copyWith(color: AppColors.ecgGrey100),
                ),
                const SizedBox(
                  width: 7,
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.ecgGrey100,
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

  Widget getFloatingActionButton() {
    return FloatingActionButton(onPressed: () {});
  }
}
