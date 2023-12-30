import 'dart:async';

import 'package:mongo_dart/mongo_dart.dart' as mongoDB;
import 'package:samyati/database/constants.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:samyati/Pages/InnerPages/test.dart';
import 'package:samyati/Theme/theme_modal.dart';
import 'package:samyati/Widgets/count_card.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:samyati/Widgets/data_card.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

import '../Logins/loginpage.dart';

class HomeContent extends StatefulWidget {
  final String? title;
  const HomeContent({super.key, this.title});

  @override
  State<HomeContent> createState() => _HomeContentState(title: this.title);
}

class _HomeContentState extends State<HomeContent> {
  bool isVisible = true;
  String? title;
  String steps = "0";
  String cal = "0";
  String dis = "0";
  String percentage_steps = "0";
  String percentage_calories = "0";
  String percentage_distance = "0";
  String earned_coin = "0";
  String week_steps = "0";
  String week_cal = "0";
  String week_dis = "0";
  String week_percentage_steps = "0";
  String week_percentage_calories = "0";
  String week_percentage_distance = "0";
  double coinsInt = 0;
  double stepsInt = 0;
  double stepsUpdated = 0;
  double coinsUpdated = 0;
  _HomeContentState({required this.title});

  late Timer _timer;
  List<HealthDataPoint> _healthDataList = [];
  @override
  void initState() {
    // TODO: implement initState
    _fetchStepData();
    _timer = Timer.periodic(const Duration(minutes: 1), (Timer timer) {
      _fetchStepData();
    });
    super.initState();
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed to prevent memory leaks.
    _timer.cancel();
    super.dispose();
  }

  Future<int?> getPermission() async {
    final result = await Permission.activityRecognition.request();

    if (result.isDenied) {
      // Handle the case where the user denies permission.
      getPermission();
    }

    // Request location permission
    final result1 = await Permission.location.request();
    if (result1.isDenied) {
      // Handle the case where the user denies permission.
      getPermission();
    }

    return 1;
  }

  Future<void> _fetchStepData() async {
    getPermission();
    try {
      final health = HealthFactory();
      var types = [
        HealthDataType.ACTIVE_ENERGY_BURNED,
      ];

      // Request health data authorization
      final authorized = await health.requestAuthorization(types);
      if (!authorized) {
        // Handle the case where the user denies authorization.
        return;
      }
      final now = DateTime.now();
      final start = DateTime(now.year, now.month, now.day, 0, 0, 0);
      final midnight = DateTime(now.year, now.month, now.day);
      bool requested =
          await health.requestAuthorization([HealthDataType.STEPS]);

      int? ste;
      var sPer = 0.0;
      if (requested) {
        try {
          ste = await health.getTotalStepsInInterval(midnight, now);
          sPer = (ste! * 100) / 10000;
        } catch (error) {
          // ignore: use_build_context_synchronously
          return AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.rightSlide,
              title: 'Warning',
              desc: 'Login with Google Fit Account ',
              //btnCancelOnPress: () {},
              btnOkText: "Login",
              btnOkOnPress: () async {
                try {
                  var user = FirebaseAuth.instance.currentUser;
                  if (user != null) {
                    await user.delete();
                    // If successful, the user is deleted, and you can proceed accordingly
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  }
                } catch (e) {
                  // Handle any errors that occur during account deletion or sign-out
                  print("Error deleting user account: $e");
                  // You can display an error message or take appropriate action here
                }
              }).show();
        }
      }

      List<HealthDataPoint> healthData =
          await health.getHealthDataFromTypes(start, now, types);
      _healthDataList.addAll(healthData);

      var c = 0.0;
      var cPer = 0.0;
      for (var x in _healthDataList) {
        String p = x.value.toString();
        double doubleValue = double.parse(p);
        c += doubleValue;
      }
      c = c / 1000;
      cPer = (c * 100) / 10000;
      _healthDataList.clear();
      var types1 = [
        HealthDataType.DISTANCE_DELTA,
      ];
      bool requested1 = await health.requestAuthorization(types1);
      if (!requested1) {
        // Handle the case where the user denies authorization.
        return;
      }
      List<HealthDataPoint> healthData1 =
          await health.getHealthDataFromTypes(start, now, types1);
      _healthDataList.addAll(healthData1);
      var d = 0.0;
      var dPer = 0.0;
      for (var x in _healthDataList) {
        String p = x.value.toString();
        double doubleValue = double.parse(p);
        d += doubleValue;
      }
      d = d / 1000;
      dPer = (d * 100) / 8.0;

      _healthDataList.clear();
      // Update the state with the step data
      setState(() {
        steps = ste.toString();
        cal = c.toStringAsFixed(2);
        dis = d.toStringAsFixed(2);
        percentage_calories = cPer.toStringAsFixed(2);
        percentage_steps = sPer.toStringAsFixed(0);
        percentage_distance = dPer.toStringAsFixed(0);
        earned_coin = (ste! ~/ 10).toString();
        stepsInt = double.parse(steps);
        coinsInt = double.parse(earned_coin);
        stepsUpdated = stepsInt - coinsInt * 10;
        coinsUpdated = stepsUpdated / 10;
        coinsInt += coinsUpdated;
      });
    } catch (e) {
      print("Error fetching health data: $e");
      // Handle the error gracefully (e.g., show an error message to the user).
    }
    updateCoinsDB();
    fetchDataWeek();
  }

  void updateCoinsDB() async {
    var db = await mongoDB.Db.create(MONGO_URL);
    await db.open();

    final collection = db.collection(COLLECTION_NAME);

    final criteria = mongoDB.where.eq('userName', title);
    print(title);
    await collection.updateOne(
        criteria, mongoDB.modify.set('earnedToday', coinsInt));
    await db.close();
  }

  Future<void> fetchDataWeek() async {
    try {
      final health = HealthFactory();
      var types = [
        HealthDataType.ACTIVE_ENERGY_BURNED,
      ];

      // Request health data authorization
      final authorized = await health.requestAuthorization(types);
      if (!authorized) {
        // Handle the case where the user denies authorization.
        return;
      }

      final now = DateTime.now();
      final midnight = DateTime(now.year, now.month, now.day);

      // Calculate the start of the previous week
      final previousWeekStart =
          midnight.subtract(Duration(days: midnight.weekday));

      bool requested =
          await health.requestAuthorization([HealthDataType.STEPS]);

      int? ste;
      var sPer = 0.0;
      if (requested) {
        try {
          // Fetch total steps for the previous week
          ste =
              await health.getTotalStepsInInterval(previousWeekStart, midnight);
          sPer = (ste! * 100) / 10000;
        } catch (error) {
          print("steps not get $error");
        }
      }

      List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
          previousWeekStart, midnight, types);
      _healthDataList.addAll(healthData);

      var c = 0.0;
      var cPer = 0.0;
      for (var x in _healthDataList) {
        String p = x.value.toString();
        double doubleValue = double.parse(p);
        c += doubleValue;
      }
      c = c / 1000;
      cPer = (c * 100) / 10000;
      _healthDataList.clear();

      var types1 = [
        HealthDataType.DISTANCE_DELTA,
      ];

      bool requested1 = await health.requestAuthorization(types1);
      if (!requested1) {
        // Handle the case where the user denies authorization.
        return;
      }

      List<HealthDataPoint> healthData1 = await health.getHealthDataFromTypes(
          previousWeekStart, midnight, types1);
      _healthDataList.addAll(healthData1);

      var d = 0.0;
      var dPer = 0.0;
      for (var x in _healthDataList) {
        String p = x.value.toString();
        double doubleValue = double.parse(p);
        d += doubleValue;
      }
      d = d / 1000;
      dPer = (d * 100) / 8.0;

      _healthDataList.clear();
      // Update the state with the step data
      setState(() {
        if (ste! >= 1000) {
          week_steps = '${(ste / 1000).toStringAsFixed(1)}k';
        } else {
          week_steps = ste.toString();
        }
        week_cal = c.toStringAsFixed(2);
        week_dis = d.toStringAsFixed(2);
        week_percentage_calories = cPer.toStringAsFixed(2);
        week_percentage_steps = sPer.toStringAsFixed(0);
        week_percentage_distance = dPer.toStringAsFixed(0);
        print(week_steps);
      });
    } catch (e) {
      print("Error fetching health data: $e");
      // Handle the error gracefully (e.g., show an error message to the user).
    }
  }

  Future<void> fetchUsingDate(DateTime startDate, DateTime endDate) async {
    print("hello");
    try {
      final health = HealthFactory();
      var types = [
        HealthDataType.ACTIVE_ENERGY_BURNED,
      ];

      // Request health data authorization
      final authorized = await health.requestAuthorization(types);
      if (!authorized) {
        // Handle the case where the user denies authorization.
        return;
      }

      bool requested =
          await health.requestAuthorization([HealthDataType.STEPS]);

      int? steps;
      var stepsPercentage = 0.0;
      if (requested) {
        try {
          // Fetch total steps for the specified date range
          steps = await health.getTotalStepsInInterval(startDate, endDate);
          stepsPercentage = (steps! * 100) / 10000;
        } catch (error) {
          return AwesomeDialog(
            context: context,
            dialogType: DialogType.warning,
            animType: AnimType.rightSlide,
            title: 'Warning',
            desc: 'Data not found ',
            btnCancelOnPress: () {
              setState(() {
                week_steps = "0";
                week_cal = "0";
                week_dis = "0";
                week_percentage_calories = "0";
                week_percentage_steps = "0";
                week_percentage_distance = "0";
                print(week_steps);
              });
            },
            btnOkOnPress: () {
              openCalenderBox();
            },
          ).show();
        }
      }

      List<HealthDataPoint> healthData =
          await health.getHealthDataFromTypes(startDate, endDate, types);
      _healthDataList.addAll(healthData);

      var calories = 0.0;
      var caloriesPercentage = 0.0;
      for (var x in _healthDataList) {
        String p = x.value.toString();
        double doubleValue = double.parse(p);
        calories += doubleValue;
      }
      calories = calories / 1000;
      caloriesPercentage = (calories * 100) / 10000;
      _healthDataList.clear();

      var types1 = [
        HealthDataType.DISTANCE_DELTA,
      ];

      bool requested1 = await health.requestAuthorization(types1);
      if (!requested1) {
        // Handle the case where the user denies authorization.
        return;
      }

      List<HealthDataPoint> healthData1 =
          await health.getHealthDataFromTypes(startDate, endDate, types1);
      _healthDataList.addAll(healthData1);

      var distance = 0.0;
      var distancePercentage = 0.0;
      for (var x in _healthDataList) {
        String p = x.value.toString();
        double doubleValue = double.parse(p);
        distance += doubleValue;
      }
      distance = distance / 1000;
      distancePercentage = (distance * 100) / 8.0;

      _healthDataList.clear();
      // Update the state with the fetched data
      setState(() {
        if (steps! > 10000) {
          week_steps = '${(steps / 1000000).toStringAsFixed(3)}M';
        } else if (steps >= 1000) {
          week_steps = '${(steps / 1000).toStringAsFixed(1)}k';
        } else {
          week_steps = steps.toString();
        }
        week_cal = calories.toStringAsFixed(2);
        week_dis = distance.toStringAsFixed(2);
        week_percentage_calories = caloriesPercentage.toStringAsFixed(2);
        week_percentage_steps = stepsPercentage.toStringAsFixed(0);
        week_percentage_distance = distancePercentage.toStringAsFixed(0);
        print(week_steps);
      });
    } catch (e) {
      print("Error fetching health data: $e");
      // Handle the error gracefully (e.g., show an error message to the user).
    }
  }

  void showToast() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModal themeNotifier, child) {
      return Center(
        child: SingleChildScrollView(
          padding:
              const EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 120,
              ),
              Visibility(
                visible: isVisible,
                child: Material(
                  elevation: 5,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.75,
                        color: themeNotifier.isDark
                            ? const Color.fromRGBO(255, 255, 255, 1)
                            : const Color.fromRGBO(111, 111, 111, 1),
                      ),
                      color: themeNotifier.isDark
                          ? const Color.fromRGBO(255, 255, 255, 1)
                          : const Color.fromRGBO(255, 255, 255, 0.10),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GradientText(
                              " Today's Tips $isVisible",
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700,
                              ),
                              colors: const [
                                Color.fromRGBO(240, 82, 37, 1),
                                Color.fromRGBO(238, 168, 32, 1),
                              ],
                            ),
                            InkWell(
                              onTap: showToast,
                              child: const Icon(
                                Icons.close_rounded,
                                color: Color.fromRGBO(135, 134, 134, 1),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Complete",
                              style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            SvgPicture.asset("assets/images/steps.svg"),
                            Text(
                              "1000",
                              style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Text(
                              "Steps to earn",
                              style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Image.asset(
                              "assets/images/coin.png",
                              height: 22,
                              width: 22,
                            ),
                            GradientText("100",
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                                colors: const [
                                  Color.fromRGBO(240, 82, 37, 1),
                                  Color.fromRGBO(238, 168, 32, 1),
                                ]),
                            Text(
                              "Coin",
                              style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CarouselSlider(
                items: [
                  DataCard(
                    percentage: (double.parse(percentage_steps) / 100.0) > 1.0
                        ? 1.0
                        : (double.parse(percentage_steps) / 100.0),
                    amount: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          steps,
                          style: const TextStyle(
                              color: Color.fromRGBO(0, 124, 255, 1),
                              fontSize: 25,
                              fontWeight: FontWeight.w700),
                        ),
                        const Offstage(),
                      ],
                    ),
                    description: "Steps Today",
                    img: "assets/images/steps.svg",
                    gradient1: Color.fromRGBO(0, 124, 255, 1),
                  ),
                  DataCard(
                    amount: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          cal,
                          style: const TextStyle(
                              color: Color.fromRGBO(0, 124, 255, 1),
                              fontSize: 25,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "Kcal",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(100, 100, 100, 1)),
                        ),
                      ],
                    ),
                    description: "Calories Today",
                    img: "assets/images/fire.svg",
                    percentage: double.parse(percentage_calories) > 1.0
                        ? 1.0
                        : double.parse(percentage_calories),
                    gradient1: Color.fromRGBO(255, 174, 18, 1),
                  ),
                  DataCard(
                    amount: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          dis,
                          style: const TextStyle(
                              color: Color.fromRGBO(0, 124, 255, 1),
                              fontSize: 25,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "Km",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(100, 100, 100, 1)),
                        ),
                      ],
                    ),
                    description: "Steps Distance",
                    img: "assets/images/distance.svg",
                    percentage:
                        (double.parse(percentage_distance) / 100.0) > 1.0
                            ? 1.0
                            : (double.parse(percentage_distance) / 100.0),
                    gradient1: const Color.fromRGBO(106, 208, 81, 1),
                  )
                ],
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 6),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Today's Scores",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Theme.of(context).primaryColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CountCard(
                    cardHeight: 71.52,
                    dataBox: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 146,
                            height: 31.5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/images/steps.svg",
                                  width: 21,
                                  height: 31,
                                ),
                                Text(
                                  steps,
                                  style: const TextStyle(
                                      color: Color.fromRGBO(0, 124, 255, 1),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "/ 10000",
                                  style: TextStyle(
                                      color: themeNotifier.isDark
                                          ? const Color.fromRGBO(16, 16, 16, 1)
                                          : const Color.fromRGBO(
                                              238, 238, 236, 1),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "Steps",
                                  style: TextStyle(
                                      color: themeNotifier.isDark
                                          ? const Color.fromRGBO(
                                              16, 16, 16, 0.5)
                                          : const Color.fromRGBO(
                                              238, 238, 236, 1),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 118,
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/coin.png",
                                  width: 40,
                                  height: 40,
                                ),
                                Text(
                                  earned_coin,
                                  style: const TextStyle(
                                      color: Color.fromRGBO(255, 133, 0, 1),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "Coins",
                                  style: TextStyle(
                                      color: themeNotifier.isDark
                                          ? const Color.fromRGBO(16, 16, 16, 1)
                                          : const Color.fromRGBO(
                                              238, 238, 236, 1),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () => {
                      Navigator.of(context).pop(
                        MaterialPageRoute(
                          builder: (context) => const testPage(),
                        ),
                      ),
                    },
                    child: CountCard(
                      cardHeight: 298,
                      dataBox: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 0.75,
                                  color: themeNotifier.isDark
                                      ? const Color.fromRGBO(255, 255, 255, 1)
                                      : const Color.fromRGBO(111, 111, 111, 1),
                                ),
                              ),
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Steps Count",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: themeNotifier.isDark
                                              ? const Color.fromRGBO(
                                                  16, 16, 16, 1)
                                              : const Color.fromRGBO(
                                                  238, 238, 236, 1),
                                        ),
                                      ),
                                      Text(
                                        "Today's Goal",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13,
                                          color: themeNotifier.isDark
                                              ? const Color.fromRGBO(
                                                  16, 16, 16, 0.5)
                                              : const Color.fromRGBO(
                                                  238, 238, 236, 1),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 69.22,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              "assets/images/steps.svg",
                                              width: 18,
                                              height: 27,
                                            ),
                                            Text(
                                              steps,
                                              style: const TextStyle(
                                                  color: Color.fromRGBO(
                                                      0, 124, 255, 1),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        // width: 100,
                                        // height: 40,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "$percentage_steps%",
                                              style: TextStyle(
                                                  color: themeNotifier.isDark
                                                      ? const Color.fromRGBO(
                                                          16, 16, 16, 1)
                                                      : const Color.fromRGBO(
                                                          238, 238, 236, 1),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              "of 10000",
                                              style: TextStyle(
                                                  color: themeNotifier.isDark
                                                      ? const Color.fromRGBO(
                                                          16, 16, 16, 0.5)
                                                      : const Color.fromRGBO(
                                                          238, 238, 236, 1),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              width: 0.75,
                              color: themeNotifier.isDark
                                  ? const Color.fromRGBO(255, 255, 255, 1)
                                  : const Color.fromRGBO(111, 111, 111, 1),
                            ))),
                            child: Center(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Calories",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: themeNotifier.isDark
                                              ? const Color.fromRGBO(
                                                  16, 16, 16, 1)
                                              : const Color.fromRGBO(
                                                  238, 238, 236, 1),
                                        ),
                                      ),
                                      Text(
                                        "Today's Goal",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13,
                                          color: themeNotifier.isDark
                                              ? const Color.fromRGBO(
                                                  16, 16, 16, 0.5)
                                              : const Color.fromRGBO(
                                                  238, 238, 236, 1),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 69.22,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              "assets/images/fire.svg",
                                              width: 18,
                                              height: 27,
                                            ),
                                            GradientText(
                                              cal,
                                              style: const TextStyle(
                                                  color: Color.fromRGBO(
                                                      0, 124, 255, 1),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700),
                                              colors: const [
                                                Color.fromRGBO(240, 82, 37, 1),
                                                Color.fromRGBO(238, 168, 32, 1),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        // width: 100,
                                        // height: 40,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "$percentage_calories%",
                                              style: TextStyle(
                                                  color: themeNotifier.isDark
                                                      ? const Color.fromRGBO(
                                                          16, 16, 16, 1)
                                                      : const Color.fromRGBO(
                                                          238, 238, 236, 1),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              "of 10000 Kcal",
                                              style: TextStyle(
                                                  color: themeNotifier.isDark
                                                      ? const Color.fromRGBO(
                                                          16, 16, 16, 0.5)
                                                      : const Color.fromRGBO(
                                                          238, 238, 236, 1),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Center(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Distance",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: themeNotifier.isDark
                                              ? const Color.fromRGBO(
                                                  16, 16, 16, 1)
                                              : const Color.fromRGBO(
                                                  238, 238, 236, 1),
                                        ),
                                      ),
                                      Text(
                                        "Today's Goal",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13,
                                          color: themeNotifier.isDark
                                              ? const Color.fromRGBO(
                                                  16, 16, 16, 0.5)
                                              : const Color.fromRGBO(
                                                  238, 238, 236, 1),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 69.22,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              "assets/images/distance.svg",
                                              width: 18,
                                              height: 27,
                                            ),
                                            Text(
                                              dis,
                                              style: const TextStyle(
                                                  color: Color.fromRGBO(
                                                      106, 208, 81, 1),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "$percentage_distance%",
                                              style: TextStyle(
                                                  color: themeNotifier.isDark
                                                      ? const Color.fromRGBO(
                                                          16, 16, 16, 1)
                                                      : const Color.fromRGBO(
                                                          238, 238, 236, 1),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              "of 8.0 Km",
                                              style: TextStyle(
                                                  color: themeNotifier.isDark
                                                      ? const Color.fromRGBO(
                                                          16, 16, 16, 0.5)
                                                      : const Color.fromRGBO(
                                                          238, 238, 236, 1),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Total Scores",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            openCalenderBox();
                          },
                          child: Row(
                            children: [
                              Text(
                                "Last Week",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: Theme.of(context).primaryColor),
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
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CountCard(
                    cardHeight: 298,
                    dataBox: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 0.75,
                                color: themeNotifier.isDark
                                    ? const Color.fromRGBO(255, 255, 255, 1)
                                    : const Color.fromRGBO(111, 111, 111, 1),
                              ),
                            ),
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Steps Count",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: themeNotifier.isDark
                                            ? const Color.fromRGBO(
                                                16, 16, 16, 1)
                                            : const Color.fromRGBO(
                                                238, 238, 236, 1),
                                      ),
                                    ),
                                    Text(
                                      "Today's Goal",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                        color: themeNotifier.isDark
                                            ? const Color.fromRGBO(
                                                16, 16, 16, 0.5)
                                            : const Color.fromRGBO(
                                                238, 238, 236, 1),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 69.22,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            "assets/images/steps.svg",
                                            width: 18,
                                            height: 27,
                                          ),
                                          Text(
                                            week_steps,
                                            style: const TextStyle(
                                                color: Color.fromRGBO(
                                                    0, 124, 255, 1),
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      // width: 100,
                                      // height: 40,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "$week_percentage_steps%",
                                            style: TextStyle(
                                                color: themeNotifier.isDark
                                                    ? const Color.fromRGBO(
                                                        16, 16, 16, 1)
                                                    : const Color.fromRGBO(
                                                        238, 238, 236, 1),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            "of 10000",
                                            style: TextStyle(
                                                color: themeNotifier.isDark
                                                    ? const Color.fromRGBO(
                                                        16, 16, 16, 0.5)
                                                    : const Color.fromRGBO(
                                                        238, 238, 236, 1),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                            width: 0.75,
                            color: themeNotifier.isDark
                                ? const Color.fromRGBO(255, 255, 255, 1)
                                : const Color.fromRGBO(111, 111, 111, 1),
                          ))),
                          child: Center(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Calories",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: themeNotifier.isDark
                                            ? const Color.fromRGBO(
                                                16, 16, 16, 1)
                                            : const Color.fromRGBO(
                                                238, 238, 236, 1),
                                      ),
                                    ),
                                    Text(
                                      "Today's Goal",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                        color: themeNotifier.isDark
                                            ? const Color.fromRGBO(
                                                16, 16, 16, 0.5)
                                            : const Color.fromRGBO(
                                                238, 238, 236, 1),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 69.22,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            "assets/images/fire.svg",
                                            width: 18,
                                            height: 27,
                                          ),
                                          GradientText(
                                            week_cal,
                                            style: const TextStyle(
                                                color: Color.fromRGBO(
                                                    0, 124, 255, 1),
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700),
                                            colors: const [
                                              Color.fromRGBO(240, 82, 37, 1),
                                              Color.fromRGBO(238, 168, 32, 1),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      // width: 100,
                                      // height: 40,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "$week_percentage_calories%",
                                            style: TextStyle(
                                                color: themeNotifier.isDark
                                                    ? const Color.fromRGBO(
                                                        16, 16, 16, 1)
                                                    : const Color.fromRGBO(
                                                        238, 238, 236, 1),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            "of 10000 Kcal",
                                            style: TextStyle(
                                                color: themeNotifier.isDark
                                                    ? const Color.fromRGBO(
                                                        16, 16, 16, 0.5)
                                                    : const Color.fromRGBO(
                                                        238, 238, 236, 1),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Center(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Distance",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: themeNotifier.isDark
                                            ? const Color.fromRGBO(
                                                16, 16, 16, 1)
                                            : const Color.fromRGBO(
                                                238, 238, 236, 1),
                                      ),
                                    ),
                                    Text(
                                      "Today's Goal",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                        color: themeNotifier.isDark
                                            ? const Color.fromRGBO(
                                                16, 16, 16, 0.5)
                                            : const Color.fromRGBO(
                                                238, 238, 236, 1),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 69.22,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            "assets/images/distance.svg",
                                            width: 18,
                                            height: 27,
                                          ),
                                          Text(
                                            week_dis,
                                            style: const TextStyle(
                                                color: Color.fromRGBO(
                                                    106, 208, 81, 1),
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "$week_percentage_distance%",
                                            style: TextStyle(
                                                color: themeNotifier.isDark
                                                    ? const Color.fromRGBO(
                                                        16, 16, 16, 1)
                                                    : const Color.fromRGBO(
                                                        238, 238, 236, 1),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            "of 8.0 Km",
                                            style: TextStyle(
                                                color: themeNotifier.isDark
                                                    ? const Color.fromRGBO(
                                                        16, 16, 16, 0.5)
                                                    : const Color.fromRGBO(
                                                        238, 238, 236, 1),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 110,
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

                      if (value != null && value is PickerDateRange) {
                        DateTime? startDate = value.startDate;
                        DateTime? endDate = value.endDate;

                        if (startDate != null && endDate != null) {
                          fetchUsingDate(startDate, endDate);
                        }
                      }

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
