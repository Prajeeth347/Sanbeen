import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword extends StatelessWidget {
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
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Forgot Password',
                        style: GoogleFonts.poppins(
                          color: Theme.of(context).primaryColor,
                          fontSize: MediaQuery.of(context).size.height * 0.023,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    TextField(
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Theme.of(context).primaryColor,
                        style: GoogleFonts.inter(
                          color: Theme.of(context).hintColor,
                          fontSize: MediaQuery.of(context).size.height * 0.019,
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
                            fontSize: MediaQuery.of(context).size.height * 0.02,
                            fontWeight: FontWeight.w300,
                          ),
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
                              style: GoogleFonts.poppins(
                                color: Theme.of(context).hintColor,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.center,
                            )))
                  ],
                ))),
      ),
    );
  }
}
