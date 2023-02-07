import 'package:family/controller/constants/constants.dart';
import 'package:family/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tree',
      theme: ThemeData(
        primaryColor: theme,
        splashColor: theme.withOpacity(0.25),
        highlightColor: theme.withOpacity(0.25),
        scaffoldBackgroundColor: white,
        appBarTheme: const AppBarTheme(
          foregroundColor: white,
          elevation: 0,
          backgroundColor: theme,
          titleSpacing: 30,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: theme,
            statusBarIconBrightness: Brightness.light,
          ),
          iconTheme: IconThemeData(color: white),
          titleTextStyle: TextStyle(
            color: white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          ),
        ),
        textSelectionTheme: const TextSelectionThemeData(cursorColor: white),
      ),
      home: const Home(),
    );
  }
}
