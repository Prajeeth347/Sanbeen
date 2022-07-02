import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sanbeen_zedital/screens/kdummy.dart';

class hdummy extends StatefulWidget {
  @override
  State<hdummy> createState() => _hdummyState();
}

class _hdummyState extends State<hdummy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: OutlinedButton(
        onPressed: () {
          debugPrint('Received click');
        },
        child: const Text('Click Me'),
      )),
    );
  }

  onPress() {
    Navigator.pop(context);
  }
}
