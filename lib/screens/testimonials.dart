import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Testimonials extends StatefulWidget {
  const Testimonials({Key? key}) : super(key: key);

  @override
  State<Testimonials> createState() => _TestimonialsState();
}

class _TestimonialsState extends State<Testimonials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).primaryColor,
              size: MediaQuery.of(context).size.width * 0.07,
            )),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 8.0, 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Testimonials',
                style: GoogleFonts.poppins(
                  color: Theme.of(context).primaryColor,
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Testii(),
            ],
          ),
        ),
      ),
    );
  }
}

class Testii extends StatelessWidget {
  Testii({
    Key? key,
  }) : super(key: key);

  //@override
  final List collection = [
    'assets/images/home.png',
    'assets/images/house.png',
    'assets/images/bill.png',
    'assets/images/homie.png',
    'assets/images/home.png',
    'assets/images/house.png',
    'assets/images/bill.png',
    'assets/images/homie.png'
  ];
  final List dealer = [
    "Loreal Paris",
    "Sid Mathews",
    "Loreal Paris",
    "Sid Mathews",
    "Loreal Paris",
    "Sid Mathews",
    "Loreal Paris",
    "Sid Mathews",
  ];
  final List cities = [
    "Delhi",
    "Mumbai",
    "Chennai",
    "Kolkata",
    "Delhi",
    "Mumbai",
    "Chennai",
    "Kolkata"
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: dealer.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.13,
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CircleAvatar(
                            radius: MediaQuery.of(context).size.width * 0.15,
                            backgroundImage: AssetImage(collection[index]),
                          ),
                        )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dealer[index].toString(),
                          style: GoogleFonts.poppins(
                            color: Theme.of(context).hintColor,
                            fontSize: MediaQuery.of(context).size.width * 0.035,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          'Owner, ${cities[index]}',
                          style: GoogleFonts.inter(
                            color: Theme.of(context).hintColor,
                            fontSize: MediaQuery.of(context).size.width * 0.025,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.011,
                        ),
                        Text(
                          "'Lorem ipsum dolor sit amet. Sed amet.",
                          style: GoogleFonts.poppins(
                            color: Theme.of(context).hintColor,
                            fontSize: MediaQuery.of(context).size.width * 0.027,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "cupiditate  Sed debitis corrupti ut voluptas et.'",
                          style: GoogleFonts.poppins(
                            color: Theme.of(context).hintColor,
                            fontSize: MediaQuery.of(context).size.width * 0.022,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
        });
  }
}
