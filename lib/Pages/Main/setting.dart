import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import 'package:samyati/Pages/Logins/loginpage.dart';
import 'package:samyati/Pages/help.dart';
import 'package:samyati/Pages/privacypolicy.dart';
import 'package:samyati/Pages/tandc.dart';
import 'package:samyati/Pages/updates.dart';
// import 'package:samyati/Pages/home.dart';
// import 'package:samyati/Pages/InnerPages/test.dart';
import 'package:samyati/Theme/theme_modal.dart';
import 'package:samyati/Widgets/count_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  final String? title;
  const SettingPage({super.key, this.title});

  @override
  State<SettingPage> createState() => _SettingPageState(title: this.title);
}

class _SettingPageState extends State<SettingPage> {
  late String? title;
  bool isVisible = true;
  Future<void> _logout(BuildContext context) async {
    // Clear user-related data from local storage
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear(); // This will clear all stored data, adapt as needed

    // Navigate to the login page or any other initial screen
    Navigator.of(context).pop(
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );

    
    // Optional: You might want to inform the user that they have been logged out
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Logged out successfully!'),
    ));
  }

  _SettingPageState({required this.title});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModal themeNotifier, child) {
      return Center(
        child: SingleChildScrollView(
          padding:
              const EdgeInsets.only(top: 130, right: 20, left: 20, bottom: 120),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CountCard(
                  cardHeight: 71.52,
                  dataBox: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 160,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/user.png",
                                height: 54,
                                width: 54,
                              ),
                              Text(
                                "$title",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: themeNotifier.isDark
                                      ? const Color.fromRGBO(16, 16, 16, 1)
                                      : const Color.fromRGBO(243, 243, 243, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SvgPicture.asset(
                          themeNotifier.isDark
                              ? "assets/images/shortRightIcon.svg"
                              : "assets/images/shortRightIcondark.svg",
                        )
                      ],
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              CountCard(
                cardHeight: 300,
                dataBox: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 0.75,
                              color: themeNotifier.isDark
                                  ? const Color.fromRGBO(255, 255, 255, 1)
                                  : const Color.fromRGBO(111, 111, 111, 1),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Find And Invite Friend",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: themeNotifier.isDark
                                    ? const Color.fromRGBO(16, 16, 16, 1)
                                    : const Color.fromRGBO(243, 243, 243, 1),
                              ),
                            ),
                            SvgPicture.asset(
                              themeNotifier.isDark
                                  ? "assets/images/shortRightIcon.svg"
                                  : "assets/images/shortRightIcondark.svg",
                            )
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 0.75,
                              color: themeNotifier.isDark
                                  ? const Color.fromRGBO(255, 255, 255, 1)
                                  : const Color.fromRGBO(111, 111, 111, 1),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Notifications",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: themeNotifier.isDark
                                    ? const Color.fromRGBO(16, 16, 16, 1)
                                    : const Color.fromRGBO(243, 243, 243, 1),
                              ),
                            ),
                            SvgPicture.asset(
                              themeNotifier.isDark
                                  ? "assets/images/shortRightIcon.svg"
                                  : "assets/images/shortRightIcondark.svg",
                            )
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 0.75,
                              color: themeNotifier.isDark
                                  ? const Color.fromRGBO(255, 255, 255, 1)
                                  : const Color.fromRGBO(111, 111, 111, 1),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Devices",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: themeNotifier.isDark
                                    ? const Color.fromRGBO(16, 16, 16, 1)
                                    : const Color.fromRGBO(243, 243, 243, 1),
                              ),
                            ),
                            SvgPicture.asset(
                              themeNotifier.isDark
                                  ? "assets/images/shortRightIcon.svg"
                                  : "assets/images/shortRightIcondark.svg",
                            )
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 0.75,
                              color: themeNotifier.isDark
                                  ? const Color.fromRGBO(255, 255, 255, 1)
                                  : const Color.fromRGBO(111, 111, 111, 1),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Account Privacy",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: themeNotifier.isDark
                                    ? const Color.fromRGBO(16, 16, 16, 1)
                                    : const Color.fromRGBO(243, 243, 243, 1),
                              ),
                            ),
                            SvgPicture.asset(
                              themeNotifier.isDark
                                  ? "assets/images/shortRightIcon.svg"
                                  : "assets/images/shortRightIcondark.svg",
                            )
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 0.75,
                              color: themeNotifier.isDark
                                  ? const Color.fromRGBO(255, 255, 255, 1)
                                  : const Color.fromRGBO(111, 111, 111, 1),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Refer and Earn",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: themeNotifier.isDark
                                    ? const Color.fromRGBO(16, 16, 16, 1)
                                    : const Color.fromRGBO(243, 243, 243, 1),
                              ),
                            ),
                            SvgPicture.asset(
                              themeNotifier.isDark
                                  ? "assets/images/shortRightIcon.svg"
                                  : "assets/images/shortRightIcondark.svg",
                            )
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Link  Satpay",
                              style: TextStyle(
                                fontSize: 14,
                                color: themeNotifier.isDark
                                    ? const Color.fromRGBO(16, 16, 16, 1)
                                    : const Color.fromRGBO(243, 243, 243, 1),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SvgPicture.asset(
                              themeNotifier.isDark
                                  ? "assets/images/shortRightIcon.svg"
                                  : "assets/images/shortRightIcondark.svg",
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CountCard(
                cardHeight: 71.52,
                dataBox: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Appearance",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: themeNotifier.isDark
                              ? const Color.fromRGBO(16, 16, 16, 1)
                              : const Color.fromRGBO(243, 243, 243, 1),
                        ),
                      ),
                      Consumer(
                        builder: (context, ThemeModal themeNotifier, child) {
                          return FlutterSwitch(
                              width: 70.0,
                              height: 35.0,
                              value: themeNotifier.isDark ? false : true,
                              borderRadius: 30.0,
                              padding: 3,
                              showOnOff: false,
                              activeColor:
                                  const Color.fromRGBO(211, 211, 211, 1),
                              inactiveColor:
                                  const Color.fromRGBO(211, 211, 211, 1),
                              activeToggleColor:
                                  const Color.fromRGBO(240, 82, 37, 1),
                              inactiveToggleColor:
                                  const Color.fromRGBO(240, 82, 37, 1),
                              toggleSize: 35.0,
                              activeIcon: SvgPicture.asset(
                                "assets/images/moon.svg",
                                height: 40,
                                width: 40,
                              ),
                              inactiveIcon: SvgPicture.asset(
                                "assets/images/sun.svg",
                                height: 40,
                                width: 40,
                              ),
                              onToggle: (value) {
                                themeNotifier.isDark
                                    ? themeNotifier.isDark = false
                                    : themeNotifier.isDark = true;
                              });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CountCard(
                cardHeight: 300,
                dataBox: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 0.75,
                            color: themeNotifier.isDark
                                ? const Color.fromRGBO(255, 255, 255, 1)
                                : const Color.fromRGBO(111, 111, 111, 1),
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () => {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const Help(),
                                ),
                              ),
                            },
                            child: Text(
                              "Help",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: themeNotifier.isDark
                                    ? const Color.fromRGBO(16, 16, 16, 1)
                                    : const Color.fromRGBO(243, 243, 243, 1),
                              ),
                            ),
                          ),
                          SvgPicture.asset(
                            themeNotifier.isDark
                                ? "assets/images/shortRightIcon.svg"
                                : "assets/images/shortRightIcondark.svg",
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 0.75,
                            color: themeNotifier.isDark
                                ? const Color.fromRGBO(255, 255, 255, 1)
                                : const Color.fromRGBO(111, 111, 111, 1),
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const TandC(),
                                ),
                              ),
                            },
                            child: Text(
                              "Terms and Conditions",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: themeNotifier.isDark
                                    ? const Color.fromRGBO(16, 16, 16, 1)
                                    : const Color.fromRGBO(243, 243, 243, 1),
                              ),
                            ),
                          ),
                          SvgPicture.asset(
                            themeNotifier.isDark
                                ? "assets/images/shortRightIcon.svg"
                                : "assets/images/shortRightIcondark.svg",
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 0.75,
                            color: themeNotifier.isDark
                                ? const Color.fromRGBO(255, 255, 255, 1)
                                : const Color.fromRGBO(111, 111, 111, 1),
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const PrivacyPolicy(),
                                ),
                              ),
                            },
                            child: Text(
                              "Privacy Policy",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: themeNotifier.isDark
                                    ? const Color.fromRGBO(16, 16, 16, 1)
                                    : const Color.fromRGBO(243, 243, 243, 1),
                              ),
                            ),
                          ),
                          SvgPicture.asset(
                            themeNotifier.isDark
                                ? "assets/images/shortRightIcon.svg"
                                : "assets/images/shortRightIcondark.svg",
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 0.75,
                            color: themeNotifier.isDark
                                ? const Color.fromRGBO(255, 255, 255, 1)
                                : const Color.fromRGBO(111, 111, 111, 1),
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const Updates(),
                                ),
                              ),
                            },
                            child: Text(
                              "Check Updates",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: themeNotifier.isDark
                                    ? const Color.fromRGBO(16, 16, 16, 1)
                                    : const Color.fromRGBO(243, 243, 243, 1),
                              ),
                            ),
                          ),
                          SvgPicture.asset(
                            themeNotifier.isDark
                                ? "assets/images/shortRightIcon.svg"
                                : "assets/images/shortRightIcondark.svg",
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 0.75,
                            color: themeNotifier.isDark
                                ? const Color.fromRGBO(255, 255, 255, 1)
                                : const Color.fromRGBO(111, 111, 111, 1),
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Version",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: themeNotifier.isDark
                                  ? const Color.fromRGBO(16, 16, 16, 1)
                                  : const Color.fromRGBO(243, 243, 243, 1),
                            ),
                          ),
                          Text(
                            "1.2.04vs(Beta)",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: themeNotifier.isDark
                                  ? const Color.fromRGBO(16, 16, 16, 0.5)
                                  : const Color.fromRGBO(243, 243, 243, 0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Show confirmation dialog
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Confirm Deletion"),
                                    content: Text(
                                        "Are you sure you want to delete your account?"),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          // Close the dialog
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("Cancel"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          // Close the dialog
                                          Navigator.of(context).pop();

                                          _logout(context);
                                          // For now, you can print a message
                                          print("Account deleted!");
                                        },
                                        child: Text("Delete"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Text(
                              "Delete Account",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(255, 61, 18, 1),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
