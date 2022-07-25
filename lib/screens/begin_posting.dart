import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanbeen_zedital/screens/posting_property.dart';

class BeginPosting extends StatefulWidget {
  const BeginPosting({Key? key}) : super(key: key);

  @override
  State<BeginPosting> createState() => _BeginPostingState();
}

class _BeginPostingState extends State<BeginPosting> {
  //@override
  String _lookingfor = 'Apartment';
  String _sellingtype = "Sell";
  bool pressAttention = true;
  bool press = false;
  bool secpressAttention = true;
  bool secpress = false;
  bool secpress1 = false;
  bool secpress2 = false;
  TextEditingController mobilecontroller = TextEditingController();
  List<bool> isSelected = [true, false, false];

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
              size: MediaQuery.of(context).size.width * 0.08,
            )),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 8.0, 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Begin Posting your Property',
                style: GoogleFonts.poppins(
                  color: Theme.of(context).primaryColor,
                  fontSize: MediaQuery.of(context).size.height * 0.025,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              Text(
                'Add Basic Details',
                style: GoogleFonts.poppins(
                  color: Theme.of(context).primaryColor,
                  fontSize: MediaQuery.of(context).size.height * 0.022,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text(
                  'You are looking to',
                  style: GoogleFonts.poppins(
                    color: Theme.of(context).primaryColor,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(
                                color: Theme.of(context).primaryColor)),
                        color: pressAttention
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).scaffoldBackgroundColor,
                        onPressed: () => setState(() {
                              if (_sellingtype != 'Sell') {
                                press = !press;
                                pressAttention = !pressAttention;
                                _sellingtype = "Sell";
                              }
                            }),
                        child: Text(
                          "Sell",
                          style: GoogleFonts.inter(
                              color: pressAttention
                                  ? Theme.of(context).hintColor
                                  : Theme.of(context).backgroundColor,
                              fontWeight: FontWeight.w400,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02),
                        )),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(
                                color: Theme.of(context).primaryColor)),
                        color: press
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).scaffoldBackgroundColor,
                        onPressed: () => setState(() {
                              if (_sellingtype != 'Rent') {
                                press = !press;
                                pressAttention = !pressAttention;
                                _sellingtype = "Rent";
                              }
                            }),
                        child: Text(
                          "Rent",
                          style: GoogleFonts.inter(
                              color: press
                                  ? Theme.of(context).hintColor
                                  : Theme.of(context).backgroundColor,
                              fontWeight: FontWeight.w400,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02),
                        )),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text(
                  'And it is a',
                  style: GoogleFonts.poppins(
                    color: Theme.of(context).primaryColor,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 8, 8, 8),
                child: Wrap(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(
                                  color: Theme.of(context).primaryColor)),
                          color: secpressAttention
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).scaffoldBackgroundColor,
                          onPressed: () => setState(() {
                                if (_sellingtype != 'Apartment') {
                                  secpress = false;
                                  secpressAttention = true;
                                  secpress1 = false;
                                  secpress2 = false;
                                  _lookingfor = "Apartment";
                                }
                              }),
                          child: Text(
                            "Apartment",
                            style: GoogleFonts.inter(
                                color: secpressAttention
                                    ? Theme.of(context).hintColor
                                    : Theme.of(context).backgroundColor,
                                fontWeight: FontWeight.w400,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.019),
                          )),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(
                                  color: Theme.of(context).primaryColor)),
                          color: secpress
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).scaffoldBackgroundColor,
                          onPressed: () => setState(() {
                                if (_sellingtype != 'independent house') {
                                  secpress = true;
                                  secpressAttention = false;
                                  secpress1 = false;
                                  secpress2 = false;
                                  _lookingfor = "independent house";
                                }
                              }),
                          child: Text(
                            "Independent house/Villa",
                            style: GoogleFonts.inter(
                                color: secpress
                                    ? Theme.of(context).hintColor
                                    : Theme.of(context).backgroundColor,
                                fontWeight: FontWeight.w400,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.018),
                          )),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(
                                  color: Theme.of(context).primaryColor)),
                          color: secpress2
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).scaffoldBackgroundColor,
                          onPressed: () => setState(() {
                                if (_sellingtype != 'Independent/builder') {
                                  secpress = false;
                                  secpressAttention = false;
                                  secpress1 = false;
                                  secpress2 = true;
                                  _lookingfor = "Independent/builder";
                                }
                              }),
                          child: Text(
                            "Independent/Builder floor",
                            style: GoogleFonts.inter(
                                color: secpress2
                                    ? Theme.of(context).hintColor
                                    : Theme.of(context).backgroundColor,
                                fontWeight: FontWeight.w400,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.017),
                          )),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.18,
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(
                                  color: Theme.of(context).primaryColor)),
                          color: secpress1
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).scaffoldBackgroundColor,
                          onPressed: () => setState(() {
                                if (_sellingtype != 'Land') {
                                  secpress = false;
                                  secpressAttention = false;
                                  secpress1 = true;
                                  secpress2 = false;
                                  _lookingfor = "Land";
                                }
                              }),
                          child: Text(
                            "Land",
                            style: GoogleFonts.inter(
                                color: secpress1
                                    ? Theme.of(context).hintColor
                                    : Theme.of(context).backgroundColor,
                                fontWeight: FontWeight.w400,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.017),
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text(
                  'Your contact details for the buyer to reach you',
                  style: GoogleFonts.poppins(
                    color: Theme.of(context).primaryColor,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: TextField(
                  maxLength: 10,
                  style: GoogleFonts.inter(
                    color: Theme.of(context).hintColor,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                    fontWeight: FontWeight.w300,
                  ),
                  keyboardType: TextInputType.number,
                  cursorColor: Theme.of(context).hintColor,
                  decoration: InputDecoration(
                    counterText: '',
                    hintStyle: GoogleFonts.inter(
                      color: Theme.of(context).hintColor,
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      fontWeight: FontWeight.w300,
                    ),
                    hintText: 'Phone number',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1.2,
                          color: Theme.of(context).hintColor), //<-- SEE HERE
                    ),
                  ),
                  controller: mobilecontroller,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(
                              color: Theme.of(context).primaryColor)),
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        if (mobilecontroller.text.length < 10) {
                          Fluttertoast.showToast(
                              msg: "Please enter a valid mobile number",
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Theme.of(context).hintColor,
                              textColor: Theme.of(context).backgroundColor,
                              fontSize: 16.0);
                        } else {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const PostingProp()));
                        }
                      },
                      child: Text(
                        "Begin to Post your Property",
                        style: GoogleFonts.poppins(
                            color: Theme.of(context).hintColor,
                            fontWeight: FontWeight.w500,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.02),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
