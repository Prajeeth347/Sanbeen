import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sanbeen_zedital/models/properties_model(20).dart';
import 'package:sanbeen_zedital/screens/profilepage.dart';
// import 'package:sanbeen_zedital/screens/properties_all.dart';
// import 'package:sanbeen_zedital/screens/property_display.dart';
// import 'package:sanbeen_zedital/services/properties_20_helper.dart';
import 'package:sanbeen_zedital/services/property_single_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class PropertySinglePage extends StatefulWidget {
  PropertySinglePage({Key? key, required this.id}) : super(key: key);
  String id;

  @override
  State<PropertySinglePage> createState() => _PropertySinglePageState();
}

class _PropertySinglePageState extends State<PropertySinglePage> {
  ScrollController? _scrollController;
  bool lastStatus = true;
  double height = 200;
  // var indiaFormat = NumberFormat.compactSimpleCurrency(locale: 'en_IN');

  void _scrollListener() {
    if (_isShrink != lastStatus) {
      setState(() {
        lastStatus = _isShrink;
      });
    }
  }

  bool get _isShrink {
    return _scrollController != null &&
        _scrollController!.hasClients &&
        _scrollController!.offset > (height - kToolbarHeight);
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
    getProfileData();
  }

  @override
  void dispose() {
    _scrollController?.removeListener(_scrollListener);
    _scrollController?.dispose();
    super.dispose();
  }

  List<Properties>? property;
  var prop20loaded = false;
  final controller = ScrollController();
  //@override
  getProfileData() async {
    property = await PropertySingleServices().getprofiles(widget.id);
    if (property != null) {
      setState(() {
        prop20loaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: property == null
          ? LinearProgressIndicator(
              color: Theme.of(context).primaryColor,
            )
          : NestedScrollView(
              controller: _scrollController,
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                      iconTheme:
                          IconThemeData(color: Theme.of(context).primaryColor),
                      actions: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const ProfilePage()));
                            },
                            icon: Icon(
                              Icons.favorite_border,
                              color: _isShrink
                                  ? Theme.of(context).hintColor
                                  : Theme.of(context).backgroundColor,
                              size: MediaQuery.of(context).size.width * 0.07,
                            ))
                      ],
                      elevation: 0,
                      backgroundColor: Theme.of(context).backgroundColor,
                      pinned: true,
                      expandedHeight: MediaQuery.of(context).size.height * 0.3,
                      flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.parallax,
                        background: SafeArea(
                            child: Image.network(
                          property![0].images[0],
                          fit: BoxFit.cover,
                        )),
                        titlePadding: _isShrink == false
                            ? const EdgeInsets.only(top: 40)
                            : null,
                        title: _isShrink == false
                            ? ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    color: Theme.of(context).backgroundColor,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          16, 8, 8, 8),
                                      child: Text(property![0].name,
                                          style: GoogleFonts.poppins(
                                              color:
                                                  Theme.of(context).hintColor,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04,
                                              fontWeight: FontWeight.w600)),
                                    )),
                              )
                            : Text(property![0].name,
                                style: GoogleFonts.poppins(
                                    color: Theme.of(context).hintColor,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04,
                                    fontWeight: FontWeight.w600)),
                        centerTitle: _isShrink == false ? true : false,
                      )),
                ];
              },
              body: CustomScrollView(
                scrollBehavior: const ScrollBehavior(),
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return PropertyBody(
                          property: property,
                        );
                      },
                      childCount: 1,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class PropertyBody extends StatefulWidget {
  PropertyBody({Key? key, required this.property}) : super(key: key);
  List<Properties>? property;
  @override
  State<PropertyBody> createState() => _PropertyBodyState();
}

class _PropertyBodyState extends State<PropertyBody> {
  List aminities = ["Swimming Pool", "Gym Facilities", "Parking"];
  List images = [
    "https://sanbeen.s3.ap-south-1.amazonaws.com/1656932938885_prop.png"
  ];
  var indiaFormat = NumberFormat.compactSimpleCurrency(locale: 'en_IN');
  String number = "7989772884";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Theme.of(context).backgroundColor,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 8, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(indiaFormat.format(widget.property![0].price),
                      style: GoogleFonts.poppins(
                          color: Theme.of(context).hintColor,
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  if (aminities.isNotEmpty) ...[
                    Column(
                      children: [
                        for (int i = 0; i < aminities.length; i++) ...[
                          Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: Theme.of(context).primaryColor,
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.01),
                              Text(aminities[i],
                                  style: GoogleFonts.inter(
                                      color: Theme.of(context).primaryColor,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.035,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                        ]
                      ],
                    )
                  ],
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Wrap(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.34,
                        child: Row(
                          children: [
                            Icon(
                              Icons.bed,
                              color: Theme.of(context).hintColor,
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.015),
                            Text("${widget.property![0].bedRooms} Bedrooms",
                                style: GoogleFonts.poppins(
                                    color: Theme.of(context).hintColor,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.035,
                                    fontWeight: FontWeight.w500))
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: Row(
                          children: [
                            Icon(
                              Icons.bathtub,
                              color: Theme.of(context).hintColor,
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.015),
                            Text("${widget.property![0].bathRooms} Baths",
                                style: GoogleFonts.poppins(
                                    color: Theme.of(context).hintColor,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.035,
                                    fontWeight: FontWeight.w500))
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.32,
                        child: Row(
                          children: [
                            Icon(
                              Icons.square_foot_rounded,
                              color: Theme.of(context).hintColor,
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.015),
                            Text("${widget.property![0].size} sq. ft.",
                                style: GoogleFonts.poppins(
                                    color: Theme.of(context).hintColor,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.035,
                                    fontWeight: FontWeight.w500))
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text("Property Details",
                      style: GoogleFonts.poppins(
                          color: Theme.of(context).hintColor,
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  Text(widget.property![0].description,
                      style: GoogleFonts.inter(
                          color: Theme.of(context).primaryColor,
                          fontSize: MediaQuery.of(context).size.width * 0.035,
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text("View Photos",
                      style: GoogleFonts.poppins(
                          color: Theme.of(context).hintColor,
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  StaggeredGrid.count(
                    crossAxisCount: 4,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    children: [
                      for (int i = 0; i < images.length; i++) ...[
                        StaggeredGridTile.count(
                          mainAxisCellCount: ((i + 1) % 2) == 0 ? 1 : 2,
                          crossAxisCellCount: 2,
                          child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.15,
                              width: MediaQuery.of(context).size.width * 0.35,
                              child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Image.network(images[i]))),
                        ),
                      ]
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(widget.property![0].account,
                            style: GoogleFonts.poppins(
                                color: Theme.of(context).hintColor,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.043,
                                fontWeight: FontWeight.w400)),
                      ),
                      IconButton(
                          onPressed: () async {
                            var whatsappURlandroid =
                                "whatsapp://send?phone=$number&text=Hello";
                            var whatappURLios =
                                "https://wa.me/$number?text=${Uri.parse("Hello")}";
                            if (Platform.isIOS) {
                              // for iOS phone only
                              if (await canLaunchUrl(
                                  Uri(path: whatappURLios))) {
                                await launchUrl(Uri(path: whatappURLios));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text("whatsapp no installed")));
                              }
                            } else {
                              if (await canLaunch(whatsappURlandroid)) {
                                await launch(whatsappURlandroid);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text("whatsapp no installed")));
                              }
                            }
                          },
                          icon: Image.network(
                              'https://cdn-icons-png.flaticon.com/512/124/124034.png?w=740&t=st=1656751163~exp=1656751763~hmac=3e5cd586eb711d53069f6ec6c5f9fdbd67c451cca7915d8684aae3d1a53cee94')),
                      IconButton(
                          color: Theme.of(context).hintColor,
                          onPressed: () {
                            FlutterPhoneDirectCaller.callNumber(number);
                          },
                          icon: const Icon(Icons.phone))
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
