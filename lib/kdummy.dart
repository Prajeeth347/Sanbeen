import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Col {
  static const int gold = 0xFFD4AF37;
}

class kdummy extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return recentActivity();
  }
}

class recentActivity extends State<kdummy> {
  String index = 'Viewed';
  void onPress(String k) {
    setState(() {
      index = k;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 45, bottom: 20),
                // color: Colors.red,
                child: Text("Top Icons"),
              ),
              Text(
                "Recent Activity",
                style: TextStyle(
                    fontSize: 20,
                    color: Color(Col.gold),
                    fontWeight: FontWeight.bold),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20),
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(Col.gold),
                      width: 2,
                    ),
                  ),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      (index != 'Viewed')
                          ? buttonView('Viewed', onPress)
                          : afterPress('Viewed'),
                      (index != 'Shortlisted')
                          ? buttonView('Shortlisted', onPress)
                          : afterPress('Shortlisted'),
                      (index != 'Contacted')
                          ? buttonView('Contacted', onPress)
                          : afterPress('Contacted'),
                    ]),
              ),
              (index == 'Viewed')
                  // ? Container(
                  //     width: double.infinity,
                  //     color: Color(Col.gold),
                  //     padding: EdgeInsets.all(20),
                  //     child: Text(
                  //       'Viewed',
                  //       style: TextStyle(color: Colors.black),
                  //     ),
                  // )
                  ? View('View')
                  : (index == 'Shortlisted')
                      ? ShortList('Hello')
                      : Contact('Cool guys')
            ],
          ),
        ));
  }
}

// Buttons Data
class buttonView extends StatelessWidget {
  // const buttonView({Key? key}) : super(key: key);
  int gold = 0xFFD4AF37;
  final String btText;
  final Function onPress;
  buttonView(this.btText, this.onPress);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: BorderSide(width: 2.0, color: Color(Col.gold)),
            // padding: EdgeInsets.only(top: 0, bottom: 0, left: 5, right: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(200.0),
            )),
        onPressed: () => (onPress(btText)),
        child: Text(
          btText,
          style: TextStyle(
            color: Color(Col.gold),
          ),
        ),
      ),
    );
  }
}

// After Pressing Data
class afterPress extends StatelessWidget {
  // const buttonView({Key? key}) : super(key: key);
  int gold = 0xFFD4AF37;
  final String btText;

  afterPress(this.btText);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            backgroundColor: Color(Col.gold),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(200.0),
            )),
        onPressed: () => print('Already Selected'),
        child: Text(
          btText,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

class View extends StatelessWidget {
  final String data;
  View(this.data);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.only(top: 20),
      width: double.infinity,
      color: Color(Col.gold),
      child: Row(
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: new BoxDecoration(
                image: new DecorationImage(
              fit: BoxFit.cover,
              alignment: FractionalOffset.topCenter,
              image: new NetworkImage(
                  'https://th.bing.com/th/id/R.82e80518e2ec87c48cd0575b3748114c?rik=ILHiYtEAreCL5A&riu=http%3a%2f%2fwww.marvelrealtors.com%2fwp-content%2fuploads%2f2015%2f08%2fHero-Image3.jpg&ehk=Km7ABIhunVf%2fzkqtDFWICFwD3djYu8iQkuhbCBsjTNc%3d&risl=&pid=ImgRaw&r=0'),
            )),
          ),
          Container(
              padding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
              width: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Delhi Apartments'),
                  Text('Rs:40,000(per month)'),
                  Text('Rental 3BHK'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('South Delhi'),
                      Container(
                          // margin: EdgeInsets.only(right: 20),
                          child: Row(
                        // mainAxisAlignment: MainAxisAlignment,
                        children: [Icon(Icons.call), Text('Call')],
                      ))
                    ],
                  ),
                ],
              )),
        ],
      ),

      //  const Text(
      //   'Viewed',
      //   style: TextStyle(color: Color(Col.gold)),
      // ),
    );
  }
}

class ShortList extends StatelessWidget {
  final String data;
  ShortList(this.data);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.only(top: 20),
      width: double.infinity,
      color: Color(Col.gold),
      child: Row(
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: new BoxDecoration(
                image: new DecorationImage(
              fit: BoxFit.cover,
              alignment: FractionalOffset.topCenter,
              image: new NetworkImage(
                  'https://th.bing.com/th/id/R.82e80518e2ec87c48cd0575b3748114c?rik=ILHiYtEAreCL5A&riu=http%3a%2f%2fwww.marvelrealtors.com%2fwp-content%2fuploads%2f2015%2f08%2fHero-Image3.jpg&ehk=Km7ABIhunVf%2fzkqtDFWICFwD3djYu8iQkuhbCBsjTNc%3d&risl=&pid=ImgRaw&r=0'),
            )),
          ),
          Container(
              padding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
              width: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Delhi Apartments'),
                  Text('Rs:40,000(per month)'),
                  Text('Rental 3BHK'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('South Delhi'),
                      Container(
                          // margin: EdgeInsets.only(right: 20),
                          child: Row(
                        // mainAxisAlignment: MainAxisAlignment,
                        children: [Icon(Icons.call), Text('Call')],
                      ))
                    ],
                  ),
                ],
              )),
        ],
      ),

      //  const Text(
      //   'Viewed',
      //   style: TextStyle(color: Color(Col.gold)),
      // ),
    );
  }
}

class Contact extends StatelessWidget {
  final String data;
  Contact(this.data);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text(
        'Contacted',
        style: TextStyle(color: Color(Col.gold)),
      ),
    );
  }
}
