import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanbeen_zedital/drawers/main_drawer.dart';
import 'package:sanbeen_zedital/models/properties_model(20).dart';
import 'package:sanbeen_zedital/screens/profilepage.dart';
import 'package:sanbeen_zedital/screens/property_single.dart';
import 'package:sanbeen_zedital/services/properties_20_helper.dart';
import 'package:intl/intl.dart';

class ShortProperties extends StatefulWidget {
  const ShortProperties({Key? key}) : super(key: key);

  @override
  State<ShortProperties> createState() => PropertiesState();
}

class PropertiesState extends State<ShortProperties> {
  var indiaFormat = NumberFormat.compactSimpleCurrency(locale: 'en_IN');

  List<Properties>? property;
  var proploaded = false;
  @override
  void initState() {
    super.initState();
    getPropertyData();
  }

  getPropertyData() async {
    property = await PropertyServices().getprofiles();
    if (property != null) {
      setState(() {
        proploaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(
          userimage:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjjYXm0bKrsV1VZPuyaq-j009UD1aBDCUz5A&usqp=CAU"),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        backgroundColor: Theme.of(context).backgroundColor,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ProfilePage()));
              },
              icon: Icon(
                Icons.person,
                color: Theme.of(context).primaryColor,
                size: MediaQuery.of(context).size.width * 0.08,
              ))
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: proploaded == false
          ? Center(
              child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ))
          : Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "My Shortlisted Properties",
                      style: GoogleFonts.poppins(
                        color: Theme.of(context).primaryColor,
                        fontSize: MediaQuery.of(context).size.width * 0.045,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: property?.length,
                        itemBuilder: (context, index) {
                          return PropertiesCard(
                            name: property![index].name,
                            bedrooms: property![index].bedRooms,
                            cost: property![index].price,
                            dealer: property![index].account,
                            number: property![index].account,
                            img: property![index].images[0],
                            id: property![index].id,
                            city: property![index].city,
                          );
                          // return properties_20_card();
                        }),
                  ),
                ],
              )),
    );
  }
}

class PropertiesCard extends StatelessWidget {
  PropertiesCard({
    Key? key,
    required this.name,
    required this.bedrooms,
    //required this.bath,
    //required this.sft,
    required this.cost,
    required this.dealer,
    required this.number,
    required this.img,
    required this.id,
    required this.city,
  }) : super(key: key);
  String name;
  String id;
  String img;
  int bedrooms;
  //int bath;
  //int sft;
  int cost;
  String dealer;
  String number;
  String city;
  var indiaFormat = NumberFormat.compactSimpleCurrency(locale: 'en_IN');
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PropertySinglePage(id: id)));
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.25,
              color: Theme.of(context).primaryColor,
              child: Column(children: [
                Row(children: [
                  Stack(children: <Widget>[
                    Image.network(img,
                        height: MediaQuery.of(context).size.height * 0.17,
                        width: MediaQuery.of(context).size.width * 0.43,
                        fit: BoxFit.cover),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite_outline,
                              size: MediaQuery.of(context).size.width * 0.07,
                            )),
                      ),
                    ),
                  ]),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        name.toString(),
                        style: GoogleFonts.inter(
                          color: Theme.of(context).backgroundColor,
                          fontSize: MediaQuery.of(context).size.width * 0.032,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(
                        indiaFormat.format(cost),
                        style: GoogleFonts.inter(
                          color: Theme.of(context).backgroundColor,
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(
                        city.toString(),
                        style: GoogleFonts.inter(
                          color: Theme.of(context).backgroundColor,
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(
                        "${bedrooms}BHK",
                        style: GoogleFonts.inter(
                          color: Theme.of(context).backgroundColor,
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005,
                      ),
                      Row(
                        children: [
                          Text(
                            "Owner - ",
                            style: GoogleFonts.inter(
                              color: Theme.of(context).backgroundColor,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.022,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.30,
                            child: Text(
                              dealer.toString(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: GoogleFonts.inter(
                                color: Theme.of(context).backgroundColor,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.012,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ]),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                ElevatedButton(
                    onPressed: () {
                      FlutterPhoneDirectCaller.callNumber('7989772884');
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).backgroundColor),
                    ),
                    child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                        child: Text(
                          'Call Owner',
                          style: GoogleFonts.inter(
                            color: Theme.of(context).primaryColor,
                            fontSize: MediaQuery.of(context).size.width * 0.032,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        )))
              ]),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
          )
        ],
      ),
    );
  }
}
