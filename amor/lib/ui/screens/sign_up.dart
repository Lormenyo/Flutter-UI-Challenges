import 'package:amor/constants/assets_constants.dart';
import 'package:amor/ui/screens/home_screen.dart';
import 'package:amor/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 200,
            ),
            SvgPicture.asset(
              kAppLogo,
              width: 200,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  controller: controller,
                  onChanged: (value) {
                    setState(() {
                      controller.text = value;
                    });
                  },
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      filled: false,
                      hintText: "Username",
                      hintStyle: Theme.of(context).textTheme.displaySmall,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.lightGreyColor),
                      ),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.darkGreyColor))),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              child: FilledButton(
                  onPressed: controller.text == ""
                      ? null
                      : () {
                          saveUser();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                        },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Start Rizing",
                        textAlign: TextAlign.center,
                      ),
                      Icon(Icons.keyboard_double_arrow_right),
                    ],
                  )),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }

  saveUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('username', controller.text);
  }
}
