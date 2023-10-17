import 'package:flutter/material.dart';


class AppBarWidget extends StatelessWidget {
  final String? title;
  const AppBarWidget({super.key,this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/user.png",
          height: 54,
          width: 54,
          fit: BoxFit.contain,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello, $title",
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 14),
            ),
            Text(
              "Good Afternoon!",
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 21,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(),
      ],
    );
  }
}
