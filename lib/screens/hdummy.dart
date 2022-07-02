import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class hdummy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context);
        },
        label: Text('Go back'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
    ));
  }
}
