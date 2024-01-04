import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nearbyherbs/pages/about.dart';
import 'pages/home_page.dart';
import 'pages/intro_page.dart';
import 'splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes:<String, WidgetBuilder>{
      '/' : (context) => const SplashScreen(),
      '/HomePage': (BuildContext context) => const HomePage(),
      '/IntroPage': (BuildContext context) => const IntroPage(),
      '/About': (BuildContext context) => const AboutPage(),
    },
  ));
}