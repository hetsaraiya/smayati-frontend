import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongoDb;
import 'package:provider/provider.dart';
import 'package:samyati/Theme/theme_modal.dart';
import 'package:samyati/Widgets/count_card.dart';
import 'package:samyati/database/constants.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// Graph
class Graph extends StatelessWidget {
  const Graph({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 289.681,
      height: 232.645,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(interval: 2),
        trackballBehavior: _trackballBehavior,
        series: <ChartSeries>[
          LineSeries<ChartData, String>(
              animationDuration: 2500,
              width: 2,
              markerSettings: const MarkerSettings(
                isVisible: true,
                width: 10,
                height: 10,
                color: Colors.white,
                borderWidth: 2,
              ),
              dataSource: [
                ChartData('Mon', 0.4, const Color.fromRGBO(240, 82, 37, 1)),
                ChartData('Tue', 1.5, const Color.fromRGBO(240, 82, 37, 1)),
                ChartData('Wed', 0.3, const Color.fromRGBO(240, 82, 37, 1)),
                ChartData('Thrus', 3.5, const Color.fromRGBO(240, 82, 37, 1)),
                ChartData('Fri', 10, const Color.fromRGBO(240, 82, 37, 1)),
                ChartData('Sat', 3, const Color.fromRGBO(240, 82, 37, 1)),
                ChartData('Sun', 6, const Color.fromRGBO(240, 82, 37, 1)),
              ],
              // Bind the color for all the data points from the data source
              pointColorMapper: (ChartData data, _) => data.color,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              enableTooltip: true)
        ],
      ),
    );
  }
}

// // Offer 1
// class Offer1 extends StatelessWidget {
//   const Offer1({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CountCard(
//       cardHeight: 134,
//       dataBox: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     const Text(
//                       "Download",
//                       style: TextStyle(
//                         color: Color.fromRGBO(16, 16, 16, 0.5),
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 8,
//                     ),
//                     Image.asset(
//                       "assets/images/sage1.png",
//                       width: 75,
//                       height: 29,
//                     ),
//                   ],
//                 ),
//                 const Text(
//                   "And Get",
//                   style: TextStyle(
//                     color: Color.fromRGBO(16, 16, 16, 0.5),
//                     fontSize: 12,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 const Text(
//                   "50 Coins",
//                   style: TextStyle(
//                     color: Color.fromRGBO(106, 208, 81, 1),
//                     fontSize: 25,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//                 Container(
//                   width: 139,
//                   height: 30,
//                   decoration: const BoxDecoration(
//                     color: Color.fromRGBO(217, 21, 61, 1),
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(2),
//                     ),
//                   ),
//                   child: const Center(
//                     child: Text(
//                       "Claim Now",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 12,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               width: 20,
//             ),
//             Image.asset(
//               "assets/images/offer1.png",
//               width: 160,
//               height: 126,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Offer 2
// class Offer2 extends StatelessWidget {
//   const Offer2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final currentWidth = MediaQuery.of(context).size.width;

//     return CountCard(
//       cardHeight: 134,
//       dataBox: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Image.asset(
//               "assets/images/offer2.png",
//               width: currentWidth < 670 ? 290 : 311,
//               height: 120,
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//             RotatedBox(
//               quarterTurns: 3,
//               child: Container(
//                 width: 139,
//                 height: 30,
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(colors: [
//                     Color.fromRGBO(240, 82, 37, 1),
//                     Color.fromRGBO(238, 168, 32, 1)
//                   ]),
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(2),
//                   ),
//                 ),
//                 child: const Center(
//                   child: Text(
//                     "Claim Now",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 12,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Offer 3
// class Offer3 extends StatelessWidget {
//   const Offer3({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CountCard(
//       cardHeight: 155,
//       dataBox: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   "assets/images/offer31.png",
//                   width: 160,
//                   height: 98,
//                 ),
//                 Image.asset(
//                   "assets/images/offer32.png",
//                   width: 160,
//                   height: 98,
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 2,
//             ),
//             Container(
//               height: 30,
//               decoration: const BoxDecoration(
//                 color: Color.fromRGBO(35, 175, 0, 1),
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(2),
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
//     );
//   }
// }

// // Offer 4
// class Offer4 extends StatelessWidget {
//   const Offer4({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CountCard(
//       cardHeight: 134,
//       dataBox: Padding(
//         padding: const EdgeInsets.all(0.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Image.asset(
//               "assets/images/offer4.png",
//               width: 236,
//               height: 124,
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const Text(
//                   "Order From Swiggy",
//                   style: TextStyle(
//                     color: Color.fromRGBO(16, 16, 16, 0.5),
//                     fontSize: 10,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 const Text(
//                   "useCode: ",
//                   style: TextStyle(
//                     color: Color.fromRGBO(16, 16, 16, 0.5),
//                     fontSize: 10,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 const Text(
//                   "SAMYATI50",
//                   style: TextStyle(
//                     color: Color.fromRGBO(106, 208, 81, 1),
//                     fontSize: 18,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 8,
//                 ),
//                 Container(
//                     width: 53,
//                     height: 20,
//                     decoration: const BoxDecoration(
//                       color: Color.fromRGBO(217, 217, 217, 1),
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(17),
//                       ),
//                     ),
//                     child: Row(
//                       children: [
//                         Container(
//                           width: 20,
//                           height: 18,
//                           padding: const EdgeInsets.all(2),
//                           decoration: const BoxDecoration(
//                               gradient: LinearGradient(
//                                 colors: [
//                                   Color.fromRGBO(240, 82, 37, 1),
//                                   Color.fromRGBO(238, 168, 32, 1)
//                                 ],
//                               ),
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(50),
//                               )),
//                           child: SvgPicture.asset(
//                             "assets/images/copy.svg",
//                             width: 12,
//                             height: 12,
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 2,
//                         ),
//                         const Text(
//                           "Copy",
//                           style: TextStyle(
//                             fontSize: 10,
//                             color: Color.fromRGBO(16, 16, 16, 0.5),
//                           ),
//                         )
//                       ],
//                     )),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 Container(
//                   width: 90,
//                   height: 30,
//                   decoration: const BoxDecoration(
//                     color: Color.fromRGBO(255, 61, 18, 1),
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(2),
//                     ),
//                   ),
//                   child: const Center(
//                     child: Text(
//                       "Claim Now",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 12,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Main
class EarningPage extends StatefulWidget {
  final String? title;
  const EarningPage({super.key, this.title});

  @override
  State<EarningPage> createState() => _EarningPageState(title: this.title);
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}

// late TooltipBehavior _tooltipBehavior;
late TrackballBehavior _trackballBehavior;

class _EarningPageState extends State<EarningPage> {
  String? title;
  String earnedCoinsTs = "0";
  String earnedTodays = "0";
  _EarningPageState({required this.title});

  Future<void> fetchOneData() async {
    try {
      // Replace 'your-collection-name' and query parameters accordingly
      var db = await mongoDb.Db.create(MONGO_URL);
      await db.open();

      final collection = db.collection(COLLECTION_NAME);

      final result =
          await collection.findOne(mongoDb.where.eq("UserName", title));
      print(result.toString());
      if (result != null) {
        final double earnedCoinsT = result['earnedCoinsT'];
        final int earnedToday = result['earnedToday'];
        setState(() {
          earnedCoinsTs = earnedCoinsT.toString();
          earnedTodays = earnedToday.toString();
        });

        print('earnedCoinsT: $earnedCoinsT');
        print('earnedToday: $earnedToday');
        // Do something with the result
      } else {
        print('Document not found.');
      }
    } catch (e) {
      print('Error executing findOne query: $e');
    }
  }

  @override
  void initState() {
    // _tooltipBehavior = TooltipBehavior(
    //   enable: true,
    //   builder: (dynamic data, dynamic point, dynamic series, int pointIndex,
    //       int seriesIndex) {
    //     return Container(
    //       height: 22,
    //       width: 54,
    //       decoration: const BoxDecoration(
    //         gradient: LinearGradient(colors: [
    //           Color.fromRGBO(240, 82, 37, 1),
    //           Color.fromRGBO(238, 168, 32, 1)
    //         ]),
    //         borderRadius: BorderRadius.all(
    //           Radius.circular(50),
    //         ),
    //       ),
    //       child: Center(
    //         child: Text(
    //           "${point.y}",
    //           style: const TextStyle(
    //             fontWeight: FontWeight.w600,
    //             fontSize: 12,
    //             color: Colors.white,
    //           ),
    //         ),
    //       ),
    //     );
    //   },
    // );
    fetchOneData();
    _trackballBehavior = TrackballBehavior(
      enable: true,
      lineWidth: 0,
      hideDelay: 3000.0,
      lineType: TrackballLineType.none,
      activationMode: ActivationMode.singleTap,
      builder: (BuildContext context, TrackballDetails trackballDetails) {
        return Container(
          height: 22,
          width: 54,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(240, 82, 37, 1),
              Color.fromRGBO(238, 168, 32, 1)
            ]),
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          child: Center(
            child: Text(
              trackballDetails.point!.y.toString(),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModal themeNotifier, child) {
      return Center(
        child: SingleChildScrollView(
          padding:
              const EdgeInsets.only(top: 130, right: 20, left: 20, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Total Coins",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CountCard(
                cardHeight: 71.52,
                dataBox: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/coin.png",
                          width: 40,
                          height: 40,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          earnedCoinsTs,
                          style: const TextStyle(
                              color: Color.fromRGBO(255, 133, 0, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Coins",
                          style: TextStyle(
                              color: themeNotifier.isDark
                                  ? const Color.fromRGBO(16, 16, 16, 0.5)
                                  : const Color.fromRGBO(238, 238, 236, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    GradientText(
                      "Redeem Now",
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                      colors: const [
                        Color.fromRGBO(240, 82, 37, 1),
                        Color.fromRGBO(238, 168, 32, 1),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CountCard(
                cardHeight: 387,
                dataBox: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Center(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Today's Earning",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: themeNotifier.isDark
                                        ? const Color.fromRGBO(16, 16, 16, 1)
                                        : const Color.fromRGBO(
                                            238, 238, 236, 1),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/coin.png",
                                      height: 40,
                                      width: 40,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: earnedTodays,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color:
                                                Color.fromRGBO(255, 133, 0, 1),
                                            fontWeight: FontWeight.w700),
                                        children: const <TextSpan>[
                                          TextSpan(
                                            text: 'Coins',
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    16, 16, 16, 0.5),
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Earned Coins",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: themeNotifier.isDark
                                        ? const Color.fromRGBO(16, 16, 16, 1)
                                        : const Color.fromRGBO(
                                            238, 238, 236, 1),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    openCalenderBox();
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        "Today",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: themeNotifier.isDark
                                              ? const Color.fromRGBO(
                                                  16, 16, 16, 0.5)
                                              : const Color.fromRGBO(
                                                  238, 238, 236, 1),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      SvgPicture.asset(
                                        themeNotifier.isDark
                                            ? "assets/images/calendar.svg"
                                            : "assets/images/calendar_dark.svg",
                                        width: 20,
                                        height: 20,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Graph(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                height: 45,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(240, 82, 37, 1),
                      Color.fromRGBO(238, 168, 32, 1)
                    ],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                child: const Center(
                  child: Text(
                    "See All History",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Your Offers",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // const Offer1(),
              const SizedBox(
                height: 10,
              ),
              // const Offer2(),
              const SizedBox(
                height: 10,
              ),
              // const Offer3(),
              const SizedBox(
                height: 10,
              ),
              // const Offer4(),
              const SizedBox(
                height: 120,
              ),
            ],
          ),
        ),
      );
    });
  }

  Future openCalenderBox() => showGeneralDialog(
        context: context,
        pageBuilder: (ctx, a1, a2) {
          return Container();
        },
        transitionBuilder: (ctx, a1, a2, child) {
          var curve = Curves.easeInOut.transform(a1.value);
          return Transform.scale(
            scale: curve,
            child:
                Consumer(builder: (context, ThemeModal themeNotifier, child) {
              return Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 220, horizontal: 10),
                decoration: BoxDecoration(
                  color: themeNotifier.isDark
                      ? const Color.fromRGBO(250, 250, 250, 1)
                      : const Color.fromRGBO(0, 0, 0, 1),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SfDateRangePicker(
                    monthCellStyle: const DateRangePickerMonthCellStyle(
                      todayTextStyle: TextStyle(
                          color: Color.fromRGBO(0, 124, 255, 1),
                          fontWeight: FontWeight.w700),
                    ),
                    headerHeight: 80,
                    headerStyle: const DateRangePickerHeaderStyle(
                        textAlign: TextAlign.center,
                        textStyle: TextStyle(
                          color: Color.fromRGBO(2, 2, 2, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        )),
                    view: DateRangePickerView.month,
                    selectionMode: DateRangePickerSelectionMode.range,
                    showActionButtons: true,
                    showNavigationArrow: true,
                    onCancel: () {
                      Navigator.of(context).pop();
                    },
                    onSubmit: (Object? value) {
                      // ignore: avoid_print
                      print(value);
                      Navigator.of(context).pop();
                    },
                    rangeTextStyle: const TextStyle(
                      color: Color.fromRGBO(106, 106, 109, 1),
                      fontSize: 14,
                    ),
                    rangeSelectionColor: const Color.fromRGBO(221, 236, 253, 1),
                    startRangeSelectionColor:
                        const Color.fromRGBO(240, 82, 37, 1),
                    endRangeSelectionColor:
                        const Color.fromRGBO(240, 82, 37, 1),
                    todayHighlightColor: themeNotifier.isDark
                        ? const Color.fromRGBO(106, 106, 109, 1)
                        : const Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
              );
            }),
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
      );
}
