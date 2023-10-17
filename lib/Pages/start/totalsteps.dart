import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samyati/Pages/start/healthkit.dart';
import 'package:samyati/Theme/colos.dart';
import 'package:samyati/Theme/theme_modal.dart';
import 'package:samyati/Widgets/permission_struct.dart';

class TotalSteps extends StatelessWidget {
  const TotalSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return PermissionPage(
      img: "assets/images/healthkit.png",
      title: "Please let me see the total steps your phone detects",
      mainButton: SizedBox(
        width: 117.00,
        height: 40,
        child: ElevatedButton(
          style: TextButton.styleFrom(
            elevation: 3,
            side: const BorderSide(
                width: 0.75, color: Color.fromRGBO(255, 255, 255, 1)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0)),
            backgroundColor: const Color.fromRGBO(243, 243, 243, 1),
          ),
          onPressed: () => {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HealthKitPage(),
              ),
            ),
          },
          child: Text(
            "Allow",
            style: TextStyle(color: Constants().lightTextColor),
          ),
        ),
      ),
      ifButton: const SizedBox(),
      indication: Consumer(builder: (context, ThemeModal themeNotifier, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 25,
              height: 8,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: themeNotifier.isDark
                      ? const Color.fromRGBO(16, 16, 16, 1)
                      : const Color.fromRGBO(207, 207, 207, 1),
                ),
              ),
            ),
            SizedBox(
              width: 25,
              height: 4,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(207, 207, 207, 1)),
              ),
            ),
            SizedBox(
              width: 25,
              height: 4,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(207, 207, 207, 1)),
              ),
            ),
            SizedBox(
              width: 25,
              height: 4,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(207, 207, 207, 1)),
              ),
            ),
          ],
        );
      }),
    );
  }
}
