import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanbeen_zedital/drawers/main_drawer.dart';
import 'package:sanbeen_zedital/main_navbar.dart';
import 'package:sanbeen_zedital/screens/forgotpassword.dart';
import 'package:sanbeen_zedital/screens/mainpage.dart';
import 'package:sanbeen_zedital/screens/signup.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class signin extends StatefulWidget {
  const signin({Key? key}) : super(key: key);

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  signin() async {
    Map<String, dynamic> responseMap;
    var sign_client = http.Client();
    var sign_uri =
        Uri.parse("https://sanbeen-real-estate.herokuapp.com/api/auth/");
    var sign_response = await sign_client.post(sign_uri,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email.text, "password": password.text}));
    if (sign_response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Successful",
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Theme.of(context).hintColor,
          textColor: Theme.of(context).backgroundColor,
          fontSize: 16.0);
          SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setString('Email', email.text.trim());
          Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => mainnavbar()));
    } else if (sign_response.statusCode == 404) {
      Fluttertoast.showToast(
          msg: "Something Went wrong",
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Theme.of(context).hintColor,
          textColor: Theme.of(context).backgroundColor,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: sign_response.body,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Theme.of(context).hintColor,
          textColor: Theme.of(context).backgroundColor,
          fontSize: 16.0);
    }
  }

  bool obscure_text = true;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/background.png',
              height: MediaQuery.of(context).size.height * 0.8,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.18),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(115, 15, 115, 15),
                        child: Image.asset('assets/images/logoo.png'),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04),
                      Text(
                        'SANBEEN REAL ESTATE',
                        style: GoogleFonts.poppins(
                          color: Theme.of(context).primaryColor,
                          fontSize: MediaQuery.of(context).size.height * 0.025,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '& Realtors Pvt. Ltd.',
                        style: GoogleFonts.poppins(
                          color: Theme.of(context).primaryColor,
                          fontSize: MediaQuery.of(context).size.height * 0.021,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      TextField(
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Theme.of(context).primaryColor,
                          style: GoogleFonts.inter(
                            color: Theme.of(context).hintColor,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.019,
                            fontWeight: FontWeight.w300,
                          ),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 1)),
                            labelText: 'Email',
                            labelStyle: GoogleFonts.poppins(
                              color: Theme.of(context).primaryColor,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02,
                              fontWeight: FontWeight.w300,
                            ),
                          )),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      TextField(
                          controller: password,
                          keyboardType: TextInputType.visiblePassword,
                          cursorColor: Theme.of(context).primaryColor,
                          obscureText: obscure_text,
                          obscuringCharacter: '*',
                          style: GoogleFonts.inter(
                            color: Theme.of(context).hintColor,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.019,
                            fontWeight: FontWeight.w300,
                          ),
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
                                    color: Theme.of(context).primaryColor,
                                    width: 1)),
                            labelText: 'Password',
                            labelStyle: GoogleFonts.poppins(
                              color: Theme.of(context).primaryColor,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02,
                              fontWeight: FontWeight.w300,
                            ),
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
                              style: GoogleFonts.inter(
                                color: Theme.of(context).hintColor,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.015,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      ElevatedButton(
                          onPressed: () {
                            signin();
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).primaryColor),
                          ),
                          child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  75, 15, 75, 15),
                              child: Text(
                                'LOGIN',
                                style: GoogleFonts.inter(
                                  color: Theme.of(context).hintColor,
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.02,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              ))),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => signup()));
                          },
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                5, 5, 5, 5),
                            child: Text(
                              'Don`t have an account? Join us',
                              style: GoogleFonts.inter(
                                color: Theme.of(context).primaryColor,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.018,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
