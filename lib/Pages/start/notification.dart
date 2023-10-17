import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samyati/Pages/start/gotit.dart';
import 'package:samyati/Theme/colos.dart';
import 'package:samyati/Theme/theme_modal.dart';
import 'package:samyati/Widgets/permission_struct.dart';

void main(List<String> args) {
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic notifications',
        channelDescription: 'Notification tests as alerts',
        playSound: true,
        defaultColor: Colors.redAccent,
        ledColor: Colors.white,
      ),
    ],
    debug: true,
  );
}

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    super.initState();
  }

  triggerNotification() {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 10,
        channelKey: 'basic_channel',
        title: 'Thanks for subscribing',
        body: 'We are glad to have you',
        actionType: ActionType.Default,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PermissionPage(
      img: "assets/images/healthkit.png",
      title:
          "We’ll start converting your steps from 09 : 18 : 00. Would you like to receive push notifications so i can help you progress?",
      ifButton: const SizedBox(),
      mainButton: SizedBox(
        width: 140.00,
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
            triggerNotification(),
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const GotItPage(),
              ),
            ),
          },
          child: Text(
            "Yes, Please",
            style: TextStyle(color: Constants().lightTextColor),
          ),
        ),
      ),
      indication: Consumer(builder: (context, ThemeModal themeNotifier, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
          ],
        );
      }),
    );
  }
}
