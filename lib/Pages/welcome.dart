// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:samyati/Pages/Logins/loginpage.dart';
// import 'package:samyati/Theme/colos.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import 'home.dart';

// class WelcomePage extends StatelessWidget {
//   const WelcomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final currentHeight = MediaQuery.of(context).size.height;
//     var brightness = MediaQuery.of(context).platformBrightness;
//     bool darkModeOn = brightness == Brightness.dark;

//     return AnnotatedRegion(
//       value:
//           darkModeOn ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
//       child: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 40),
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Column(
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(
//                           right: currentHeight < 670 ? 100 : 80),
//                       child: Text(
//                         "Hello From The",
//                         textAlign: TextAlign.left,
//                         style: TextStyle(
//                             color: Theme.of(context).primaryColor,
//                             fontSize: currentHeight < 670 ? 20 : 26),
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(left: 70),
//                       child: Text("Samyati",
//                           textAlign: TextAlign.right,
//                           style: GoogleFonts.fondamento(
//                             textStyle: TextStyle(
//                               color: Theme.of(context).primaryColor,
//                               fontSize: currentHeight < 670 ? 40 : 49,
//                             ),
//                           )),
//                     ),
//                   ],
//                 ),
//                 Image.asset(
//                   "assets/images/running_illustration.png",
//                   width: 284.74,
//                   height: currentHeight < 670 ? 280 : 340.3,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 40),
//                   child: Text(
//                     "Convert Your Steps Into a Currency To Spend on Products, offers and supporting Charitable Causes",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         color: Theme.of(context).primaryColor,
//                         fontSize: currentHeight < 670 ? 12 : 15),
//                   ),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.only(left: 150),
//                   child: SizedBox(
//                     width: 161,
//                     height: 40,
//                     child: ElevatedButton(
//                         style: TextButton.styleFrom(
//                           elevation: 3,
//                           side: const BorderSide(
//                               width: 0.75,
//                               color: Color.fromRGBO(255, 255, 255, 1)),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(50.0)),
//                           backgroundColor:
//                               const Color.fromRGBO(243, 243, 243, 1),
//                         ),
//                         onPressed: () {
//                           showDialog(
//                             context: context,
//                             builder: (BuildContext context) {
//                               return StreamBuilder<User?>(
//                                 stream:
//                                     FirebaseAuth.instance.authStateChanges(),
//                                 builder: (BuildContext context,
//                                     AsyncSnapshot<User?> snapshot) {
//                                   if (snapshot.hasError) {
//                                     return Text(snapshot.error.toString());
//                                   }

//                                   if (snapshot.connectionState ==
//                                       ConnectionState.active) {
//                                     if (snapshot.data == null) {
//                                       // User is not authenticated, navigate to LoginPage
//                                       return LoginPage();
//                                     } else {
//                                       // User is authenticated, navigate to HomeContent
//                                       return HomePage(
//                                           userName: FirebaseAuth.instance
//                                               .currentUser!.displayName);
//                                     }
//                                   }

//                                   // Handle the loading state
//                                   return CircularProgressIndicator(
//                                       color: Colors.blue);
//                                 },
//                               );
//                             },
//                           );
//                         },
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Text(
//                               "Continue",
//                               style:
//                                   TextStyle(color: Constants().lightTextColor),
//                             ),
//                             const SizedBox(width: 10),
//                             SvgPicture.asset("assets/images/rightarrow.svg")
//                           ],
//                         )),
//                   ),
//                 )
//               ]),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samyati/Pages/Logins/loginpage.dart';
import 'package:samyati/Theme/colos.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  

  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;

    return AnnotatedRegion(
      value:
          darkModeOn ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          right: currentHeight < 670 ? 100 : 80),
                      child: Text(
                        "Hello From The",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: currentHeight < 670 ? 20 : 26),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 70),
                      child: Text("Samyati",
                          textAlign: TextAlign.right,
                          style: GoogleFonts.fondamento(
                            textStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: currentHeight < 670 ? 40 : 49,
                            ),
                          )),
                    ),
                  ],
                ),
                Image.asset(
                  "assets/images/running_illustration.png",
                  width: 284.74,
                  height: currentHeight < 670 ? 280 : 340.3,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    "Convert Your Steps Into a Currency To Spend on Products, offers and supporting Charitable Causes",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: currentHeight < 670 ? 12 : 15),
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
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        backgroundColor: const Color.fromRGBO(243, 243, 243, 1),
                      ),
                      onPressed: () async {
                        User? user = FirebaseAuth.instance.currentUser;

                        if (user != null) {
                          // User is authenticated, navigate to HomeContent
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) =>
                                  HomePage(userName: FirebaseAuth.instance.currentUser!.displayName),
                            ),
                          );
                        } else {
                          // User is not authenticated, navigate to LoginPage
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Continue",
                            style: TextStyle(color: Constants().lightTextColor),
                          ),
                          const SizedBox(width: 10),
                          SvgPicture.asset("assets/images/rightarrow.svg"),
                        ],
                      ),
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
