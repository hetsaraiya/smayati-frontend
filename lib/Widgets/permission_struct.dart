import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
// import 'package:samyati/Pages/Logins/otp.dart';
import 'package:samyati/Pages/welcome.dart';
import 'package:samyati/Theme/theme_modal.dart';

class PermissionPage extends StatelessWidget {
  const PermissionPage({
    Key? key,
    required this.title,
    required this.indication,
    required this.ifButton,
    required this.mainButton,
    required this.img,
  }) : super(key: key);

  final String title;
  final String img;
  final Widget indication;
  final Widget ifButton;
  final Widget mainButton;

  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;
    return Consumer(builder: (context, ThemeModal themeNotifier, child) {
      return AnnotatedRegion(
        value: themeNotifier.isDark
            ? SystemUiOverlayStyle.dark
            : SystemUiOverlayStyle.light,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 280),
                    child: InkWell(
                      child: SvgPicture.asset((themeNotifier.isDark)
                          ? "assets/images/leftarrow.svg"
                          : "assets/images/lightleftarrow.svg"),
                      onTap: () => {
                        Navigator.of(context).pop(
                          MaterialPageRoute(
                            builder: (context) => WelcomePage(),
                          ),
                        ),
                      },
                    ),
                  ),
                  Text(
                    title,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Image.asset(
                    img,
                    width: 284.74,
                    height: currentHeight < 670 ? 280 : 340.3,
                  ),
                  indication,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ifButton,
                      mainButton,
                    ],
                  ),
                ]),
          ),
        ),
      );
    });
  }
}
