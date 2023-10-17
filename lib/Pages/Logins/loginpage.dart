// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:provider/provider.dart';
// import 'package:samyati/Pages/Logins/number.dart';
// import 'package:samyati/Pages/home.dart';
// import 'package:samyati/Pages/welcome.dart';
// import 'package:samyati/Theme/colos.dart';
// import 'package:samyati/Theme/theme_modal.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   Future<void> googleLogin(BuildContext context) async {
//     try {
//       GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//       if (googleUser == null) {
//         // User canceled the sign-in process
//         return;
//       }

//       GoogleSignInAuthentication googleAuth = await googleUser.authentication;

//       AuthCredential credential = GoogleAuthProvider.credential(
//         idToken: googleAuth.idToken,
//         accessToken: googleAuth.accessToken,
//       );

//       UserCredential userCredential =
//           await FirebaseAuth.instance.signInWithCredential(credential);
//       var userName = userCredential.user?.displayName.toString();
//       var email = userCredential.user?.email.toString();
//       var uId = userCredential.user?.uid.toString();
//       if (userCredential.user != null) {
//         Navigator.of(context).pushReplacement(
//           MaterialPageRoute(
//               builder: (context) => HomePage(
//                     userName: userName,
//                     email: email,
//                     uId: uId,
//                   )),
//         );
//       }
//     } catch (error) {
//       print("Error during Google sign-in: $error");
//       // Handle the error, e.g., display an error message to the user.
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final currentHeight = MediaQuery.of(context).size.height;

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
//                       builder: (context) => const WelcomePage()))
//                 },
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("Start Your Run Journey",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 25,
//                           color: Theme.of(context).primaryColor)),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     "Log in or create your account using the below mentioned options.",
//                     style: TextStyle(color: Theme.of(context).primaryColor),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: currentHeight < 670 ? 250 : 300,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     // Google
//                     SizedBox(
//                       width: 358,
//                       height: currentHeight < 670 ? 50 : 60,
//                       child: ElevatedButton(
//                           style: TextButton.styleFrom(
//                             elevation: 3,
//                             side: const BorderSide(
//                                 width: 0.75,
//                                 color: Color.fromRGBO(255, 255, 255, 1)),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(50.0)),
//                             backgroundColor:
//                                 const Color.fromRGBO(243, 243, 243, 1),
//                           ),
//                           onPressed: () {
//                             googleLogin(context);
//                           },
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 "assets/images/google.png",
//                                 width: 30,
//                                 height: 30,
//                               ),
//                               const SizedBox(
//                                 width: 20,
//                               ),
//                               Text(
//                                 "Google",
//                                 style: TextStyle(
//                                     color: Constants().lightTextColor,
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             ],
//                           )),
//                     ),
//                     //  Email
//                     SizedBox(
//                       width: 358,
//                       height: currentHeight < 670 ? 50 : 60,
//                       child: ElevatedButton(
//                           style: TextButton.styleFrom(
//                             elevation: 3,
//                             side: const BorderSide(
//                                 width: 0.75,
//                                 color: Color.fromRGBO(255, 255, 255, 1)),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(50.0)),
//                             backgroundColor:
//                                 const Color.fromRGBO(243, 243, 243, 1),
//                           ),
//                           onPressed: () {},
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 "assets/images/mail.png",
//                                 width: 24.07,
//                                 height: 17.86,
//                               ),
//                               const SizedBox(
//                                 width: 20,
//                               ),
//                               Text(
//                                 "Sign in with Email",
//                                 style: TextStyle(
//                                     color: Constants().lightTextColor,
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             ],
//                           )),
//                     ),
//                     //  Account
//                     SizedBox(
//                       width: 358,
//                       height: currentHeight < 670 ? 50 : 60,
//                       child: ElevatedButton(
//                           style: TextButton.styleFrom(
//                             elevation: 3,
//                             side: const BorderSide(
//                                 width: 0.75,
//                                 color: Color.fromRGBO(255, 255, 255, 1)),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(50.0)),
//                             backgroundColor:
//                                 const Color.fromRGBO(243, 243, 243, 1),
//                           ),
//                           onPressed: () {},
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 "assets/images/account.png",
//                                 width: 19.91,
//                                 height: 23.23,
//                               ),
//                               const SizedBox(
//                                 width: 20,
//                               ),
//                               Text(
//                                 "Log In To My Account",
//                                 style: TextStyle(
//                                     color: Constants().lightTextColor,
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             ],
//                           )),
//                     ),
//                     // Phone
//                     SizedBox(
//                       width: 358,
//                       height: currentHeight < 670 ? 50 : 60,
//                       child: ElevatedButton(
//                           style: TextButton.styleFrom(
//                             elevation: 3,
//                             side: const BorderSide(
//                                 width: 0.75,
//                                 color: Color.fromRGBO(255, 255, 255, 1)),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(50.0)),
//                             backgroundColor:
//                                 const Color.fromRGBO(243, 243, 243, 1),
//                           ),
//                           onPressed: () {
//                             Navigator.of(context).push(MaterialPageRoute(
//                                 builder: (context) => const NumberPage()));
//                           },
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 "assets/images/phone.png",
//                                 width: 26.07,
//                                 height: 25.42,
//                               ),
//                               const SizedBox(
//                                 width: 20,
//                               ),
//                               Text(
//                                 "Phone Number",
//                                 style: TextStyle(
//                                     color: Constants().lightTextColor,
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             ],
//                           )),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         )),
//       );
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:provider/provider.dart';
import 'package:samyati/Pages/home.dart';
import 'package:samyati/Pages/welcome.dart';
import 'package:samyati/Theme/colos.dart';
import 'package:samyati/Theme/theme_modal.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  
  Future<void> googleLogin(BuildContext context) async {
    try {
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        // User canceled the sign-in process
        return;
      }

      GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      var userName = userCredential.user?.displayName.toString();
      var email = userCredential.user?.email.toString();
      var uId = userCredential.user?.uid.toString();
      if (userCredential.user != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) => HomePage(
                    userName: userName,
                    email: email,
                    uId: uId,
                    data: 'route login',
                  )),
        );
      }
    } catch (error) {
      print("Error during Google sign-in: $error");
      // Handle the error, e.g., display an error message to the user.
    }
  }

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
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                child: const Text("go to google fit",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                        color: Colors.redAccent)),
                onTap: () => {
                  StoreRedirect.redirect(
                      androidAppId: "com.google.android.apps.fitness",
                      iOSAppId: "1433864494")
                },
              ),
              InkWell(
                child: SvgPicture.asset((themeNotifier.isDark)
                    ? "assets/images/leftarrow.svg"
                    : "assets/images/lightleftarrow.svg"),
                onTap: () => {
                  Navigator.of(context).pop(MaterialPageRoute(
                      builder: (context) => const WelcomePage()))
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
              SizedBox(
                height: currentHeight < 670 ? 250 : 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Google
                    SizedBox(
                      width: 358,
                      height: currentHeight < 670 ? 50 : 60,
                      child: ElevatedButton(
                          style: TextButton.styleFrom(
                            elevation: 3,
                            side: const BorderSide(
                                width: 0.75,
                                color: Color.fromRGBO(255, 255, 255, 1)),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0)),
                            backgroundColor:
                                const Color.fromRGBO(243, 243, 243, 1),
                          ),
                          onPressed: () {
                            googleLogin(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/google.png",
                                width: 30,
                                height: 30,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Google",
                                style: TextStyle(
                                    color: Constants().lightTextColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          )),
                    ),
                    // //  Email
                    // SizedBox(
                    //   width: 358,
                    //   height: currentHeight < 670 ? 50 : 60,
                    //   child: ElevatedButton(
                    //       style: TextButton.styleFrom(
                    //         elevation: 3,
                    //         side: const BorderSide(
                    //             width: 0.75,
                    //             color: Color.fromRGBO(255, 255, 255, 1)),
                    //         shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(50.0)),
                    //         backgroundColor:
                    //             const Color.fromRGBO(243, 243, 243, 1),
                    //       ),
                    //       onPressed: () {},
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.start,
                    //         crossAxisAlignment: CrossAxisAlignment.center,
                    //         children: [
                    //           Image.asset(
                    //             "assets/images/mail.png",
                    //             width: 24.07,
                    //             height: 17.86,
                    //           ),
                    //           const SizedBox(
                    //             width: 20,
                    //           ),
                    //           Text(
                    //             "Sign in with Email",
                    //             style: TextStyle(
                    //                 color: Constants().lightTextColor,
                    //                 fontSize: 18,
                    //                 fontWeight: FontWeight.w500),
                    //           ),
                    //         ],
                    //       )),
                    // ),
                    // //  Account
                    // SizedBox(
                    //   width: 358,
                    //   height: currentHeight < 670 ? 50 : 60,
                    //   child: ElevatedButton(
                    //       style: TextButton.styleFrom(
                    //         elevation: 3,
                    //         side: const BorderSide(
                    //             width: 0.75,
                    //             color: Color.fromRGBO(255, 255, 255, 1)),
                    //         shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(50.0)),
                    //         backgroundColor:
                    //             const Color.fromRGBO(243, 243, 243, 1),
                    //       ),
                    //       onPressed: () {},
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.start,
                    //         crossAxisAlignment: CrossAxisAlignment.center,
                    //         children: [
                    //           Image.asset(
                    //             "assets/images/account.png",
                    //             width: 19.91,
                    //             height: 23.23,
                    //           ),
                    //           const SizedBox(
                    //             width: 20,
                    //           ),
                    //           Text(
                    //             "Log In To My Account",
                    //             style: TextStyle(
                    //                 color: Constants().lightTextColor,
                    //                 fontSize: 18,
                    //                 fontWeight: FontWeight.w500),
                    //           ),
                    //         ],
                    //       )),
                    // ),
                    // // Phone
                    // SizedBox(
                    //   width: 358,
                    //   height: currentHeight < 670 ? 50 : 60,
                    //   child: ElevatedButton(
                    //       style: TextButton.styleFrom(
                    //         elevation: 3,
                    //         side: const BorderSide(
                    //             width: 0.75,
                    //             color: Color.fromRGBO(255, 255, 255, 1)),
                    //         shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(50.0)),
                    //         backgroundColor:
                    //             const Color.fromRGBO(243, 243, 243, 1),
                    //       ),
                    //       onPressed: () {
                    //         Navigator.of(context).push(MaterialPageRoute(
                    //             builder: (context) => const NumberPage()));
                    //       },
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.start,
                    //         crossAxisAlignment: CrossAxisAlignment.center,
                    //         children: [
                    //           Image.asset(
                    //             "assets/images/phone.png",
                    //             width: 26.07,
                    //             height: 25.42,
                    //           ),
                    //           const SizedBox(
                    //             width: 20,
                    //           ),
                    //           Text(
                    //             "Phone Number",
                    //             style: TextStyle(
                    //                 color: Constants().lightTextColor,
                    //                 fontSize: 18,
                    //                 fontWeight: FontWeight.w500),
                    //           ),
                    //         ],
                    //       )),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        )),
      );
    });
  }
}
