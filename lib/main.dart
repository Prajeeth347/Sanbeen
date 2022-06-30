import 'package:flutter/material.dart';
import 'package:sanbeen_zedital/aboutuspage.dart';
import 'package:sanbeen_zedital/hdummy.dart';
import 'package:sanbeen_zedital/kdummy.dart';
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
       child: SingleChildScrollView(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton.extended(
                      heroTag: 'Aboutus',
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => aboutus()));
                      },
                      label: Text('About us page'),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    SizedBox(height: 10,),
                    FloatingActionButton.extended(
                      heroTag: 'FAQ',
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => aboutus()));
                      },
                      label: Text('FAQ'),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    SizedBox(height: 10,),
                    FloatingActionButton.extended(
                      heroTag: 'KDUMMY',
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => kdummy()));
                      },
                      label: Text('Karhik(Dummy page)'),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    SizedBox(height: 10,),FloatingActionButton.extended(
                      heroTag: 'HDUMMY',
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => hdummy()));
                      },
                      label: Text('Harshini(Dummy page)'),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
          ],
          ),
       ),
     ),
    );
  }
}