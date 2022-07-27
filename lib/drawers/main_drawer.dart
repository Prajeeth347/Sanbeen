import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanbeen_zedital/screens/aboutuspage.dart';
import 'package:sanbeen_zedital/screens/begin_posting.dart';
import 'package:sanbeen_zedital/screens/properties_all.dart';
import 'package:sanbeen_zedital/screens/rentals_page.dart';
import 'package:sanbeen_zedital/screens/signin.dart';
//import 'package:sanbeen_zedital/screens/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer({Key? key, required this.userimage}) : super(key: key);
  String userimage;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).primaryColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(children: [
            Image.network(
                fit: BoxFit.cover,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.19,
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuw2csIYaS7KuekqlPBYserItx4Mfv-T6tuQ&usqp=CAU"),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.12),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(userimage),
                      minRadius: MediaQuery.of(context).size.width * 0.1,
                    ),
                    Container()
                  ],
                ),
              )
            ]),
          ]),
          ListTile(
            iconColor: Theme.of(context).backgroundColor,
            textColor: Theme.of(context).backgroundColor,
            leading: const Icon(
              Icons.sell_sharp,
            ),
            title: Text(
              'Post your property',
              style: GoogleFonts.poppins(
                color: Theme.of(context).backgroundColor,
                fontSize: MediaQuery.of(context).size.width * 0.033,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const BeginPosting(),
              ));
            },
          ),
          ListTile(
            iconColor: Theme.of(context).backgroundColor,
            textColor: Theme.of(context).backgroundColor,
            leading: const Icon(
              Icons.house_rounded,
            ),
            title: Text(
              'Find houses or property',
              style: GoogleFonts.poppins(
                color: Theme.of(context).backgroundColor,
                fontSize: MediaQuery.of(context).size.width * 0.033,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PropertiesAll(),
              ));
            },
          ),
          ListTile(
            iconColor: Theme.of(context).backgroundColor,
            textColor: Theme.of(context).backgroundColor,
            leading: const Icon(
              Icons.house_rounded,
            ),
            title: Text(
              'Find rental apartments',
              style: GoogleFonts.poppins(
                color: Theme.of(context).backgroundColor,
                fontSize: MediaQuery.of(context).size.width * 0.033,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const RentalsPage(),
              ));
            },
          ),
          ListTile(
            iconColor: Theme.of(context).backgroundColor,
            textColor: Theme.of(context).backgroundColor,
            leading: const Icon(
              Icons.notifications,
            ),
            title: Text(
              'Notifications',
              style: GoogleFonts.poppins(
                color: Theme.of(context).backgroundColor,
                fontSize: MediaQuery.of(context).size.width * 0.033,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => begin_posting(),));
            },
          ),
          ListTile(
            iconColor: Theme.of(context).backgroundColor,
            textColor: Theme.of(context).backgroundColor,
            leading: const Icon(
              Icons.info_rounded,
            ),
            title: Text(
              'About us',
              style: GoogleFonts.poppins(
                color: Theme.of(context).backgroundColor,
                fontSize: MediaQuery.of(context).size.width * 0.033,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AboutUs(),
              ));
            },
          ),
          ListTile(
            iconColor: Theme.of(context).backgroundColor,
            textColor: Theme.of(context).backgroundColor,
            leading: const Icon(
              Icons.logout_sharp,
            ),
            title: Text(
              'Logout',
              style: GoogleFonts.poppins(
                color: Theme.of(context).backgroundColor,
                fontSize: MediaQuery.of(context).size.width * 0.033,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove('Email');
              Navigator.pop(context);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const SignIn()));
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => begin_posting(),));
            },
          ),
        ],
      ),
    );
  }
}
