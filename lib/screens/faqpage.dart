import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class faqpage extends StatefulWidget {
  const faqpage({Key? key}) : super(key: key);

  @override
  State<faqpage> createState() => _faqpageState();
}

class _faqpageState extends State<faqpage> {
  String email = 'sanbeen@gmail.com';
  _launchEmail() async {
    if (await canLaunchUrlString("mailto:$email")) {
      await launchUrlString("mailto:$email");
    } else {
      throw 'can not launch';
    }
  }

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
            icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Frequently Asked Questions',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 22)),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              ExpansionTile(
                title: Text('1.How do u do to have a best thing in the world?',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 16)),
                textColor: Theme.of(context).primaryColor,
                iconColor: Theme.of(context).primaryColor,
                collapsedIconColor: Theme.of(context).primaryColor,
                childrenPadding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                children: [
                  Text(
                      'To lose fat, you need to consume fewer calories than you burn each day and exercise regularly. Frequent physical activity helps get rid of fat. If you lose weight without exercise. you are more likely to lose both muscle and fat.',
                      style: TextStyle(
                          color: Theme.of(context).hintColor, fontSize: 14)),
                ],
              ),
              ExpansionTile(
                title: Text('2.How do u do to have a best thing in the world?',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 16)),
                textColor: Theme.of(context).primaryColor,
                iconColor: Theme.of(context).primaryColor,
                collapsedIconColor: Theme.of(context).primaryColor,
                childrenPadding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                children: [
                  Text(
                      'To lose fat, you need to consume fewer calories than you burn each day and exercise regularly. Frequent physical activity helps get rid of fat. If you lose weight without exercise. you are more likely to lose both muscle and fat.',
                      style: TextStyle(
                          color: Theme.of(context).hintColor, fontSize: 14)),
                ],
              ),
              ExpansionTile(
                title: Text('3.How do u do to have a best thing in the world?',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 16)),
                textColor: Theme.of(context).primaryColor,
                iconColor: Theme.of(context).primaryColor,
                collapsedIconColor: Theme.of(context).primaryColor,
                childrenPadding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                children: [
                  Text(
                      'To lose fat, you need to consume fewer calories than you burn each day and exercise regularly. Frequent physical activity helps get rid of fat. If you lose weight without exercise. you are more likely to lose both muscle and fat.',
                      style: TextStyle(
                          color: Theme.of(context).hintColor, fontSize: 14)),
                ],
              ),
              ExpansionTile(
                title: Text('4.How do u do to have a best thing in the world?',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 16)),
                textColor: Theme.of(context).primaryColor,
                iconColor: Theme.of(context).primaryColor,
                collapsedIconColor: Theme.of(context).primaryColor,
                childrenPadding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                children: [
                  Text(
                      'To lose fat, you need to consume fewer calories than you burn each day and exercise regularly. Frequent physical activity helps get rid of fat. If you lose weight without exercise. you are more likely to lose both muscle and fat.',
                      style: TextStyle(
                          color: Theme.of(context).hintColor, fontSize: 14)),
                ],
              ),
              ExpansionTile(
                title: Text('5.How do u do to have a best thing in the world?',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 16)),
                textColor: Theme.of(context).primaryColor,
                iconColor: Theme.of(context).primaryColor,
                collapsedIconColor: Theme.of(context).primaryColor,
                childrenPadding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                children: [
                  Text(
                      'To lose fat, you need to consume fewer calories than you burn each day and exercise regularly. Frequent physical activity helps get rid of fat. If you lose weight without exercise. you are more likely to lose both muscle and fat.',
                      style: TextStyle(
                          color: Theme.of(context).hintColor, fontSize: 14)),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.09),
              Text('Contact Us',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 22)),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              TextButton(
                  onPressed: () {
                    launchUrlString(
                        'mailto:sanbeen@gmail.com?subject=This is Subject Title&body=This is Body of Email');
                  },
                  child: Text('sanbeen@gmail.com',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 18)))
            ],
          ),
        ),
      ),
    );
  }
}