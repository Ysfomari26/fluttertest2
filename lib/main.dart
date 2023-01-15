import 'package:flutter/material.dart';
import 'onboarding_screen.dart';
import 'package:fluttertest/video_info.dart';
import 'package:fluttertest/home_page.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? seen = prefs.getBool('seen');
  Widget home = HomePage();
  if (seen == null || seen == false) {
    home = OnboardingScreen();
    prefs.setBool('seen', true);
  }
  runApp(MyApp(home:home));
}

class MyApp extends StatelessWidget {
  final Widget home;
  const MyApp({required this.home, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:home,
      routes: {
        '/home': (context) => HomePage(),
      },
    );
  }
}