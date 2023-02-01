import 'package:flutter/material.dart';
import 'package:news/config/config.dart';
import 'package:news/pages/main.dart';
import 'package:news/utils/next_screen.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    _afterSplash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(
          height: 300,
          image: AssetImage(Config.splashImage),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Future _afterSplash() async {
    Future.delayed(Duration(milliseconds: 1500)).then((value) {
      _gotoHomePage();
    });
  }

  void _gotoHomePage() {
    nextScreenReplace(context, MainPage());
  }
}
