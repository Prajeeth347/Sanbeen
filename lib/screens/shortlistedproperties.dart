import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanbeen_zedital/models/properties_model(20).dart';
import 'package:sanbeen_zedital/screens/property_single.dart';
import 'package:sanbeen_zedital/services/properties_20_helper.dart';
import 'package:intl/intl.dart';

class short_properties extends StatefulWidget {
  const short_properties({Key? key}) : super(key: key);

  @override
  State<short_properties> createState() => _propertiesState();
}

class _propertiesState extends State<short_properties> {
  var indiaFormat = NumberFormat.compactSimpleCurrency(locale: 'en_IN');

  List<Properties>? property;
  var _prop_loaded = false;
  @override
  void initState() {
    super.initState();
    getPropertyData();
  }

  getPropertyData() async {
    property = await property_services().getprofiles();
    if (property != null) {
      setState(() {
        _prop_loaded = true;
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
        body: _prop_loaded == false
            ? Center(
                child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ))
            : Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "My Shortlisted Properties",
                        style: GoogleFonts.poppins(
                          color: Theme.of(context).primaryColor,
                          fontSize: MediaQuery.of(context).size.height * 0.024,
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
                            return properties_card(
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
                )));
  }
}

class properties_card extends StatelessWidget {
  properties_card({
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
  });
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
              builder: (context) => property_single_page(id: id)));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.27,
                color: Theme.of(context).primaryColor,
                child: Column(children: [
                  Row(children: [
                    Stack(children: <Widget>[
                      Image.network(img,
                          height: MediaQuery.of(context).size.height * 0.19,
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
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
                          height: MediaQuery.of(context).size.height * 0.01,
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
                          height: MediaQuery.of(context).size.height * 0.01,
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
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          bedrooms.toString() + "BHK",
                          style: GoogleFonts.inter(
                            color: Theme.of(context).backgroundColor,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.018,
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
                                    MediaQuery.of(context).size.height * 0.012,
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
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.012,
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
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15, 0, 15, 0),
                          child: Text(
                            'Call Owner',
                            style: GoogleFonts.inter(
                              color: Theme.of(context).primaryColor,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.018,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          )))
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
