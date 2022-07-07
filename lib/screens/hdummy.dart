import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class hdummy extends StatefulWidget {
  const hdummy({Key? key}) : super(key: key);
  @override
  State<hdummy> createState() => _hdummyState();
}

class _hdummyState extends State<hdummy> {
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
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        margin: const EdgeInsets.only(top: 20, left: 20),
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
      height: MediaQuery.of(context).size.height * 0.3,
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      width: double.infinity,
      color: Theme.of(context).primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  alignment: FractionalOffset.topCenter,
                  image: NetworkImage(
                      'https://th.bing.com/th/id/R.82e80518e2ec87c48cd0575b3748114c?rik=ILHiYtEAreCL5A&riu=http%3a%2f%2fwww.marvelrealtors.com%2fwp-content%2fuploads%2f2015%2f08%2fHero-Image3.jpg&ehk=Km7ABIhunVf%2fzkqtDFWICFwD3djYu8iQkuhbCBsjTNc%3d&risl=&pid=ImgRaw&r=0'),
                )),
              ),
              Container(
                  padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5),
                  width: 220,
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Delhi Apartments',
                        style: TextStyle(
                            color: Theme.of(context).backgroundColor,
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Rs:40,000(per month)',
                        style: TextStyle(
                            color: Theme.of(context).backgroundColor,
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'South Delhi',
                        style: TextStyle(
                            color: Theme.of(context).backgroundColor,
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Rental 3BHK',
                        style: TextStyle(
                            color: Theme.of(context).backgroundColor,
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Owner - Kathika Nair',
                        style: TextStyle(
                            color: Theme.of(context).backgroundColor,
                            fontSize: MediaQuery.of(context).size.width * 0.03,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  )),
            ],
          ),
          Container(
            // margin: EdgeInsets.only(right: 20),
            color: Theme.of(context).backgroundColor,
            padding:
                EdgeInsets.only(top: 1.5, bottom: 1.5, left: 30, right: 30),
            child: Text(
              'Call Owner',
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 18),
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
