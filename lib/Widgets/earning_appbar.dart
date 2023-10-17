import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samyati/Theme/theme_modal.dart';

class EarningAppBar extends StatelessWidget {
  const EarningAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModal themeNotifier, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Earnings & Rewords",
            style: TextStyle(
                fontSize: 18,
                color: themeNotifier.isDark
                    ? const Color.fromRGBO(16, 16, 16, 1)
                    : const Color.fromRGBO(243, 243, 243, 1),
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(),
        ],
      );
    });
  }
}
