import 'package:flutter/material.dart';

class forgotpassword extends StatelessWidget {
  TextEditingController email = TextEditingController();
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
                    Text('Forgot Password',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 24)),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
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
                              'Reset Password',
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
