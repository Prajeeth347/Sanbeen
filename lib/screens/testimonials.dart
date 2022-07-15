import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

List cities = [
  "Delhi",
  "Mumbai",
  "Chennai",
  "Kolkata",
  "Delhi",
  "Mumbai",
  "Chennai",
  "Kolkata"
];
List dealer = ["Loreal Paris", "Sid Mathews", "Loreal Paris", "Sid Mathews"];
List collection = [
  'assets/images/home.png',
  'assets/images/house.png',
  'assets/images/bill.png',
  'assets/images/homie.png',
  'assets/images/home.png',
  'assets/images/house.png',
  'assets/images/bill.png',
  'assets/images/homie.png'
];

class TestimonialCard extends StatelessWidget {
  const TestimonialCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: dealer.length,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(90),
                        child: CircleAvatar(
                          radius: MediaQuery.of(context).size.width * 0.07,
                          backgroundImage: AssetImage(collection[index]),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Column(
                    children: [
                      Text(
                        dealer[index],
                        style: GoogleFonts.poppins(
                            color: Theme.of(context).hintColor,
                            fontSize:
                                MediaQuery.of(context).size.width * 0.037),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.002,
                      ),
                      Text(
                        'owner, ' + cities[index],
                        style: GoogleFonts.inter(
                            color: Theme.of(context).hintColor,
                            fontSize: MediaQuery.of(context).size.width * 0.03),
                        textAlign: TextAlign.left,
                      ),
                      Divider(
                        color: Theme.of(context).primaryColor,
                        thickness: 1,
                        height: MediaQuery.of(context).size.width * 0.058,
                      )
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  )
                ],
              ),
              Text(
                  'Lorem ipsum dolor sit amet. Sed debitis accusantium non iste impedit et architecto quasi. Qui voluptate dolor et quia Quis quo cupiditate corrupti ut ipsam voluptas et rerum doloremque! Aut doloremque accusamus in voluptatem possimus nihil perferendis rem magnam tempore. Est eaque libero est quos dolor in quia veritatis est nisi recusandae ad pariatur laborum.',
                  style: GoogleFonts.inter(
                    color: Theme.of(context).hintColor,
                    fontSize: MediaQuery.of(context).size.height * 0.01,
                    fontWeight: FontWeight.w400,
                  ))
            ],
          );
        }),
      ),
    );
  }
}
