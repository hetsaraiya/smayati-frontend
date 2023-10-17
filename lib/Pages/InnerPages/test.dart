import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:samyati/Pages/Main/setting.dart';
import 'package:samyati/Theme/theme_modal.dart';

// ignore: camel_case_types
class testPage extends StatelessWidget {
  const testPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModal themeNotifier, child) {
      return Center(
        child: InkWell(
          child: SvgPicture.asset((themeNotifier.isDark)
              ? "assets/images/leftarrow.svg"
              : "assets/images/lightleftarrow.svg"),
          onTap: () => {
            Navigator.of(context).pop(
              MaterialPageRoute(
                builder: (context) => SettingPage(),
              ),
            ),
          },
        ),
      );
    });
  }
}
