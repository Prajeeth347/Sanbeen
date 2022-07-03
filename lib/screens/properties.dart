import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class properties extends StatefulWidget {
  const properties({Key? key}) : super(key: key);

  @override
  State<properties> createState() => _propertiesState();
}

class _propertiesState extends State<properties> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          shadowColor: Colors.black,
          backgroundColor: Colors.black,
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).primaryColor,
              size: 40,
            ),
            onPressed: () => Navigator.pop(context, false),
          )),
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(top: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Shortlisted Properties",
              style: TextStyle(
                  fontSize: 25,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w400),
            ),
            PropCard('Hello'),
          ],
        ),
      ),
    );
  }
}

class PropCard extends StatelessWidget {
  final String data;
  PropCard(this.data);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.only(top: 0, bottom: 15),
      width: double.infinity,
      color: Theme.of(context).primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
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
                  width: 220,
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Delhi Apartments'),
                      Text('Rs:40,000(per month)'),
                      Text('Rental 3BHK'),
                      Text('South Delhi'),
                    ],
                  )),
            ],
          ),
          Container(
            // margin: EdgeInsets.only(right: 20),
            color: Colors.black,
            padding: EdgeInsets.only(top: 2, bottom: 2, left: 30, right: 30),
            child: Text(
              'Call Owner',
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 25),
            ),
          )
        ],
      ),

      //  const Text(
      //   'Viewed',
      //   style: TextStyle(color: Theme.of(context).primaryColor),
      // ),
    );
  }
}
