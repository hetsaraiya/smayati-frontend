import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:samyati/Pages/Logins/number.dart';
import 'package:samyati/Pages/start/totalsteps.dart';
import 'package:samyati/Theme/colos.dart';
import 'package:samyati/Theme/theme_modal.dart';

// ignore: must_be_immutable
class OtpPage extends StatelessWidget {
  final String verificationId;
  OtpPage({super.key, required this.verificationId});
  // ignore: prefer_typing_uninitialized_variables
  final _formOtpKey = GlobalKey<FormState>();
  

  moveToNext(BuildContext context) async {
    if (_formOtpKey.currentState!.validate()) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const TotalSteps()));
    }
  }

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
                      builder: (context) => const NumberPage()))
                },
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("OTP, Please",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                          color: Theme.of(context).primaryColor)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Please enter the code we just sent to your number Kickstart your app journey.",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30),
                    ),
                    border: Border.all(
                        width: 0.75,
                        color: const Color.fromRGBO(255, 255, 255, 1)),
                    color: themeNotifier.isDark
                        ? const Color.fromRGBO(243, 243, 243, 1)
                        : const Color.fromRGBO(86, 86, 86, 1),
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 10,
                          color: Color.fromRGBO(183, 183, 183, 0.25))
                    ]),
                child: Form(
                    key: _formOtpKey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 43.59,
                          child: TextFormField(
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return "";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                hintText: "0",
                                errorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    borderSide: BorderSide(
                                        width: 0.75,
                                        color: Color.fromRGBO(226, 36, 55, 1))),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    borderSide: BorderSide(
                                        width: 0.75,
                                        color: Color.fromRGBO(226, 36, 55, 1))),
                                errorStyle: TextStyle(
                                    height: 0, color: Colors.transparent),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none),
                            onChanged: (value) => {
                              if (value.length == 1)
                                {FocusScope.of(context).nextFocus()}
                            },
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          width: 43.59,
                          child: TextFormField(
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return "";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                hintText: "0",
                                errorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    borderSide: BorderSide(
                                        width: 0.75,
                                        color: Color.fromRGBO(226, 36, 55, 1))),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    borderSide: BorderSide(
                                        width: 0.75,
                                        color: Color.fromRGBO(226, 36, 55, 1))),
                                errorStyle: TextStyle(
                                    height: 0, color: Colors.transparent),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none),
                            onChanged: (value) => {
                              if (value.length == 1)
                                {FocusScope.of(context).nextFocus()}
                            },
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          width: 43.59,
                          child: TextFormField(
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return "";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                hintText: "0",
                                errorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    borderSide: BorderSide(
                                        width: 0.75,
                                        color: Color.fromRGBO(226, 36, 55, 1))),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    borderSide: BorderSide(
                                        width: 0.75,
                                        color: Color.fromRGBO(226, 36, 55, 1))),
                                errorStyle: TextStyle(
                                    height: 0, color: Colors.transparent),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none),
                            onChanged: (value) => {
                              if (value.length == 1)
                                {FocusScope.of(context).nextFocus()}
                            },
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          width: 43.59,
                          child: TextFormField(
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return "";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                hintText: "0",
                                errorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    borderSide: BorderSide(
                                        width: 0.75,
                                        color: Color.fromRGBO(226, 36, 55, 1))),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    borderSide: BorderSide(
                                        width: 0.75,
                                        color: Color.fromRGBO(226, 36, 55, 1))),
                                errorStyle: TextStyle(
                                    height: 0, color: Colors.transparent),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none),
                            onChanged: (value) => {
                              if (value.length == 1)
                                {FocusScope.of(context).nextFocus()}
                            },
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    )),
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
                      onPressed: () => {moveToNext(context)},
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
}



// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:provider/provider.dart';
// import 'package:samyati/Pages/Logins/number.dart';
// import 'package:samyati/Pages/start/totalsteps.dart';
// import 'package:samyati/Theme/colos.dart';
// import 'package:samyati/Theme/theme_modal.dart';

// // ignore: must_be_immutable
// class OtpPage extends StatelessWidget {
//   final String verificationId;
//   OtpPage( {super.key, required this.verificationId});
//   // ignore: prefer_typing_uninitialized_variables
  
//   final _formOtpKey = GlobalKey<FormState>();
//   final phn = const NumberPage().phoneNumber;

//   moveToNext(BuildContext context) async {
//     if (_formOtpKey.currentState!.validate()) {
//       Navigator.of(context)
//           .push(MaterialPageRoute(builder: (context) => const TotalSteps()));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer(builder: (context, ThemeModal themeNotifier, child) {
//       return AnnotatedRegion(
//         value: themeNotifier.isDark
//             ? SystemUiOverlayStyle.dark
//             : SystemUiOverlayStyle.light,
//         child: Scaffold(
//             body: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               InkWell(
//                 child: SvgPicture.asset((themeNotifier.isDark)
//                     ? "assets/images/leftarrow.svg"
//                     : "assets/images/lightleftarrow.svg"),
//                 onTap: () => {
//                   Navigator.of(context).pop(MaterialPageRoute(
//                       builder: (context) => const NumberPage()))
//                 },
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("OTP, Please",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 25,
//                           color: Theme.of(context).primaryColor)),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     "Please enter the code we just sent to $ Kickstart your app journey.",
//                     style: TextStyle(color: Theme.of(context).primaryColor),
//                   ),
//                 ],
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 50),
//                 decoration: BoxDecoration(
//                     borderRadius: const BorderRadius.all(
//                       Radius.circular(30),
//                     ),
//                     border: Border.all(
//                         width: 0.75,
//                         color: const Color.fromRGBO(255, 255, 255, 1)),
//                     color: themeNotifier.isDark
//                         ? const Color.fromRGBO(243, 243, 243, 1)
//                         : const Color.fromRGBO(86, 86, 86, 1),
//                     boxShadow: const [
//                       BoxShadow(
//                           blurRadius: 10,
//                           color: Color.fromRGBO(183, 183, 183, 0.25))
//                     ]),
//                 child: Form(
//                     key: _formOtpKey,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         SizedBox(
//                           width: 43.59,
//                           child: TextFormField(
//                             validator: (value) {
//                               if (value != null && value.isEmpty) {
//                                 return "";
//                               }
//                               return null;
//                             },
//                             decoration: const InputDecoration(
//                                 hintText: "0",
//                                 errorBorder: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(30)),
//                                     borderSide: BorderSide(
//                                         width: 0.75,
//                                         color: Color.fromRGBO(226, 36, 55, 1))),
//                                 focusedErrorBorder: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(30)),
//                                     borderSide: BorderSide(
//                                         width: 0.75,
//                                         color: Color.fromRGBO(226, 36, 55, 1))),
//                                 errorStyle: TextStyle(
//                                     height: 0, color: Colors.transparent),
//                                 focusedBorder: InputBorder.none,
//                                 enabledBorder: InputBorder.none),
//                             onChanged: (value) => {
//                               if (value.length == 1)
//                                 {FocusScope.of(context).nextFocus()}
//                             },
//                             keyboardType: TextInputType.number,
//                             inputFormatters: [
//                               LengthLimitingTextInputFormatter(1),
//                               FilteringTextInputFormatter.digitsOnly
//                             ],
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                         SizedBox(
//                           width: 43.59,
//                           child: TextFormField(
//                             validator: (value) {
//                               if (value != null && value.isEmpty) {
//                                 return "";
//                               }
//                               return null;
//                             },
//                             decoration: const InputDecoration(
//                                 hintText: "0",
//                                 errorBorder: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(30)),
//                                     borderSide: BorderSide(
//                                         width: 0.75,
//                                         color: Color.fromRGBO(226, 36, 55, 1))),
//                                 focusedErrorBorder: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(30)),
//                                     borderSide: BorderSide(
//                                         width: 0.75,
//                                         color: Color.fromRGBO(226, 36, 55, 1))),
//                                 errorStyle: TextStyle(
//                                     height: 0, color: Colors.transparent),
//                                 focusedBorder: InputBorder.none,
//                                 enabledBorder: InputBorder.none),
//                             onChanged: (value) => {
//                               if (value.length == 1)
//                                 {FocusScope.of(context).nextFocus()}
//                             },
//                             keyboardType: TextInputType.number,
//                             inputFormatters: [
//                               LengthLimitingTextInputFormatter(1),
//                               FilteringTextInputFormatter.digitsOnly
//                             ],
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                         SizedBox(
//                           width: 43.59,
//                           child: TextFormField(
//                             validator: (value) {
//                               if (value != null && value.isEmpty) {
//                                 return "";
//                               }
//                               return null;
//                             },
//                             decoration: const InputDecoration(
//                                 hintText: "0",
//                                 errorBorder: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(30)),
//                                     borderSide: BorderSide(
//                                         width: 0.75,
//                                         color: Color.fromRGBO(226, 36, 55, 1))),
//                                 focusedErrorBorder: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(30)),
//                                     borderSide: BorderSide(
//                                         width: 0.75,
//                                         color: Color.fromRGBO(226, 36, 55, 1))),
//                                 errorStyle: TextStyle(
//                                     height: 0, color: Colors.transparent),
//                                 focusedBorder: InputBorder.none,
//                                 enabledBorder: InputBorder.none),
//                             onChanged: (value) => {
//                               if (value.length == 1)
//                                 {FocusScope.of(context).nextFocus()}
//                             },
//                             keyboardType: TextInputType.number,
//                             inputFormatters: [
//                               LengthLimitingTextInputFormatter(1),
//                               FilteringTextInputFormatter.digitsOnly
//                             ],
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                         SizedBox(
//                           width: 43.59,
//                           child: TextFormField(
//                             validator: (value) {
//                               if (value != null && value.isEmpty) {
//                                 return "";
//                               }
//                               return null;
//                             },
//                             decoration: const InputDecoration(
//                                 hintText: "0",
//                                 errorBorder: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(30)),
//                                     borderSide: BorderSide(
//                                         width: 0.75,
//                                         color: Color.fromRGBO(226, 36, 55, 1))),
//                                 focusedErrorBorder: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(30)),
//                                     borderSide: BorderSide(
//                                         width: 0.75,
//                                         color: Color.fromRGBO(226, 36, 55, 1))),
//                                 errorStyle: TextStyle(
//                                     height: 0, color: Colors.transparent),
//                                 focusedBorder: InputBorder.none,
//                                 enabledBorder: InputBorder.none),
//                             onChanged: (value) => {
//                               if (value.length == 1)
//                                 {FocusScope.of(context).nextFocus()}
//                             },
//                             keyboardType: TextInputType.number,
//                             inputFormatters: [
//                               LengthLimitingTextInputFormatter(1),
//                               FilteringTextInputFormatter.digitsOnly
//                             ],
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       ],
//                     )),
//               ),
//               Container(
//                 margin: const EdgeInsets.only(left: 150),
//                 child: SizedBox(
//                   width: 161,
//                   height: 40,
//                   child: ElevatedButton(
//                       style: TextButton.styleFrom(
//                         elevation: 3,
//                         side: const BorderSide(
//                             width: 0.75,
//                             color: Color.fromRGBO(255, 255, 255, 1)),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(50.0)),
//                         backgroundColor: const Color.fromRGBO(243, 243, 243, 1),
//                       ),
//                       onPressed: () => {moveToNext(context)},
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text(
//                             "Continue",
//                             style: TextStyle(color: Constants().lightTextColor),
//                           ),
//                           const SizedBox(width: 10),
//                           SvgPicture.asset("assets/images/rightarrow.svg")
//                         ],
//                       )),
//                 ),
//               )
//             ],
//           ),
//         )),
//       );
//     });
//   }
// }