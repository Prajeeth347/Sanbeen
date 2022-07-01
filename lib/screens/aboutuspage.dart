import 'package:flutter/material.dart';

class aboutus extends StatelessWidget {
  const aboutus({Key? key}) : super(key: key);

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
              icon:
                  Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
            )),
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('About Us',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 24)),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Image.asset('assets/images/photo.jpg'),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.8),
                      Padding(
                          padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                          child: Text(
                              'To lose fat, you need to consume fewer calories than you burn each day and exercise regularly. Frequent physical activity helps get rid of fat. If you lose weight without exercise. you are more likely to lose both muscle and fat.',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 17))),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Padding(
                          padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                          child: Text(
                              'To lose fat, you need to consume fewer calories than you burn each day and exercise regularly. Frequent physical activity helps get rid of fat. If you lose weight without exercise. you are more likely to lose both muscle and fat.',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 17))),
                    ]))));
  }
}
