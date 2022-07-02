import 'package:flutter/material.dart';
import 'package:sanbeen_zedital/extentions/extentions.dart';
import 'package:sanbeen_zedital/screens/aboutuspage.dart';
import 'package:sanbeen_zedital/screens/begin_posting.dart';
import 'package:sanbeen_zedital/screens/feedback.dart';
import 'package:sanbeen_zedital/screens/hdummy.dart';
import 'package:sanbeen_zedital/screens/kdummy.dart';
import 'package:sanbeen_zedital/screens/profilepage.dart';
import 'package:sanbeen_zedital/screens/properties(20).dart';
import 'package:sanbeen_zedital/screens/properties.dart';
import 'package:sanbeen_zedital/screens/signup.dart';
import 'package:sanbeen_zedital/screens/signin.dart';
import 'package:sanbeen_zedital/screens/testimonials.dart';

void main() {
  runApp(const MyApp());
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
        home: const MyHomePage(),
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
              Image.asset('assets/images/logo.jpeg'),
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
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => aboutus()));
                },
                label: Text('FAQ'),
                backgroundColor: Theme.of(context).hintColor,
                foregroundColor: Theme.of(context).backgroundColor,
              ),
              SizedBox(
                height: 10,
              ),
              FloatingActionButton.extended(
                heroTag: 'KDUMMY',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => kdummy()));
                },
                label: Text('Karhik(Dummy page)'),
                backgroundColor: Theme.of(context).hintColor,
                foregroundColor: Theme.of(context).backgroundColor,
              ),
              SizedBox(
                height: 10,
              ),
              FloatingActionButton.extended(
                heroTag: 'HDUMMY',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => hdummy()));
                },
                label: Text('Harshini(Dummy page)'),
                backgroundColor: Theme.of(context).hintColor,
                foregroundColor: Theme.of(context).backgroundColor,
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
              FloatingActionButton.extended(
                heroTag: 'Properties',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => properties()));
                },
                label: Text('Properties'),
                backgroundColor: Theme.of(context).hintColor,
                foregroundColor: Theme.of(context).backgroundColor,
              ),
              SizedBox(
                height: 10,
              ),
              FloatingActionButton.extended(
                heroTag: 'Properties(20)',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => properties_20()));
                },
                label: Text('Properties(20)'),
                backgroundColor: Theme.of(context).hintColor,
                foregroundColor: Theme.of(context).backgroundColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
