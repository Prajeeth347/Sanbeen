import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:sanbeen_zedital/main.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({Key? key}) : super(key: key);

  @override
  State<FeedBack> createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  TextEditingController feedBackcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController mobilecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).primaryColor,
              size: MediaQuery.of(context).size.width * 0.07,
            )),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'FeedBack',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              TextField(
                style: TextStyle(color: Theme.of(context).hintColor),
                keyboardType: TextInputType.text,
                cursorColor: Theme.of(context).hintColor,
                decoration: InputDecoration(
                  labelStyle: GoogleFonts.poppins(
                      color: Theme.of(context).primaryColor,
                      fontSize: MediaQuery.of(context).size.width * 0.038,
                      fontWeight: FontWeight.w300),
                  labelText: 'Write your FeedBack',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 1,
                        color: Theme.of(context).primaryColor), //<-- SEE HERE
                  ),
                ),
                controller: feedBackcontroller,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              TextField(
                style: TextStyle(color: Theme.of(context).hintColor),
                keyboardType: TextInputType.emailAddress,
                cursorColor: Theme.of(context).hintColor,
                decoration: InputDecoration(
                  labelStyle: GoogleFonts.poppins(
                      color: Theme.of(context).primaryColor,
                      fontSize: MediaQuery.of(context).size.width * 0.038,
                      fontWeight: FontWeight.w300),
                  labelText: 'Email',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 1,
                        color: Theme.of(context).primaryColor), //<-- SEE HERE
                  ),
                ),
                controller: emailcontroller,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              TextField(
                style: TextStyle(color: Theme.of(context).hintColor),
                keyboardType: TextInputType.name,
                cursorColor: Theme.of(context).hintColor,
                decoration: InputDecoration(
                  labelStyle: GoogleFonts.poppins(
                      color: Theme.of(context).primaryColor,
                      fontSize: MediaQuery.of(context).size.width * 0.038,
                      fontWeight: FontWeight.w300),
                  labelText: 'Name',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 1,
                        color: Theme.of(context).primaryColor), //<-- SEE HERE
                  ),
                ),
                controller: namecontroller,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              TextField(
                style: TextStyle(color: Theme.of(context).hintColor),
                keyboardType: TextInputType.number,
                cursorColor: Theme.of(context).hintColor,
                decoration: InputDecoration(
                  labelStyle: GoogleFonts.poppins(
                      color: Theme.of(context).primaryColor,
                      fontSize: MediaQuery.of(context).size.width * 0.038,
                      fontWeight: FontWeight.w300),
                  labelText: 'Mobile no.',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 1,
                        color: Theme.of(context).primaryColor), //<-- SEE HERE
                  ),
                ),
                controller: mobilecontroller,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(
                                color: Theme.of(context).primaryColor)),
                        primary: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {
                        showAlertDialog(context);
                      },
                      child: Text(
                        "Submit FeedBack",
                        style: GoogleFonts.poppins(
                            color: Theme.of(context).hintColor,
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.w400),
                      )),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Center(
                child: Text(
                  'or you can call the tollfree number',
                  style: GoogleFonts.poppins(
                      color: Theme.of(context).primaryColor,
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              TextButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.support_agent,
                      color: Theme.of(context).primaryColor,
                      size: MediaQuery.of(context).size.width * 0.09,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.015,
                    ),
                    Text(
                      '1800-XXXX-YYYY',
                      style: GoogleFonts.poppins(
                          color: Theme.of(context).primaryColor,
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                onPressed: () {
                  FlutterPhoneDirectCaller.callNumber('7989772884');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = TextButton(
      child:
          Text("OK", style: TextStyle(color: Theme.of(context).primaryColor)),
      onPressed: () {
        feedBackcontroller.clear();
        emailcontroller.clear();
        namecontroller.clear();
        mobilecontroller.clear();
        Navigator.of(context).pop();
      },
    );
    AlertDialog alert = AlertDialog(
      backgroundColor: Theme.of(context).backgroundColor,
      title: Text(
        "Success",
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
      content: Text("Feddback sent successfully",
          style: TextStyle(color: Theme.of(context).primaryColor)),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
