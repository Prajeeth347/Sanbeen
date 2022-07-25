import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sanbeen_zedital/models/properties_model(20).dart';
//import 'package:sanbeen_zedital/screens/property_display.dart';
import 'package:sanbeen_zedital/screens/property_single.dart';
import 'package:sanbeen_zedital/services/properties_20_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class PropertiesAll extends StatefulWidget {
  const PropertiesAll({Key? key}) : super(key: key);

  @override
  State<PropertiesAll> createState() => PropertiesState();
}

class PropertiesState extends State<PropertiesAll> {
  List<Properties>? property;
  var prop20loaded = false;
  @override
  void initState() {
    super.initState();
    getProfileData();
  }

  getProfileData() async {
    property = await PropertyServices().getprofiles();
    if (property != null) {
      setState(() {
        prop20loaded = true;
      });
    }
  }

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
              size: MediaQuery.of(context).size.width * 0.08,
            )),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: prop20loaded == false
          ? Center(
              child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ))
          : ListView.builder(
              itemCount: property?.length,
              itemBuilder: (context, index) {
                return Properties20Card(
                  name: property![index].name,
                  bedrooms: property![index].bedRooms,
                  bath: property![index].bathRooms,
                  sft: property![index].size,
                  cost: property![index].price,
                  dealer: property![index].account,
                  number: property![index].account,
                  img: property![index].images[0],
                  id: property![index].id,
                );
                // return Properties20Card();
              }),
    );
  }
}

class Properties20Card extends StatelessWidget {
  Properties20Card({
    Key? key,
    required this.name,
    required this.bedrooms,
    required this.bath,
    required this.sft,
    required this.cost,
    required this.dealer,
    required this.number,
    required this.img,
    required this.id,
  }) : super(key: key);
  String name;
  String id;
  String img;
  int bedrooms;
  int bath;
  int sft;
  int cost;
  String dealer;
  String number;
  var indiaFormat = NumberFormat.compactSimpleCurrency(locale: 'en_IN');
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PropertySinglePage(id: id)));
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.99,
        height: MediaQuery.of(context).size.height * 0.49,
        child: Stack(
          children: <Widget>[
            Image.network(img,
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width * 0.99),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 15, 0),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_outline,
                      size: MediaQuery.of(context).size.width * 0.075,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 15, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.15, //gap between property container and information container
                  ),
                  Text(name,
                      style: GoogleFonts.poppins(
                          color: Theme.of(context).hintColor,
                          fontSize: MediaQuery.of(context).size.width * 0.055,
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                      height: MediaQuery.of(context).size.height *
                          0.01), //gap between property name and container
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width * 0.9,
                      color: Theme.of(context).backgroundColor,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 8, 8, 8),
                        child: Column(
                          children: [
                            Wrap(
                              // textDirection: TextDirection.ltr,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.bed,
                                        color: Theme.of(context).hintColor,
                                      ),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.01),
                                      Text("$bedrooms Bedrooms",
                                          style: GoogleFonts.inter(
                                              color:
                                                  Theme.of(context).hintColor,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.035,
                                              fontWeight: FontWeight.w400))
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.bathtub,
                                        color: Theme.of(context).hintColor,
                                      ),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.01),
                                      Text(
                                        "$bath Baths",
                                        style: GoogleFonts.inter(
                                            color: Theme.of(context).hintColor,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.035,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.015,
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.square_foot_rounded,
                                        color: Theme.of(context).hintColor,
                                      ),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.01),
                                      Text("$sft sq. ft.",
                                          style: GoogleFonts.inter(
                                              color:
                                                  Theme.of(context).hintColor,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.035,
                                              fontWeight: FontWeight.w400))
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.bed,
                                        color: Theme.of(context).hintColor,
                                      ),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.01),
                                      Text(indiaFormat.format(cost),
                                          style: GoogleFonts.inter(
                                              color:
                                                  Theme.of(context).hintColor,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.035,
                                              fontWeight: FontWeight.w400))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.015,
                            ),
                            Divider(
                              color: Theme.of(context).primaryColor,
                              thickness: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    dealer,
                                    style: GoogleFonts.inter(
                                        color: Theme.of(context).hintColor,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.035,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () async {
                                            var whatsappURlandroid =
                                                "whatsapp://send?phone=$number&text=Hello";
                                            var whatsappURLios =
                                                "https://wa.me/$number?text=${Uri.parse("Hello")}";
                                            if (Platform.isIOS) {
                                              // for iOS phone only
                                              if (await canLaunchUrl(
                                                  Uri(path: whatsappURLios))) {
                                                await launchUrl(
                                                    Uri(path: whatsappURLios));
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(const SnackBar(
                                                        content: Text(
                                                            "whatsapp no installed")));
                                              }
                                            } else {
                                              if (await canLaunch(
                                                  whatsappURlandroid)) {
                                                await launch(
                                                    whatsappURlandroid);
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(const SnackBar(
                                                        content: Text(
                                                            "whatsapp no installed")));
                                              }
                                            }
                                          },
                                          icon: Image.network(
                                              'https://cdn-icons-png.flaticon.com/512/124/124034.png?w=740&t=st=1656751163~exp=1656751763~hmac=3e5cd586eb711d53069f6ec6c5f9fdbd67c451cca7915d8684aae3d1a53cee94')),
                                      IconButton(
                                          color: Theme.of(context).hintColor,
                                          onPressed: () {
                                            FlutterPhoneDirectCaller.callNumber(
                                                number);
                                          },
                                          icon: const Icon(Icons.phone))
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
