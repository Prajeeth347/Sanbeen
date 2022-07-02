import 'dart:ui';

import 'package:flutter/material.dart';

TextEditingController password = TextEditingController();
bool obscure_text = true;

class hdummy extends StatefulWidget {
  @override
  State<hdummy> createState() => _hdummyState();
}

class _hdummyState extends State<hdummy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: TextField(
        controller: password,
        keyboardType: TextInputType.visiblePassword,
        obscureText: obscure_text,
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).primaryColor, width: 1)),
            labelText: 'Password',
            labelStyle: TextStyle(
                color: Theme.of(context).primaryColor,
                backgroundColor: Theme.of(context).backgroundColor,
                fontSize: 18),
            suffixIcon: IconButton(
              onPressed: () {
                setState(
                  () {
                    obscure_text = !obscure_text;
                  },
                );
              },
              icon:
                  Icon(obscure_text ? Icons.visibility : Icons.visibility_off),
              color: Theme.of(context).primaryColor,
            )),
      ),
    ));
  }
}
