import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samyati/Theme/theme_modal.dart';

class Updates extends StatelessWidget {
  const Updates({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModal themeNotifier, child) {
      return const Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 120,
              ),
              Text("No Updates For Now"),
            ],
          ),
        ),
      );
    });
  }
}
