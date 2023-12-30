import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import 'package:samyati/Theme/theme_modal.dart';
// import 'package:samyati/Widgets/count_card.dart';
// import 'package:samyati/Widgets/score_table.dart';

class ChallengeTab extends StatelessWidget {
  const ChallengeTab({super.key});

  @override
  Widget build(BuildContext context) {
    // List RandomImages = [
    //   'assets/images/c1.png',
    //   'assets/images/c2.png',
    //   'assets/images/c3.png',
    // ];
    return Consumer(builder: (context, ThemeModal themeNotifier, child) {
      return SingleChildScrollView(
        // child: Column(
        //   children: [
        //     const Row(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       children: [
        //         Text(
        //           "Daily Challenges",
        //           style: TextStyle(
        //             fontSize: 18,
        //             fontWeight: FontWeight.w600,
        //           ),
        //         ),
        //       ],
        //     ),
        //     const SizedBox(
        //       height: 10,
        //     ),
        //     Container(
        //       height: 387,
        //       padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(10),
        //         color: const Color.fromRGBO(243, 243, 243, 1),
        //         border: Border.all(
        //           width: 0.75,
        //           color: themeNotifier.isDark
        //               ? const Color.fromRGBO(255, 255, 255, 1)
        //               : const Color.fromRGBO(111, 111, 111, 1),
        //         ),
        //       ),
        //       child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             SizedBox(
        //               // height: 300,
        //               child: Stack(
        //                 alignment: Alignment.bottomCenter,
        //                 children: [
        //                   Image.asset(
        //                     'assets/images/dc.png',
        //                     height: 322,
        //                     width: 351,
        //                   ),
        //                   SizedBox(
        //                     height: 120,
        //                     width: 351,
        //                     child: ClipRRect(
        //                       // Clip it cleanly.
        //                       child: BackdropFilter(
        //                         filter: ImageFilter.blur(
        //                           sigmaX: 5,
        //                           sigmaY: 5,
        //                         ),
        //                         child: Container(
        //                           padding: const EdgeInsets.symmetric(
        //                               horizontal: 10),
        //                           decoration: const BoxDecoration(
        //                             color: Color.fromRGBO(174, 174, 174, 0.14),
        //                             borderRadius: BorderRadius.only(
        //                               bottomLeft: Radius.circular(6),
        //                               bottomRight: Radius.circular(6),
        //                             ),
        //                           ),
        //                           child: Column(
        //                             mainAxisAlignment: MainAxisAlignment.center,
        //                             crossAxisAlignment:
        //                                 CrossAxisAlignment.start,
        //                             children: [
        //                               const Text(
        //                                 "Today's 10,000K Step Challenge",
        //                                 style: TextStyle(
        //                                   color: Colors.white,
        //                                   fontSize: 18,
        //                                   fontWeight: FontWeight.w600,
        //                                 ),
        //                               ),
        //                               const SizedBox(
        //                                 height: 5,
        //                               ),
        //                               Row(
        //                                 mainAxisAlignment:
        //                                     MainAxisAlignment.spaceAround,
        //                                 crossAxisAlignment:
        //                                     CrossAxisAlignment.center,
        //                                 children: [
        //                                   const Column(
        //                                     mainAxisAlignment:
        //                                         MainAxisAlignment.start,
        //                                     crossAxisAlignment:
        //                                         CrossAxisAlignment.start,
        //                                     children: [
        //                                       Text(
        //                                         "Goal",
        //                                         style: TextStyle(
        //                                           color: Colors.white,
        //                                           fontSize: 12,
        //                                           fontWeight: FontWeight.w500,
        //                                         ),
        //                                       ),
        //                                       Text(
        //                                         "10,000 Steps",
        //                                         style: TextStyle(
        //                                           color: Colors.white,
        //                                           fontSize: 15,
        //                                           fontWeight: FontWeight.w600,
        //                                         ),
        //                                       ),
        //                                     ],
        //                                   ),
        //                                   const SizedBox(
        //                                     width: 20,
        //                                   ),
        //                                   Row(
        //                                     mainAxisAlignment:
        //                                         MainAxisAlignment.center,
        //                                     children: [
        //                                       for (int i = 0;
        //                                           i < RandomImages.length;
        //                                           i++)
        //                                         Align(
        //                                           widthFactor: 0.5,
        //                                           child: CircleAvatar(
        //                                             radius: 12,
        //                                             backgroundColor:
        //                                                 Colors.white,
        //                                             child: CircleAvatar(
        //                                               radius: 10,
        //                                               backgroundImage:
        //                                                   AssetImage(
        //                                                       RandomImages[i]),
        //                                             ),
        //                                           ),
        //                                         ),
        //                                       const SizedBox(width: 15),
        //                                       const SizedBox(
        //                                         width: 70,
        //                                         child: Text(
        //                                           "10k+ Members",
        //                                           maxLines: 2,
        //                                           style: TextStyle(
        //                                             color: Colors.white,
        //                                             fontSize: 12,
        //                                           ),
        //                                         ),
        //                                       )
        //                                     ],
        //                                   )
        //                                 ],
        //                               )
        //                             ],
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //             const SizedBox(
        //               height: 8,
        //             ),
        //             Container(
        //               height: 45,
        //               decoration: const BoxDecoration(
        //                 color: Color.fromRGBO(35, 175, 0, 1),
        //                 borderRadius: BorderRadius.all(
        //                   Radius.circular(5),
        //                 ),
        //               ),
        //               child: const Center(
        //                 child: Text(
        //                   "Join Now",
        //                   style: TextStyle(
        //                     color: Colors.white,
        //                     fontSize: 15,
        //                     fontWeight: FontWeight.w600,
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           ]),
        //     ),
        //     const SizedBox(
        //       height: 10,
        //     ),
        //     const Row(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       children: [
        //         Text(
        //           "Daily Challenges",
        //           style: TextStyle(
        //             fontSize: 18,
        //             fontWeight: FontWeight.w600,
        //           ),
        //         ),
        //       ],
        //     ),
        //     const SizedBox(
        //       height: 10,
        //     ),
        //     Container(
        //       height: 387,
        //       padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(10),
        //         color: const Color.fromRGBO(243, 243, 243, 1),
        //         border: Border.all(
        //           width: 0.75,
        //           color: themeNotifier.isDark
        //               ? const Color.fromRGBO(255, 255, 255, 1)
        //               : const Color.fromRGBO(111, 111, 111, 1),
        //         ),
        //       ),
        //       child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             SizedBox(
        //               // height: 300,
        //               child: Stack(
        //                 alignment: Alignment.bottomCenter,
        //                 children: [
        //                   Image.asset(
        //                     'assets/images/dc.png',
        //                     height: 322,
        //                     width: 351,
        //                   ),
        //                   SizedBox(
        //                     height: 120,
        //                     width: 351,
        //                     child: ClipRRect(
        //                       // Clip it cleanly.
        //                       child: BackdropFilter(
        //                         filter: ImageFilter.blur(
        //                           sigmaX: 5,
        //                           sigmaY: 5,
        //                         ),
        //                         child: Container(
        //                           padding: const EdgeInsets.symmetric(
        //                               horizontal: 10),
        //                           decoration: const BoxDecoration(
        //                             color: Color.fromRGBO(174, 174, 174, 0.14),
        //                             borderRadius: BorderRadius.only(
        //                               bottomLeft: Radius.circular(6),
        //                               bottomRight: Radius.circular(6),
        //                             ),
        //                           ),
        //                           child: Column(
        //                             mainAxisAlignment: MainAxisAlignment.center,
        //                             crossAxisAlignment:
        //                                 CrossAxisAlignment.start,
        //                             children: [
        //                               const Text(
        //                                 "Today's 10,000K Step Challenge",
        //                                 style: TextStyle(
        //                                   color: Colors.white,
        //                                   fontSize: 18,
        //                                   fontWeight: FontWeight.w600,
        //                                 ),
        //                               ),
        //                               const SizedBox(
        //                                 height: 5,
        //                               ),
        //                               Row(
        //                                 mainAxisAlignment:
        //                                     MainAxisAlignment.spaceAround,
        //                                 crossAxisAlignment:
        //                                     CrossAxisAlignment.center,
        //                                 children: [
        //                                   const Column(
        //                                     mainAxisAlignment:
        //                                         MainAxisAlignment.start,
        //                                     crossAxisAlignment:
        //                                         CrossAxisAlignment.start,
        //                                     children: [
        //                                       Text(
        //                                         "Goal",
        //                                         style: TextStyle(
        //                                           color: Colors.white,
        //                                           fontSize: 12,
        //                                           fontWeight: FontWeight.w500,
        //                                         ),
        //                                       ),
        //                                       Text(
        //                                         "10,000 Steps",
        //                                         style: TextStyle(
        //                                           color: Colors.white,
        //                                           fontSize: 15,
        //                                           fontWeight: FontWeight.w600,
        //                                         ),
        //                                       ),
        //                                     ],
        //                                   ),
        //                                   const SizedBox(
        //                                     width: 20,
        //                                   ),
        //                                   Row(
        //                                     mainAxisAlignment:
        //                                         MainAxisAlignment.center,
        //                                     children: [
        //                                       for (int i = 0;
        //                                           i < RandomImages.length;
        //                                           i++)
        //                                         Align(
        //                                           widthFactor: 0.5,
        //                                           child: CircleAvatar(
        //                                             radius: 12,
        //                                             backgroundColor:
        //                                                 Colors.white,
        //                                             child: CircleAvatar(
        //                                               radius: 10,
        //                                               backgroundImage:
        //                                                   AssetImage(
        //                                                       RandomImages[i]),
        //                                             ),
        //                                           ),
        //                                         ),
        //                                       const SizedBox(width: 15),
        //                                       const SizedBox(
        //                                         width: 70,
        //                                         child: Text(
        //                                           "10k+ Members",
        //                                           maxLines: 2,
        //                                           style: TextStyle(
        //                                             color: Colors.white,
        //                                             fontSize: 12,
        //                                           ),
        //                                         ),
        //                                       )
        //                                     ],
        //                                   )
        //                                 ],
        //                               )
        //                             ],
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //             const SizedBox(
        //               height: 8,
        //             ),
        //             Container(
        //               height: 45,
        //               decoration: const BoxDecoration(
        //                 color: Color.fromRGBO(35, 175, 0, 1),
        //                 borderRadius: BorderRadius.all(
        //                   Radius.circular(5),
        //                 ),
        //               ),
        //               child: const Center(
        //                 child: Text(
        //                   "Join Now",
        //                   style: TextStyle(
        //                     color: Colors.white,
        //                     fontSize: 15,
        //                     fontWeight: FontWeight.w600,
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           ]),
        //     ),
        //     const SizedBox(
        //       height: 80,
        //     ),
        //   ],
        // ),
        child: const Center(
          child: Text("Coming Soon"),
        ),
      );
    });
  }
}

class FriendsTab extends StatefulWidget {
  const FriendsTab({super.key});

  @override
  State<FriendsTab> createState() => _FriendsTabState();
}

class _FriendsTabState extends State<FriendsTab> {
  bool light = true;
  final String shareLink =
      "https://search.google.com/testmobile=oyb267Mhisphjdfdifsdfdsif4";
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModal themeNotifier, child) {
      return SingleChildScrollView(
        // child: Column(
        //   children: [
        //     const Row(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       children: [
        //         Text(
        //           "Score Table",
        //           style: TextStyle(
        //             fontSize: 18,
        //             fontWeight: FontWeight.w600,
        //           ),
        //         ),
        //       ],
        //     ),
        //     const SizedBox(
        //       height: 10,
        //     ),
        //     CountCard(
        //       cardHeight: 383,
        //       dataBox: Column(
        //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           Container(
        //             height: 74,
        //             padding: const EdgeInsets.symmetric(
        //                 vertical: 10, horizontal: 20),
        //             decoration: BoxDecoration(
        //               border: Border(
        //                 bottom: BorderSide(
        //                   width: 0.75,
        //                   color: themeNotifier.isDark
        //                       ? const Color.fromRGBO(255, 255, 255, 1)
        //                       : const Color.fromRGBO(111, 111, 111, 1),
        //                 ),
        //               ),
        //             ),
        //             child: const Center(
        //               child: ScoreTableConstruction(
        //                 userText: "1",
        //                 userImage: "assets/images/c1.png",
        //                 userColor: [
        //                   Color.fromRGBO(143, 0, 255, 1),
        //                   Color.fromRGBO(0, 124, 255, 1),
        //                 ],
        //                 userName: "Raj Sharma",
        //                 userId: "@adroit_engineer_51",
        //                 userStep: "926",
        //                 userCoin: "9.26",
        //               ),
        //             ),
        //           ),
        //           Container(
        //             height: 74,
        //             padding: const EdgeInsets.symmetric(
        //                 vertical: 10, horizontal: 20),
        //             decoration: BoxDecoration(
        //               border: Border(
        //                 bottom: BorderSide(
        //                   width: 0.75,
        //                   color: themeNotifier.isDark
        //                       ? const Color.fromRGBO(255, 255, 255, 1)
        //                       : const Color.fromRGBO(111, 111, 111, 1),
        //                 ),
        //               ),
        //             ),
        //             child: const Center(
        //               child: ScoreTableConstruction(
        //                 userText: "2",
        //                 userImage: "assets/images/c2.png",
        //                 userColor: [
        //                   Color.fromRGBO(143, 0, 255, 1),
        //                   Color.fromRGBO(255, 174, 18, 1),
        //                 ],
        //                 userName: "Akash Yadav",
        //                 userId: "@bellicose_musician_75",
        //                 userStep: "526",
        //                 userCoin: "5.26",
        //               ),
        //             ),
        //           ),
        //           Container(
        //             height: 74,
        //             padding: const EdgeInsets.symmetric(
        //                 vertical: 10, horizontal: 20),
        //             decoration: BoxDecoration(
        //               border: Border(
        //                 bottom: BorderSide(
        //                   width: 0.75,
        //                   color: themeNotifier.isDark
        //                       ? const Color.fromRGBO(255, 255, 255, 1)
        //                       : const Color.fromRGBO(111, 111, 111, 1),
        //                 ),
        //               ),
        //             ),
        //             child: const Center(
        //               child: ScoreTableConstruction(
        //                 userText: "3",
        //                 userImage: "assets/images/c3.png",
        //                 userColor: [
        //                   Color.fromRGBO(240, 82, 37, 1),
        //                   Color.fromRGBO(238, 168, 32, 1),
        //                 ],
        //                 userName: "Aishwarya Devi",
        //                 userId: "@lachrymose_captain_52",
        //                 userStep: "426",
        //                 userCoin: "4.26",
        //               ),
        //             ),
        //           ),
        //           Container(
        //             height: 74,
        //             padding: const EdgeInsets.symmetric(
        //                 vertical: 10, horizontal: 20),
        //             decoration: BoxDecoration(
        //               border: Border(
        //                 bottom: BorderSide(
        //                   width: 0.75,
        //                   color: themeNotifier.isDark
        //                       ? const Color.fromRGBO(255, 255, 255, 1)
        //                       : const Color.fromRGBO(111, 111, 111, 1),
        //                 ),
        //               ),
        //             ),
        //             child: const Center(
        //               child: ScoreTableConstruction(
        //                 userText: "4",
        //                 userImage: "assets/images/c2.png",
        //                 userColor: [
        //                   Color.fromRGBO(143, 0, 255, 1),
        //                   Color.fromRGBO(234, 10, 1, 1),
        //                 ],
        //                 userName: "Kumar Singh",
        //                 userId: "@rebarbative_statue_11",
        //                 userStep: "26",
        //                 userCoin: "2.6",
        //               ),
        //             ),
        //           ),
        //           Container(
        //             height: 74,
        //             padding: const EdgeInsets.symmetric(
        //                 vertical: 10, horizontal: 20),
        //             child: const Center(
        //               child: ScoreTableConstruction(
        //                 userText: "5",
        //                 userImage: "assets/images/c3.png",
        //                 userColor: [
        //                   Color.fromRGBO(143, 0, 255, 1),
        //                   Color.fromRGBO(255, 0, 179, 1),
        //                 ],
        //                 userName: "Akash Yadav",
        //                 userId: "@bellicose_musician_75",
        //                 userStep: "126",
        //                 userCoin: "1.26",
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //     Container(
        //       margin: const EdgeInsets.symmetric(vertical: 10),
        //       height: 45,
        //       decoration: const BoxDecoration(
        //         gradient: LinearGradient(
        //           colors: [
        //             Color.fromRGBO(240, 82, 37, 1),
        //             Color.fromRGBO(238, 168, 32, 1)
        //           ],
        //         ),
        //         borderRadius: BorderRadius.all(Radius.circular(6)),
        //       ),
        //       child: const Center(
        //         child: Text(
        //           "See All History",
        //           style: TextStyle(
        //             color: Colors.white,
        //             fontSize: 18,
        //             fontWeight: FontWeight.w600,
        //           ),
        //         ),
        //       ),
        //     ),
        //     CountCard(
        //         cardHeight: 86,
        //         dataBox: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceAround,
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children: [
        //             const Column(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Text(
        //                   "Share Step With Followers",
        //                   style: TextStyle(
        //                     color: Color.fromRGBO(16, 16, 16, 1),
        //                     fontSize: 14,
        //                     fontWeight: FontWeight.w600,
        //                   ),
        //                 ),
        //                 Text(
        //                   "We'll Share your steps with people that follow you",
        //                   maxLines: 2,
        //                   style: TextStyle(
        //                     color: Color.fromRGBO(16, 16, 16, 0.5),
        //                     fontSize: 9,
        //                     fontWeight: FontWeight.w400,
        //                   ),
        //                 ),
        //               ],
        //             ),
        //             FlutterSwitch(
        //               width: 60,
        //               height: 35,
        //               value: light,
        //               activeColor: const Color.fromRGBO(240, 82, 37, 1),
        //               onToggle: (bool value) {
        //                 setState(() {
        //                   light = value;
        //                 });
        //               },
        //             )
        //           ],
        //         )),
        //     const SizedBox(
        //       height: 10,
        //     ),
        //     Container(
        //       margin: const EdgeInsets.symmetric(horizontal: 20),
        //       child: const Row(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         children: [
        //           Text(
        //             "Find Contacts",
        //             style: TextStyle(
        //               fontSize: 18,
        //               fontWeight: FontWeight.w600,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //     const SizedBox(
        //       height: 10,
        //     ),
        //     CountCard(
        //       cardHeight: 148,
        //       dataBox: Padding(
        //         padding:
        //             const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             const Text(
        //               "Just tap “OK” When Your Phone asks for access. Well never contact anyone without your permission.",
        //               style: TextStyle(
        //                 fontSize: 13,
        //                 color: Color.fromRGBO(16, 16, 16, 0.5),
        //               ),
        //             ),
        //             const SizedBox(
        //               height: 20,
        //             ),
        //             Container(
        //               height: 40,
        //               decoration: const BoxDecoration(
        //                 color: Color.fromRGBO(35, 175, 0, 1),
        //                 borderRadius: BorderRadius.all(
        //                   Radius.circular(5),
        //                 ),
        //               ),
        //               child: const Center(
        //                 child: Text(
        //                   "Claim Now",
        //                   style: TextStyle(
        //                     color: Colors.white,
        //                     fontSize: 12,
        //                     fontWeight: FontWeight.w600,
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //     const SizedBox(
        //       height: 10,
        //     ),
        //     Container(
        //       margin: const EdgeInsets.symmetric(horizontal: 20),
        //       child: const Row(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         children: [
        //           Text(
        //             "Share Link",
        //             style: TextStyle(
        //               fontSize: 18,
        //               fontWeight: FontWeight.w600,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //     const SizedBox(
        //       height: 10,
        //     ),
        //     CountCard(
        //       cardHeight: 50,
        //       dataBox: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           SvgPicture.asset("assets/images/link.svg"),
        //           SizedBox(
        //             width: 210,
        //             child: Text(
        //               shareLink,
        //               style: const TextStyle(
        //                 fontSize: 10,
        //                 color: Color.fromRGBO(16, 16, 16, 0.5),
        //               ),
        //             ),
        //           ),
        //           InkWell(
        //             onTap: () {
        //               Clipboard.setData(ClipboardData(text: shareLink)).then(
        //                 (value) => ScaffoldMessenger.of(context).showSnackBar(
        //                   SnackBar(
        //                     content: ClipRRect(
        //                       child: BackdropFilter(
        //                         filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        //                         child: Container(
        //                           padding: const EdgeInsets.all(14),
        //                           decoration: BoxDecoration(
        //                             color: themeNotifier.isDark
        //                                 ? const Color.fromRGBO(
        //                                     238, 238, 238, 0.8)
        //                                 : const Color.fromRGBO(16, 16, 16, 0.8),
        //                             borderRadius: BorderRadius.circular(5),
        //                           ),
        //                           child: Center(
        //                             child: Row(
        //                               mainAxisAlignment:
        //                                   MainAxisAlignment.center,
        //                               children: [
        //                                 Icon(
        //                                   Icons.copy_all_outlined,
        //                                   color: themeNotifier.isDark
        //                                       ? Colors.black
        //                                       : Colors.white,
        //                                   size: 20,
        //                                 ),
        //                                 const SizedBox(
        //                                   width: 10,
        //                                 ),
        //                                 Text(
        //                                   "Link Copied",
        //                                   style: TextStyle(
        //                                     color: themeNotifier.isDark
        //                                         ? Colors.black
        //                                         : Colors.white,
        //                                     fontWeight: FontWeight.w600,
        //                                   ),
        //                                 )
        //                               ],
        //                             ),
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                     backgroundColor: Colors.transparent,
        //                     elevation: 0,
        //                     // behavior: SnackBarBehavior.floating,
        //                   ),
        //                 ),
        //               );
        //             },
        //             child: Container(
        //               height: 40,
        //               padding: const EdgeInsets.all(5),
        //               decoration: BoxDecoration(
        //                 gradient: const LinearGradient(
        //                   colors: [
        //                     Color.fromRGBO(240, 82, 37, 1),
        //                     Color.fromRGBO(238, 168, 32, 1)
        //                   ],
        //                 ),
        //                 borderRadius: BorderRadius.circular(10),
        //               ),
        //               child: const Center(
        //                 child: Text(
        //                   "Copy Link",
        //                   style: TextStyle(
        //                     color: Colors.white,
        //                     fontSize: 14,
        //                     fontWeight: FontWeight.w500,
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           )
        //         ],
        //       ),
        //     ),
        //     const SizedBox(
        //       height: 80,
        //     )
        //   ],
        // ),
        child: Center(
          child: Text("Comming Soon"),
        ),
      );
    });
  }
}

class ChallengePage extends StatefulWidget {
  const ChallengePage({super.key});

  @override
  State<ChallengePage> createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModal themeNotifier, child) {
      return Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 130, right: 20, left: 20, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Search",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(243, 243, 243, 1),
                    borderRadius: BorderRadius.circular(31),
                    border: Border.all(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                  child: TextField(
                      decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    border: InputBorder.none,
                    hintText: "Search Here",
                    hintStyle: const TextStyle(
                      color: Color.fromRGBO(16, 16, 16, 0.5),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    suffixIcon: Container(
                      margin: const EdgeInsets.only(right: 30),
                      child: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: SvgPicture.asset(
                          "assets/images/Search.svg",
                        ),
                      ),
                    ),
                  )),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(243, 243, 243, 1),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      width: 0.75,
                      color: themeNotifier.isDark
                          ? const Color.fromRGBO(255, 255, 255, 1)
                          : const Color.fromRGBO(111, 111, 111, 1),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      tabs: const [
                        Tab(
                          child: Text('Challenges'),
                        ),
                        Tab(
                          child: Text('Friends'),
                        ),
                      ],
                      unselectedLabelColor: const Color.fromRGBO(16, 16, 16, 1),
                      labelColor: const Color.fromRGBO(238, 238, 238, 1),
                      labelPadding: const EdgeInsets.only(left: 0, right: 0),
                      labelStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      unselectedLabelStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      controller: _tabController,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(240, 82, 37, 1),
                            Color.fromRGBO(238, 168, 32, 1)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 500,
                  child: TabBarView(
                    controller: _tabController,
                    children: const [
                      ChallengeTab(),
                      FriendsTab(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      );
    });
  }
}
