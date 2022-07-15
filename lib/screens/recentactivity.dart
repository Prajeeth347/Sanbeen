import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanbeen_zedital/screens/signin.dart';

class recent_activity extends StatefulWidget {
  const recent_activity({Key? key}) : super(key: key);

  @override
  State<recent_activity> createState() => _recent_activityState();
}

class _recent_activityState extends State<recent_activity> {
  @override
  bool pressed_view = true;
  bool pressed_short = false;
  bool pressed_contact = false;
  String lookfor = "viewed";

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
                'Recent Activity',
                style: GoogleFonts.poppins(
                  color: Theme.of(context).primaryColor,
                  fontSize: MediaQuery.of(context).size.height * 0.025,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: pressed_view
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).backgroundColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 3))),
                          onPressed: () => setState(() {
                                if (lookfor != "viewed") {
                                  pressed_view = true;
                                  pressed_short = false;
                                  pressed_contact = false;
                                  lookfor = "viewed";
                                }
                                print(lookfor);
                              }),
                          child: Text(
                            "Viewed",
                            style: GoogleFonts.inter(
                                color: pressed_view
                                    ? Theme.of(context).backgroundColor
                                    : Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w400,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.018),
                          ))),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.025,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: pressed_short
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).backgroundColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 3))),
                          onPressed: () => setState(() {
                                if (lookfor != "shortlisted") {
                                  pressed_view = false;
                                  pressed_short = true;
                                  pressed_contact = false;
                                  lookfor = "shortlisted";
                                }
                                print(lookfor);
                              }),
                          child: Text(
                            "Shortlisted",
                            style: GoogleFonts.inter(
                                color: pressed_short
                                    ? Theme.of(context).backgroundColor
                                    : Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w400,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.018),
                          ))),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.025,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: pressed_contact
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).backgroundColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 3))),
                          onPressed: () => setState(() {
                                if (lookfor != "contacted") {
                                  pressed_view = false;
                                  pressed_short = false;
                                  pressed_contact = true;
                                  lookfor = "contacted";
                                }
                                print(lookfor);
                              }),
                          child: Text(
                            "Contacted",
                            style: GoogleFonts.inter(
                                color: pressed_contact
                                    ? Theme.of(context).backgroundColor
                                    : Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w400,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.018),
                          ))),
                ],
              ),
              SizedBox(height: 8,),
              Divider(
                height: 10,
                thickness: 1,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(height: 8,),
              (lookfor == "viewed") ?
              Viewed() : (lookfor == "shortlisted") ?
              Shortlisted() :
              Contacted()
            ],
          ),
        ),
      ),
    );
  }
}

class Contacted extends StatelessWidget {
  const Contacted({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Contacted",style: TextStyle(color: Theme.of(context).primaryColor),),
    );
  }
}

class Shortlisted extends StatelessWidget {
  const Shortlisted({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Shortlisted",style: TextStyle(color: Theme.of(context).primaryColor),),
    );
  }
}

class Viewed extends StatelessWidget {
  const Viewed({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Viewed",style: TextStyle(color: Theme.of(context).primaryColor),),
    );
  }
}
