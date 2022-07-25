import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
//import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool obscuretext = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController mobileno = TextEditingController();
  signup() async {
    Map<String, dynamic>; // responseMap;
    var signclient = http.Client();
    var signuri =
        Uri.parse("https://sanbeen-real-estate.herokuapp.com/api/users/");
    var signresponse = await signclient.post(signuri,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email.text,
          "password": password.text,
          "first_name": firstname.text,
          "last_name": lastname.text,
          "user_role": "user"
        }));

    print(signresponse.statusCode);
    print(signresponse.body);

    // if (signresponse.statusCode == 200) {
    //   Fluttertoast.showToast(
    //       msg: "Successful",
    //       gravity: ToastGravity.BOTTOM,
    //       backgroundColor: Theme.of(context).hintColor,
    //       textColor: Theme.of(context).backgroundColor,
    //       fontSize: 16.0);
    // } else if (signresponse.statusCode == 404) {
    //   Fluttertoast.showToast(
    //       msg: "Something Went wrong",
    //       gravity: ToastGravity.BOTTOM,
    //       backgroundColor: Theme.of(context).hintColor,
    //       textColor: Theme.of(context).backgroundColor,
    //       fontSize: 16.0);
    // } else {
    //   Fluttertoast.showToast(
    //       msg: signresponse.body,
    //       gravity: ToastGravity.BOTTOM,
    //       backgroundColor: Theme.of(context).hintColor,
    //       textColor: Theme.of(context).backgroundColor,
    //       fontSize: 16.0);
    // }
  }

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
            size: MediaQuery.of(context).size.width * 0.08,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(38.0, 0.0, 38.0, 0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome Back!',
                      style: GoogleFonts.poppins(
                        color: Theme.of(context).primaryColor,
                        fontSize: MediaQuery.of(context).size.height * 0.024,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    TextField(
                        controller: firstname,
                        keyboardType: TextInputType.name,
                        cursorColor: Theme.of(context).primaryColor,
                        style: GoogleFonts.inter(
                          color: Theme.of(context).hintColor,
                          fontSize: MediaQuery.of(context).size.height * 0.018,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 1)),
                          labelText: 'First Name',
                          labelStyle: GoogleFonts.poppins(
                            color: Theme.of(context).primaryColor,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.019,
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    TextField(
                        controller: lastname,
                        keyboardType: TextInputType.name,
                        cursorColor: Theme.of(context).primaryColor,
                        style: GoogleFonts.inter(
                          color: Theme.of(context).hintColor,
                          fontSize: MediaQuery.of(context).size.height * 0.018,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 1)),
                          labelText: 'Last Name',
                          labelStyle: GoogleFonts.poppins(
                            color: Theme.of(context).primaryColor,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.019,
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    TextField(
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Theme.of(context).primaryColor,
                        style: GoogleFonts.inter(
                          color: Theme.of(context).hintColor,
                          fontSize: MediaQuery.of(context).size.height * 0.018,
                          fontWeight: FontWeight.w400,
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
                                MediaQuery.of(context).size.height * 0.019,
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    TextField(
                        controller: mobileno,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Theme.of(context).primaryColor,
                        style: GoogleFonts.inter(
                          color: Theme.of(context).hintColor,
                          fontSize: MediaQuery.of(context).size.height * 0.018,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 1)),
                          labelText: 'Contact No.',
                          labelStyle: GoogleFonts.poppins(
                            color: Theme.of(context).primaryColor,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.019,
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    TextField(
                        controller: password,
                        keyboardType: TextInputType.visiblePassword,
                        cursorColor: Theme.of(context).primaryColor,
                        style: GoogleFonts.inter(
                          color: Theme.of(context).hintColor,
                          fontSize: MediaQuery.of(context).size.height * 0.018,
                          fontWeight: FontWeight.w400,
                        ),
                        obscureText: obscuretext,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(
                                () {
                                  obscuretext = !obscuretext;
                                },
                              );
                            },
                            icon: Icon(obscuretext
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
                                MediaQuery.of(context).size.height * 0.019,
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                    ElevatedButton(
                        onPressed: () {
                          const SignUp();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).primaryColor),
                        ),
                        child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                55, 10, 55, 10),
                            child: Text(
                              'SIGN UP',
                              style: GoogleFonts.poppins(
                                color: Theme.of(context).hintColor,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.025,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            )))
                  ],
                ))),
      ),
    );
  }
}
