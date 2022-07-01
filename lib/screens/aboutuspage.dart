import 'package:flutter/material.dart';
class aboutus extends StatelessWidget {
  const aboutus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    label: Text('Go back'),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
      ),
    );
  }
}