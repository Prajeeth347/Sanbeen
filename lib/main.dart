import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:sanbeen_zedital/extentions/extentions.dart';
import 'package:sanbeen_zedital/main_navbar.dart';
import 'package:sanbeen_zedital/screens/properties_all.dart';
import 'package:sanbeen_zedital/screens/signin.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('Email');
  runApp(email == null ? MyApp() : MyApp1());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MaterialApp(
        theme: ThemeData(
            backgroundColor: '05090A'.toColor(),
            primaryColor: 'D4AF37'.toColor(),
            hintColor: 'ECF1F4'.toColor()),
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
            splash: Center(
              child: Image.asset('assets/images/logoo.png'),
            ),
            duration: 3000,
            // splashTransition: SplashTransition.decoratedBoxTransition,
            backgroundColor: '05090A'.toColor(),
            nextScreen: signin()),
      ),
    );
  }
}
class MyApp1 extends StatelessWidget {
  const MyApp1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MaterialApp(
        theme: ThemeData(
            backgroundColor: '05090A'.toColor(),
            primaryColor: 'D4AF37'.toColor(),
            hintColor: 'ECF1F4'.toColor()),
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
            splash: Center(
              child: Image.asset('assets/images/logoo.png'),
            ),
            duration: 3000,
            // splashTransition: SplashTransition.decoratedBoxTransition,
            backgroundColor: '05090A'.toColor(),
            nextScreen: mainnavbar()),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logoo.png'),
              SizedBox(
                height: 10,
              ),
              FloatingActionButton.extended(
                heroTag: 'SignIn page',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => signin()));
                },
                label: Text('Sign In'),
                backgroundColor: Theme.of(context).hintColor,
                foregroundColor: Theme.of(context).backgroundColor,
              ),
              SizedBox(
                height: 10,
              ),
              FloatingActionButton.extended(
                heroTag: 'mainpage',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => mainnavbar()));
                },
                label: Text('Main Page'),
                backgroundColor: Theme.of(context).hintColor,
                foregroundColor: Theme.of(context).backgroundColor,
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
