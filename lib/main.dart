import 'package:flutter/material.dart';
import 'package:sanbeen_zedital/aboutuspage.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
     body: Center(
       child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => aboutus()));
                    },
                    label: Text('About us page'),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                  SizedBox(height: 10,),
                  FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => aboutus()));
                    },
                    label: Text('FAQ'),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
        ],
        ),
     ),
    );
  }
}