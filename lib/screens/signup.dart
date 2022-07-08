import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  bool obscure_text = true;
  TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController firstname = TextEditingController();
TextEditingController lastname = TextEditingController();
TextEditingController mobile_no = TextEditingController();
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
                padding: const EdgeInsets.fromLTRB(38.0, 0.0, 38.0, 0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Welcome Back!',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 24)),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    TextField(
                        controller: firstname,
                        keyboardType: TextInputType.name,
                        cursorColor: Theme.of(context).primaryColor,
                        style: TextStyle(color: Theme.of(context).hintColor),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 1)),
                          labelText: 'First Name',
                          labelStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                              backgroundColor:
                                  Theme.of(context).backgroundColor,
                              fontSize: 18),
                        )),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    TextField(
                        controller: lastname,
                        keyboardType: TextInputType.name,
                        cursorColor: Theme.of(context).primaryColor,
                        style: TextStyle(color: Theme.of(context).hintColor),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 1)),
                          labelText: 'Last Name',
                          labelStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                              backgroundColor:
                                  Theme.of(context).backgroundColor,
                              fontSize: 18),
                        )),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    TextField(
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Theme.of(context).primaryColor,
                        style: TextStyle(color: Theme.of(context).hintColor),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 1)),
                          labelText: 'Email',
                          labelStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                              backgroundColor:
                                  Theme.of(context).backgroundColor,
                              fontSize: 18),
                        )),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    TextField(
                        controller: mobile_no,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Theme.of(context).primaryColor,
                        style: TextStyle(color: Theme.of(context).hintColor),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 1)),
                          labelText: 'Contact No.',
                          labelStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                              backgroundColor:
                                  Theme.of(context).backgroundColor,
                              fontSize: 18),
                        )),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    TextField(
                        controller: password,
                        keyboardType: TextInputType.visiblePassword,
                        cursorColor: Theme.of(context).primaryColor,
                        style: TextStyle(color: Theme.of(context).hintColor),
                        obscureText: obscure_text,
                        obscuringCharacter: '*',
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
                          labelStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                              backgroundColor:
                                  Theme.of(context).backgroundColor,
                              fontSize: 18),
                        )),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).primaryColor),
                        ),
                        child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                55, 15, 55, 15),
                            child: Text(
                              'SIGN UP',
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Theme.of(context).hintColor,
                                  backgroundColor:
                                      Theme.of(context).primaryColor),
                              textAlign: TextAlign.center,
                            )))
                  ],
                ))),
      ),
    );
  }
}
