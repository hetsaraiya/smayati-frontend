import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:samyati/Pages/Logins/loginpage.dart';
import 'package:samyati/Provider/auth_provider.dart';
import 'package:samyati/Theme/colos.dart';
import 'package:samyati/Theme/theme_modal.dart';

class NumberPage extends StatefulWidget {
  const NumberPage({super.key});

  @override
  State<NumberPage> createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {
  TextEditingController phoneController = TextEditingController();
  // ignore: prefer_final_fields
  final _formNumberKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModal themeNotifier, child) {
      return AnnotatedRegion(
        value: themeNotifier.isDark
            ? SystemUiOverlayStyle.dark
            : SystemUiOverlayStyle.light,
        child: Scaffold(
            body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                child: SvgPicture.asset((themeNotifier.isDark)
                    ? "assets/images/leftarrow.svg"
                    : "assets/images/lightleftarrow.svg"),
                onTap: () => {
                  Navigator.of(context).pop(MaterialPageRoute(
                      builder: (context) => const LoginPage()))
                },
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Start Your Run Journey",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                          color: Theme.of(context).primaryColor)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Log in or create your account using the below mentioned options.",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30),
                    ),
                    color: themeNotifier.isDark
                        ? const Color.fromRGBO(243, 243, 243, 1)
                        : const Color.fromRGBO(86, 86, 86, 1),
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 10,
                          color: Color.fromRGBO(183, 183, 183, 0.25))
                    ]),
                child: Form(
                  key: _formNumberKey,
                  child: TextFormField(
                    style: TextStyle(color: Theme.of(context).primaryColor),
                    keyboardType: TextInputType.number,
                    controller : phoneController,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        phoneController.text = value;
                      });
                    },
                    decoration: InputDecoration(
                      prefixIcon: SizedBox(
                          width: 75,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Text("(+91)",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ))
                            ],
                          )),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(
                          width: 0.75,
                          color: themeNotifier.isDark
                              ? const Color.fromRGBO(255, 255, 255, 1)
                              : const Color.fromRGBO(111, 111, 111, 1),
                        ),
                      ),
                      errorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(
                              width: 0.75,
                              color: Color.fromRGBO(226, 36, 55, 1))),
                      focusedErrorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(
                              width: 0.75,
                              color: Color.fromRGBO(226, 36, 55, 1))),
                      errorStyle:
                          const TextStyle(height: 0, color: Colors.transparent),
                      hintStyle:
                          TextStyle(color: Theme.of(context).primaryColor),
                      hintText: "Enter Your Number",
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(
                          width: 0.75,
                          color: themeNotifier.isDark
                              ? const Color.fromRGBO(255, 255, 255, 1)
                              : const Color.fromRGBO(111, 111, 111, 1),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 150),
                child: SizedBox(
                  width: 161,
                  height: 40,
                  child: ElevatedButton(
                      style: TextButton.styleFrom(
                        elevation: 3,
                        side: const BorderSide(
                            width: 0.75,
                            color: Color.fromRGBO(255, 255, 255, 1)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                        backgroundColor: const Color.fromRGBO(243, 243, 243, 1),
                      ),
                      onPressed: () => {sendPhoneNumber()},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Continue",
                            style: TextStyle(color: Constants().lightTextColor),
                          ),
                          const SizedBox(width: 10),
                          SvgPicture.asset("assets/images/rightarrow.svg")
                        ],
                      )),
                ),
              )
            ],
          ),
        )),
      );
    });
  }

  void sendPhoneNumber() {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = phoneController.text.trim();
    ap.signInWithPhone(context, "+91$phoneNumber");
  }
}
