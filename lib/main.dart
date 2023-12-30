import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:samyati/Pages/home.dart';
import 'database/mongodb.dart';
import 'package:provider/provider.dart';
import 'package:samyati/Pages/welcome.dart';
import 'package:samyati/Theme/colos.dart';
import 'package:samyati/Theme/theme_modal.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Provider/auth_provider.dart' as aP;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoConnection.connect();
  await Firebase.initializeApp();
  runApp(const samyati());
}

class samyati extends StatefulWidget {
  const samyati({super.key});

  @override
  State<samyati> createState() => _samyatiState();
}

// ignore: camel_case_types
class _samyatiState extends State<samyati> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeModal(),
      child: Consumer(
        builder: (context, ThemeModal themeModal, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => aP.AuthProvider())
            ],
            child: MaterialApp(
                debugShowCheckedModeBanner: false,
                themeMode: ThemeMode.system,
                theme: themeModal.isDark
                    ? ThemeData(
                        brightness: Brightness.light,
                        primaryColor: Constants().lightTextColor,
                        appBarTheme: AppBarTheme(
                            backgroundColor: Constants().lightAppBar),
                        scaffoldBackgroundColor: Constants().lightBg,
                        fontFamily: Constants().allFontFamily,
                        primaryTextTheme: TextTheme(
                          bodyLarge: TextStyle(
                            color: Constants().lightTextColor,
                          ),
                        ),
                      )
                    : ThemeData.dark().copyWith(
                        scaffoldBackgroundColor: Constants().darkBg,
                        primaryColor: Constants().darkTextColor,
                        textTheme: Typography().white.apply(
                              fontFamily: Constants().allFontFamily,
                            ),
                        appBarTheme: AppBarTheme(
                          backgroundColor: Constants().darkAppBar,
                        ),
                      ),
                home: const WelcomePage(),
                // Column(
                //   children: [
                //     if (user != null)
                //       HomePage(
                //           userName:
                //               FirebaseAuth.instance.currentUser!.displayName)
                //     else
                //       const WelcomePage(),
                //   ],
                // )
                ),
          );
        },
      ),
    );
  }
}
