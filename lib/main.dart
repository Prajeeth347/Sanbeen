import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:sanbeen_zedital/extentions/extentions.dart';
import 'package:sanbeen_zedital/main_navbar.dart';
import 'package:sanbeen_zedital/screens/aboutuspage.dart';
import 'package:sanbeen_zedital/screens/begin_posting.dart';
import 'package:sanbeen_zedital/screens/exploring_page..dart';
import 'package:sanbeen_zedital/screens/faqpage.dart';
import 'package:sanbeen_zedital/screens/feedback.dart';
import 'package:sanbeen_zedital/screens/mainpage.dart';
import 'package:sanbeen_zedital/screens/recentactivity.dart';
import 'package:sanbeen_zedital/screens/profilepage.dart';
import 'package:sanbeen_zedital/screens/properties_all.dart';
import 'package:sanbeen_zedital/screens/shortlistedproperties.dart';
import 'package:sanbeen_zedital/screens/rentals_page.dart';
import 'package:sanbeen_zedital/screens/buy_prop_page.dart';
import 'package:sanbeen_zedital/screens/signup.dart';
import 'package:sanbeen_zedital/screens/signin.dart';
import 'package:sanbeen_zedital/screens/testimonials.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(MyApp());
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
            nextScreen: MyHomePage()),
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
                heroTag: 'Aboutus',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => aboutus()));
                },
                label: Text('About us page'),
                backgroundColor: Theme.of(context).hintColor,
                foregroundColor: Theme.of(context).backgroundColor,
              ),
              SizedBox(
                height: 10,
              ),
              FloatingActionButton.extended(
                heroTag: 'FAQ',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => faqpage()));
                },
                label: Text('FAQ'),
                backgroundColor: Theme.of(context).hintColor,
                foregroundColor: Theme.of(context).backgroundColor,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              FloatingActionButton.extended(
                heroTag: 'Begin Posting',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => begin_posting()));
                },
                label: Text('Property posting(22,23,24)'),
                backgroundColor: Theme.of(context).hintColor,
                foregroundColor: Theme.of(context).backgroundColor,
              ),
              SizedBox(
                height: 10,
              ),
              FloatingActionButton.extended(
                heroTag: 'Profile page',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => profile_page()));
                },
                label: Text('Profile page(14,15,16,25)'),
                backgroundColor: Theme.of(context).hintColor,
                foregroundColor: Theme.of(context).backgroundColor,
              ),
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
                heroTag: 'Shortlisted Properties',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => short_properties()));
                },
                label: Text('Shortlisted Properties(17)'),
                backgroundColor: Theme.of(context).hintColor,
                foregroundColor: Theme.of(context).backgroundColor,
              ),
              SizedBox(
                height: 10,
              ),
              FloatingActionButton.extended(
                heroTag: 'Properties(20)',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => properties_all()));
                },
                label: Text('Properties(20)'),
                backgroundColor: Theme.of(context).hintColor,
                foregroundColor: Theme.of(context).backgroundColor,
              ),
              SizedBox(
                height: 10,
              ),
              FloatingActionButton.extended(
                heroTag: 'Start exploring(26)',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => exploring_page()));
                },
                label: Text('Start Exploring(26)'),
                backgroundColor: Theme.of(context).hintColor,
                foregroundColor: Theme.of(context).backgroundColor,
              ),
              SizedBox(
                height: 10,
              ),
              FloatingActionButton.extended(
                heroTag: 'Rentals Page(8)',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => rentals_page()));
                },
                label: Text('RentalsPage (8)'),
                backgroundColor: Theme.of(context).hintColor,
                foregroundColor: Theme.of(context).backgroundColor,
              ),
              SizedBox(
                height: 10,
              ),
              FloatingActionButton.extended(
                heroTag: 'buying properties Page(8)',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => buying_prop_page()));
                },
                label: Text('buying properties Page (19)'),
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
              FloatingActionButton.extended(
                heroTag: 'recent activity',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => recent_activity()));
                },
                label: Text('recent activity'),
                backgroundColor: Theme.of(context).hintColor,
                foregroundColor: Theme.of(context).backgroundColor,
              ),
              SizedBox(
                height: 10,
              ),
              FloatingActionButton.extended(
                heroTag: 'Testimonials',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => testimonials()));
                },
                label: Text('testimonials'),
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
