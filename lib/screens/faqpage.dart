import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanbeen_zedital/drawers/main_drawer.dart';
import 'package:sanbeen_zedital/screens/profilepage.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({Key? key}) : super(key: key);

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  String email = 'sanbeen@gmail.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(
          userimage:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjjYXm0bKrsV1VZPuyaq-j009UD1aBDCUz5A&usqp=CAU"),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        backgroundColor: Theme.of(context).backgroundColor,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ProfilePage()));
              },
              icon: Icon(
                Icons.person,
                color: Theme.of(context).primaryColor,
                size: MediaQuery.of(context).size.width * 0.08,
              ))
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Frequently Asked Questions',
                style: GoogleFonts.poppins(
                    color: Theme.of(context).primaryColor,
                    fontSize: MediaQuery.of(context).size.width * 0.04),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              ExpansionTile(
                title: Text('1.How do u do to have a best thing in the world?',
                    style: GoogleFonts.poppins(
                        color: Theme.of(context).primaryColor,
                        fontSize: MediaQuery.of(context).size.width * 0.034)),
                textColor: Theme.of(context).primaryColor,
                iconColor: Theme.of(context).primaryColor,
                collapsedIconColor: Theme.of(context).primaryColor,
                childrenPadding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                children: [
                  Text(
                      'To lose fat, you need to consume fewer calories than you burn each day and exercise regularly. Frequent physical activity helps get rid of fat. If you lose weight without exercise. you are more likely to lose both muscle and fat.',
                      style: GoogleFonts.inter(
                          color: Theme.of(context).hintColor,
                          fontSize: MediaQuery.of(context).size.width * 0.03)),
                ],
              ),
              ExpansionTile(
                title: Text('2.How do u do to have a best thing in the world?',
                    style: GoogleFonts.poppins(
                        color: Theme.of(context).primaryColor,
                        fontSize: MediaQuery.of(context).size.width * 0.034)),
                textColor: Theme.of(context).primaryColor,
                iconColor: Theme.of(context).primaryColor,
                collapsedIconColor: Theme.of(context).primaryColor,
                childrenPadding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                children: [
                  Text(
                      'To lose fat, you need to consume fewer calories than you burn each day and exercise regularly. Frequent physical activity helps get rid of fat. If you lose weight without exercise. you are more likely to lose both muscle and fat.',
                      style: GoogleFonts.inter(
                          color: Theme.of(context).hintColor,
                          fontSize: MediaQuery.of(context).size.width * 0.03)),
                ],
              ),
              ExpansionTile(
                title: Text('3.How do u do to have a best thing in the world?',
                    style: GoogleFonts.poppins(
                        color: Theme.of(context).primaryColor,
                        fontSize: MediaQuery.of(context).size.width * 0.034)),
                textColor: Theme.of(context).primaryColor,
                iconColor: Theme.of(context).primaryColor,
                collapsedIconColor: Theme.of(context).primaryColor,
                childrenPadding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                children: [
                  Text(
                      'To lose fat, you need to consume fewer calories than you burn each day and exercise regularly. Frequent physical activity helps get rid of fat. If you lose weight without exercise. you are more likely to lose both muscle and fat.',
                      style: GoogleFonts.inter(
                          color: Theme.of(context).hintColor,
                          fontSize: MediaQuery.of(context).size.width * 0.03)),
                ],
              ),
              ExpansionTile(
                title: Text('4.How do u do to have a best thing in the world?',
                    style: GoogleFonts.poppins(
                        color: Theme.of(context).primaryColor,
                        fontSize: MediaQuery.of(context).size.width * 0.034)),
                textColor: Theme.of(context).primaryColor,
                iconColor: Theme.of(context).primaryColor,
                collapsedIconColor: Theme.of(context).primaryColor,
                childrenPadding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                children: [
                  Text(
                      'To lose fat, you need to consume fewer calories than you burn each day and exercise regularly. Frequent physical activity helps get rid of fat. If you lose weight without exercise. you are more likely to lose both muscle and fat.',
                      style: GoogleFonts.inter(
                          color: Theme.of(context).hintColor,
                          fontSize: MediaQuery.of(context).size.width * 0.03)),
                ],
              ),
              ExpansionTile(
                title: Text('5.How do u do to have a best thing in the world?',
                    style: GoogleFonts.poppins(
                        color: Theme.of(context).primaryColor,
                        fontSize: MediaQuery.of(context).size.width * 0.034)),
                textColor: Theme.of(context).primaryColor,
                iconColor: Theme.of(context).primaryColor,
                collapsedIconColor: Theme.of(context).primaryColor,
                childrenPadding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                children: [
                  Text(
                      'To lose fat, you need to consume fewer calories than you burn each day and exercise regularly. Frequent physical activity helps get rid of fat. If you lose weight without exercise. you are more likely to lose both muscle and fat.',
                      style: GoogleFonts.inter(
                          color: Theme.of(context).hintColor,
                          fontSize: MediaQuery.of(context).size.width * 0.03)),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.09),
              Text('Contact Us',
                  style: GoogleFonts.poppins(
                      color: Theme.of(context).primaryColor,
                      fontSize: MediaQuery.of(context).size.width * 0.045)),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              TextButton(
                  onPressed: () {
                    launchUrlString(
                        'mailto:sanbeen@gmail.com?subject=This is Subject Title&body=This is Body of Email');
                  },
                  child: Text('sanbeen@gmail.com',
                      style: GoogleFonts.inter(
                          color: Theme.of(context).primaryColor,
                          fontSize: MediaQuery.of(context).size.width * 0.035)))
            ],
          ),
        ),
      ),
    );
  }
}
