import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

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
            )),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About Us',
                        style: GoogleFonts.poppins(
                          color: Theme.of(context).primaryColor,
                          fontSize: MediaQuery.of(context).size.height * 0.03,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Image.network(
                          'https://st2.depositphotos.com/1006472/5665/i/600/depositphotos_56658541-stock-photo-faceless-hooded-anonymous-computer-hacker.jpg'),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.8),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: Text(
                              'To lose fat, you need to consume fewer calories than you burn each day and exercise regularly. Frequent physical activity helps get rid of fat. If you lose weight without exercise. you are more likely to lose both muscle and fat.',
                              style: GoogleFonts.inter(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.018))),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                          child: Text(
                              'To lose fat, you need to consume fewer calories than you burn each day and exercise regularly. Frequent physical activity helps get rid of fat. If you lose weight without exercise. you are more likely to lose both muscle and fat.',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.018))),
                    ]))));
  }
}
