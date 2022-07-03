import 'package:flutter/material.dart';

class testimonials extends StatefulWidget {
  const testimonials({Key? key}) : super(key: key);

  @override
  State<testimonials> createState() => _testimonialsState();
}

class _testimonialsState extends State<testimonials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
      body: Container(
        margin: EdgeInsets.only(left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 0),
              margin: EdgeInsets.only(top: 20, bottom: 20, left: 0),
              child: Text(
                "Testimonials",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 25),
              ),
            ),
            TestimonialCard(),
          ],
        ),
      ),
    );
  }
}

class TestimonialCard extends StatelessWidget {
  const TestimonialCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                    fit: BoxFit.cover,
                    alignment: FractionalOffset.topCenter,
                    image: new NetworkImage(
                        'https://www.filmibeat.com/img/popcorn/profile_photos/sree-leela-20191016105248-40142.jpg'),
                  )),

              // style: TextStyle(color: Colors.white),
            ),
            Container(
              width: 280,
              height: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Sree leela',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'NotoSans',
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    'Owner,Mumbai',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'NotoSans',
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    '''Lorem ipsum dolor sit amet, consectetur adipisci elit, ''',
                    // overflow: TextOverflow.ellipsis,
                    // softWrap: true,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'NotoSans',
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
