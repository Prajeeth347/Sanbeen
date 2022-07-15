import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanbeen_zedital/models/profile_model.dart';
import 'package:sanbeen_zedital/screens/account_details.dart';
import 'package:sanbeen_zedital/screens/changepassword.dart';
import 'package:sanbeen_zedital/screens/feedback.dart';
import 'package:sanbeen_zedital/services/profile_helper.dart';

class profile_page extends StatefulWidget {
  const profile_page({Key? key}) : super(key: key);

  @override
  State<profile_page> createState() => _profile_pageState();
}

class _profile_pageState extends State<profile_page> {
  var name = "";
  var email = "sakshimallick001@gmail.com";
  var phone = "";
  List<Profiles>? profile;
  var is_loaded = false;
  @override
  void initState() {
    super.initState();
    getProfileData();
  }

  getProfileData() async {
    profile = await profile_services().getprofiles();
    if (profile != null) {
      setState(() {
        is_loaded = true;
      });
    }
  }

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
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 8.0, 8.0, 8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'My Profile',
                  style: GoogleFonts.poppins(
                    color: Theme.of(context).primaryColor,
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.15,
              child: Text(
                profile == null
                    ? ''
                    : profile![2].img == null
                        ? profile![2].name[0].toUpperCase()
                        : '',
                style: GoogleFonts.poppins(
                  color: Theme.of(context).backgroundColor,
                  fontSize: MediaQuery.of(context).size.height * 0.03,
                  fontWeight: FontWeight.w500,
                ),
              ),
              backgroundImage:
                  NetworkImage(profile == null ? '' : profile![2].img ?? ''),
              backgroundColor: profile == null
                  ? Colors.transparent
                  : profile![2].img == null
                      ? Theme.of(context).primaryColor
                      : Colors.transparent,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text(
              profile == null ? 'Name' : profile![2].name,
              style: GoogleFonts.poppins(
                color: Theme.of(context).primaryColor,
                fontSize: MediaQuery.of(context).size.height * 0.026,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Text(
              email,
              style: GoogleFonts.poppins(
                color: Theme.of(context).primaryColor,
                fontSize: MediaQuery.of(context).size.height * 0.02,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text(
              profile == null ? 'Number' : profile![2].number,
              style: GoogleFonts.poppins(
                color: Theme.of(context).primaryColor,
                fontSize: MediaQuery.of(context).size.height * 0.02,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Divider(
              color: Theme.of(context).primaryColor,
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 1.5, 8.0, 1.5),
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => account_details()));
                  },
                  child: Row(
                    children: [
                      Container(
                        child: CircleAvatar(
                          child: Icon(
                            Icons.person,
                            color: Theme.of(context).primaryColor,
                          ),
                          backgroundColor: Theme.of(context).backgroundColor,
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                      Text(
                        'Account Details',
                        style: GoogleFonts.poppins(
                          color: Theme.of(context).primaryColor,
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      // SizedBox(
                      //     width: MediaQuery.of(context).size.width * 0.3),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(120, 0, 0, 0),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 1.5, 8.0, 1.5),
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => change_password()));
                  },
                  child: Row(
                    children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.lock,
                          color: Theme.of(context).primaryColor,
                        ),
                        backgroundColor: Theme.of(context).backgroundColor,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.025),
                      Text(
                        'Change Password',
                        style: GoogleFonts.poppins(
                          color: Theme.of(context).primaryColor,
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      //SizedBox(width: MediaQuery.of(context).size.width * 0.29),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(110, 0, 0, 0),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 1.5, 8.0, 1.5),
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => feedback()));
                  },
                  child: Row(
                    children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.feedback_sharp,
                          color: Theme.of(context).primaryColor,
                        ),
                        backgroundColor: Theme.of(context).backgroundColor,
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                      Text(
                        'Feedback',
                        style: GoogleFonts.poppins(
                          color: Theme.of(context).primaryColor,
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      //SizedBox(width: MediaQuery.of(context).size.width * 0.48),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(160, 0, 0, 0),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 1.5, 8.0, 1.5),
              child: TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.logout_rounded,
                          color: Theme.of(context).primaryColor,
                        ),
                        backgroundColor: Theme.of(context).backgroundColor,
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                      Text(
                        'Logout',
                        style: GoogleFonts.poppins(
                          color: Theme.of(context).primaryColor,
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
