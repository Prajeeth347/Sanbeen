import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sanbeen_zedital/models/properties_model(20).dart';
import 'package:sanbeen_zedital/screens/property_single.dart';
import 'package:sanbeen_zedital/screens/signin.dart';
import 'package:sanbeen_zedital/screens/testimonials.dart';
import 'package:sanbeen_zedital/services/properties_20_helper.dart';

class recent_activity extends StatefulWidget {
  const recent_activity({Key? key}) : super(key: key);

  @override
  State<recent_activity> createState() => _recent_activityState();
}

class _recent_activityState extends State<recent_activity> {
  @override
  bool pressed_view = true;
  bool pressed_short = false;
  bool pressed_contact = false;
  String lookfor = "viewed";

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
              size: MediaQuery.of(context).size.width * 0.08,
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
                'Recent Activity',
                style: GoogleFonts.poppins(
                  color: Theme.of(context).primaryColor,
                  fontSize: MediaQuery.of(context).size.height * 0.025,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: pressed_view
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).backgroundColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 3))),
                          onPressed: () => setState(() {
                                if (lookfor != "viewed") {
                                  pressed_view = true;
                                  pressed_short = false;
                                  pressed_contact = false;
                                  lookfor = "viewed";
                                }
                                print(lookfor);
                              }),
                          child: Text(
                            "Viewed",
                            style: GoogleFonts.inter(
                                color: pressed_view
                                    ? Theme.of(context).backgroundColor
                                    : Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w400,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.018),
                          ))),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.025,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: pressed_short
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).backgroundColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 3))),
                          onPressed: () => setState(() {
                                if (lookfor != "shortlisted") {
                                  pressed_view = false;
                                  pressed_short = true;
                                  pressed_contact = false;
                                  lookfor = "shortlisted";
                                }
                                print(lookfor);
                              }),
                          child: Text(
                            "Shortlisted",
                            style: GoogleFonts.inter(
                                color: pressed_short
                                    ? Theme.of(context).backgroundColor
                                    : Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w400,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.018),
                          ))),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.025,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: pressed_contact
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).backgroundColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 3))),
                          onPressed: () => setState(() {
                                if (lookfor != "contacted") {
                                  pressed_view = false;
                                  pressed_short = false;
                                  pressed_contact = true;
                                  lookfor = "contacted";
                                }
                                print(lookfor);
                              }),
                          child: Text(
                            "Contacted",
                            style: GoogleFonts.inter(
                                color: pressed_contact
                                    ? Theme.of(context).backgroundColor
                                    : Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w400,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.018),
                          ))),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Divider(
                height: 10,
                thickness: 1,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              (lookfor == "viewed")
                  ? Viewed()
                  : (lookfor == "shortlisted")
                      ? Shortlisted()
                      : Contacted()
            ],
          ),
        ),
      ),
    );
  }
}

class Contacted extends StatelessWidget {
  Contacted({
    Key? key,
  }) : super(key: key);

  @override
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
  List dealer = [
    "Loreal Paris",
    "Sid Mathews",
    "Loreal Paris",
    "Sid Mathews",
    "Loreal Paris",
    "Sid Mathews",
    "Loreal Paris",
    "Sid Mathews",
  ];
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: dealer.length,
        itemBuilder: (context, index) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.23,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height * 0.13,
                        width: MediaQuery.of(context).size.width * 0.26,
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
                            color: Theme.of(context).primaryColor,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.018,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.003,
                        ),
                        Text(
                          'Company name',
                          style: GoogleFonts.poppins(
                            color: Theme.of(context).primaryColor,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.018,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.003,
                        ),
                        Text(
                          "Contacted for rental apartments near ",
                          style: GoogleFonts.poppins(
                            color: Theme.of(context).primaryColor,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.011,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          " Delhi apartments",
                          style: GoogleFonts.poppins(
                            color: Theme.of(context).primaryColor,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.011,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.003,
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.local_phone_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                    TextButton(
                        onPressed: () {
                          FlutterPhoneDirectCaller.callNumber('7989772884');
                        },
                        child: Text(
                          'Call again',
                          style: GoogleFonts.inter(
                            color: Theme.of(context).primaryColor,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.015,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        )),
                  ],
                ),
                Divider(
                  height: 10,
                  thickness: 1,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
          );
        });
  }
}

class Shortlisted extends StatefulWidget {
  const Shortlisted({
    Key? key,
  }) : super(key: key);

  @override
  State<Shortlisted> createState() => _ShortlistedState();
}

class _ShortlistedState extends State<Shortlisted> {
  List<Properties>? property;
  var _prop_20_loaded = false;
  @override
  void initState() {
    super.initState();
    getProfileData();
  }

  getProfileData() async {
    property = await property_services().getprofiles();
    if (property != null) {
      setState(() {
        _prop_20_loaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _prop_20_loaded == false
          ? Center(
              child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ))
          : ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: property?.length,
              itemBuilder: (context, index) {
                return shortlisted_prop(
                  name: property![index].name,
                  bedrooms: property![index].bedRooms,
                  bath: property![index].bathRooms,
                  sft: property![index].size,
                  cost: property![index].price,
                  dealer: property![index].account,
                  number: property![index].account,
                  img: property![index].images[0],
                  id: property![index].id,
                  city: property![index].city,
                  type: property![index].type,
                );
                // return properties_20_card();
              }),
    );
  }
}

class Viewed extends StatefulWidget {
  const Viewed({
    Key? key,
  }) : super(key: key);

  @override
  State<Viewed> createState() => _ViewedState();
}

class _ViewedState extends State<Viewed> {
  List<Properties>? property;
  var _prop_loaded = false;
  @override
  void initState() {
    super.initState();
    getProfileData();
  }

  getProfileData() async {
    property = await property_services().getprofiles();
    if (property != null) {
      setState(() {
        _prop_loaded = true;
      });
    }
  }

  Widget build(BuildContext context) {
    return Container(
      child: _prop_loaded == false
          ? Center(
              child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ))
          : ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: property?.length,
              itemBuilder: (context, index) {
                return viewed_prop(
                  name: property![index].name,
                  bedrooms: property![index].bedRooms,
                  bath: property![index].bathRooms,
                  sft: property![index].size,
                  cost: property![index].price,
                  dealer: property![index].account,
                  number: property![index].account,
                  img: property![index].images[0],
                  id: property![index].id,
                  city: property![index].city,
                  type: property![index].type,
                );
                // return properties_20_card();
              }),
    );
  }
}

class shortlisted_prop extends StatelessWidget {
  shortlisted_prop({
    required this.name,
    required this.bedrooms,
    required this.bath,
    required this.sft,
    required this.cost,
    required this.dealer,
    required this.number,
    required this.img,
    required this.id,
    required this.city,
    required this.type,
  });
  String name;
  String id;
  String img;
  int bedrooms;
  int bath;
  int sft;
  int cost;
  String dealer;
  String number;
  String city;
  String type;
  var indiaFormat = NumberFormat.compactSimpleCurrency(locale: 'en_IN');
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => property_single_page(id: id)));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.23,
                color: Theme.of(context).primaryColor,
                child: Column(children: [
                  Row(children: [
                    Stack(children: <Widget>[
                      Image.network(img,
                          height: MediaQuery.of(context).size.height * 0.23,
                          width: MediaQuery.of(context).size.width * 0.43,
                          fit: BoxFit.cover),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite_outline,
                                size: MediaQuery.of(context).size.width * 0.08,
                              )),
                        ),
                      ),
                    ]),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          name.toString(),
                          style: GoogleFonts.inter(
                            color: Theme.of(context).backgroundColor,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.018,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        Text(
                          indiaFormat.format(cost),
                          style: GoogleFonts.inter(
                            color: Theme.of(context).backgroundColor,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.018,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        Text(
                          type.toString() + ", " + bedrooms.toString() + "BHK",
                          style: GoogleFonts.inter(
                            color: Theme.of(context).backgroundColor,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.018,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        Text(
                          city.toString(),
                          style: GoogleFonts.inter(
                            color: Theme.of(context).backgroundColor,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.018,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.local_phone_rounded,
                              color: Theme.of(context).hintColor,
                            ),
                            TextButton(
                                onPressed: () {
                                  FlutterPhoneDirectCaller.callNumber(
                                      '7989772884');
                                },
                                child: Text(
                                  'Call now',
                                  style: GoogleFonts.inter(
                                    color: Theme.of(context).hintColor,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.018,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ]),
                ]),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              )
            ],
          ),
        ));
  }
}

class viewed_prop extends StatelessWidget {
  viewed_prop({
    required this.name,
    required this.bedrooms,
    required this.bath,
    required this.sft,
    required this.cost,
    required this.dealer,
    required this.number,
    required this.img,
    required this.id,
    required this.city,
    required this.type,
  });
  String name;
  String id;
  String img;
  int bedrooms;
  int bath;
  int sft;
  int cost;
  String dealer;
  String number;
  String city;
  String type;
  var indiaFormat = NumberFormat.compactSimpleCurrency(locale: 'en_IN');
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => property_single_page(id: id)));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.23,
                color: Theme.of(context).primaryColor,
                child: Column(children: [
                  Row(children: [
                    Image.network(img,
                        height: MediaQuery.of(context).size.height * 0.23,
                        width: MediaQuery.of(context).size.width * 0.43,
                        fit: BoxFit.cover),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          name.toString(),
                          style: GoogleFonts.inter(
                            color: Theme.of(context).backgroundColor,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.018,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        Text(
                          indiaFormat.format(cost),
                          style: GoogleFonts.inter(
                            color: Theme.of(context).backgroundColor,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.018,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        Text(
                          type.toString() + ", " + bedrooms.toString() + "BHK",
                          style: GoogleFonts.inter(
                            color: Theme.of(context).backgroundColor,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.018,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        Text(
                          city.toString(),
                          style: GoogleFonts.inter(
                            color: Theme.of(context).backgroundColor,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.018,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.local_phone_rounded,
                              color: Theme.of(context).hintColor,
                            ),
                            TextButton(
                                onPressed: () {
                                  FlutterPhoneDirectCaller.callNumber(
                                      '7989772884');
                                },
                                child: Text(
                                  'Call now',
                                  style: GoogleFonts.inter(
                                    color: Theme.of(context).hintColor,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.018,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ]),
                ]),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              )
            ],
          ),
        ));
  }
}
