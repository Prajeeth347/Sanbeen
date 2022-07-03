import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sanbeen_zedital/screens/forgotpassword.dart';
import 'package:sanbeen_zedital/screens/signup.dart';

bool obscure_text = true;

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();

class signin extends StatefulWidget {
  const signin({Key? key}) : super(key: key);

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                Padding(
                  padding: const EdgeInsets.fromLTRB(115, 15, 115, 15),
                  child: Image.asset('assets/images/logo.jpeg'),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Text('SANBEEN REAL ESTATE',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 22)),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Text('& Realtors Pvt.Ltd.',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 19)),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                TextField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Theme.of(context).primaryColor,
                    style: TextStyle(color: Theme.of(context).hintColor),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor, width: 1)),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                          backgroundColor: Theme.of(context).backgroundColor,
                          fontSize: 18),
                    )),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                TextField(
                    controller: password,
                    keyboardType: TextInputType.visiblePassword,
                    cursorColor: Theme.of(context).primaryColor,
                    obscureText: obscure_text,
                    obscuringCharacter: '*',
                    style: TextStyle(color: Theme.of(context).hintColor),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(
                            () {
                              obscure_text = !obscure_text;
                            },
                          );
                        },
                        icon: Icon(obscure_text
                            ? Icons.visibility
                            : Icons.visibility_off),
                        color: Theme.of(context).primaryColor,
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor, width: 1)),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                          backgroundColor: Theme.of(context).backgroundColor,
                          fontSize: 18),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => forgotpassword()));
                    },
                    child: Container(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Theme.of(context).hintColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor),
                    ),
                    child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            75, 15, 75, 15),
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                              fontSize: 19,
                              color: Theme.of(context).hintColor,
                              backgroundColor: Theme.of(context).primaryColor),
                          textAlign: TextAlign.center,
                        ))),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => signup()));
                    },
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                      child: Text(
                        'Don`t have an account? Join us',
                        style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).primaryColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )),
              ]),
        ),
      )),
    );
  }
}
