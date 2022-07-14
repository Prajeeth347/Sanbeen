import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sanbeen_zedital/drawers/main_drawer.dart';
import 'package:sanbeen_zedital/models/properties_model(20).dart';
import 'package:sanbeen_zedital/screens/aboutuspage.dart';
import 'package:sanbeen_zedital/screens/begin_posting.dart';
import 'package:sanbeen_zedital/screens/buy_prop_page.dart';
import 'package:sanbeen_zedital/screens/exploring_page..dart';
import 'package:sanbeen_zedital/screens/posting_property.dart';
import 'package:sanbeen_zedital/screens/profilepage.dart';
import 'package:sanbeen_zedital/screens/properties(20).dart';
import 'package:sanbeen_zedital/screens/property_display.dart';
import 'package:sanbeen_zedital/screens/property_single.dart';
import 'package:sanbeen_zedital/screens/testimonials.dart';
import 'package:sanbeen_zedital/services/properties_20_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class hdummy extends StatefulWidget {
  const hdummy({Key? key}) : super(key: key);

  @override
  State<hdummy> createState() => _hdummyState();
}

class _hdummyState extends State<hdummy> {
  ScrollController? _scrollController;
  bool lastStatus = true;
  double height = 200;
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
  }

  @override
  void dispose() {
    _scrollController?.removeListener(_scrollListener);
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
                iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => profile_page()));
                      },
                      icon: Icon(
                        Icons.person,
                        color: Theme.of(context).primaryColor,
                        size: MediaQuery.of(context).size.width * 0.08,
                      ))
                ],
                elevation: 0,
                backgroundColor: Theme.of(context).backgroundColor,
                pinned: true,
                expandedHeight: MediaQuery.of(context).size.height * 0.25,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  title: Container(
                      width: _isShrink
                          ? MediaQuery.of(context).size.width * 0.75
                          : MediaQuery.of(context).size.width * 0.5,
                      child: GestureDetector(
                          onTap: () {
                            print("Search");
                          },
                          child: searchField())),
                  centerTitle: true,
                  background: SafeArea(
                      child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZNp_NidXN04al4mK6-_ea0ut3ySY6wl7WhA&usqp=CAU',
                    fit: BoxFit.cover,
                  )),
                )),
          ];
        },
        body: CustomScrollView(
          scrollBehavior: const ScrollBehavior(),
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return rental_body();
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
      drawer: main_drawer(
        user_image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjjYXm0bKrsV1VZPuyaq-j009UD1aBDCUz5A&usqp=CAU",
      ),
    );
  }

  Widget searchField() {
    return TextField(
      autofocus: true,
      decoration: InputDecoration(
          hintText: "search cities, localities, etc",
          hintStyle: GoogleFonts.inter(
              color: Color.fromARGB(156, 76, 72, 60),
              fontWeight: FontWeight.w400,
              fontSize: _isShrink
                  ? MediaQuery.of(context).size.width * 0.040
                  : MediaQuery.of(context).size.width * 0.025),
          enabled: false,
          suffixIcon: Icon(Icons.search),
          fillColor: Theme.of(context).hintColor,
          filled: true),
    );
  }
}

class rental_body extends StatefulWidget {
  const rental_body({
    Key? key,
  }) : super(key: key);

  @override
  State<rental_body> createState() => _rental_bodyState();
}

class _rental_bodyState extends State<rental_body> {
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

  var indiaFormat = NumberFormat.compactSimpleCurrency(locale: 'en_IN');

  var number;
  List collectio = [
    'assets/images/bill.png',
    'assets/images/house.png',
    'assets/images/bill.png',
    'assets/images/house.png'
  ];
  List collectio1 = ['For Family', 'For Men', 'For Family', 'For Men'];
  List collectio2 = [
    '100+ properties',
    '500+ properties',
    '100+ properties',
    '500+ properties'
  ];
  List furnishing = ["Fully-furnished", "Semi-furnished", "Unfurnished"];
  List locality = [
    "locality-1",
    "locality-2",
    "locality-3",
    "locality-4",
  ];
  List localit1 = ["4", "3", "2", "1"];
  List dealer = ["Loreal Paris", "Sid Mathews", "Loreal Paris", "Sid Mathews"];
  List buyer = ["5", "6", "8", "2"];
  List time = ["Mar 2022", "Apr 2022", "Jan 2022", "Jul 2022"];
  List cities = ["Delhi", "Mumbai", "Chennai", "Kolkata"];
  List zones = [
    "Buying a house",
    "Selling a house",
    "Renting a house",
    "Commercial projects"
  ];
  List hello = [
    buy_prop_body(),
    posting_prop(),
    rental_body(),
    exploring_page()
  ];

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // SizedBox(height: 20),
      Padding(
        padding: EdgeInsets.fromLTRB(16, 15, 16, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Start Exploring",
              style: GoogleFonts.poppins(
                color: Theme.of(context).primaryColor,
                fontSize: MediaQuery.of(context).size.height * 0.02,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => exploring_page()));
              },
              child: Text("View all",
                  style: GoogleFonts.inter(
                      color: Theme.of(context).primaryColor,
                      fontSize: MediaQuery.of(context).size.height * 0.015,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline)),
            )
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: ((context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => hello[index]));
                },
                child: Row(
                  children: [
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.38,
                            height: MediaQuery.of(context).size.height * 0.15,
                            color: Color.fromARGB(255, 225, 214, 182),
                            child: Image.asset(
                              collectio[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          zones[index],
                          style: GoogleFonts.inter(
                              color: Theme.of(context).primaryColor,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.035,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    )
                  ],
                ),
              );
            }),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(16, 15, 16, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Buying a house",
              style: GoogleFonts.poppins(
                color: Theme.of(context).primaryColor,
                fontSize: MediaQuery.of(context).size.height * 0.02,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.height * 0.25,
            color: Color.fromARGB(255, 225, 214, 182),
            child: Image.network(
              'https://thumbs.dreamstime.com/b/modern-house-interior-exterior-design-46517595.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      TextButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => buying_prop_page()));
        },
        child: Text("Find more house buying options",
            style: GoogleFonts.inter(
                color: Theme.of(context).primaryColor,
                fontSize: MediaQuery.of(context).size.height * 0.017,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline)),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(16, 15, 16, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Best Residential Properties",
              style: GoogleFonts.poppins(
                color: Theme.of(context).primaryColor,
                fontSize: MediaQuery.of(context).size.height * 0.02,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      if (_prop_20_loaded == false)
        CircularProgressIndicator(color: Theme.of(context).primaryColor),
      if (_prop_20_loaded == true)
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.42,
          child: ListView.builder(
              itemCount: property?.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                if (property![index].propertyMode == "rent")
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              property_single_page(id: property![index].id)));
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 8, 10, 12),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.55,
                                  height:
                                      MediaQuery.of(context).size.height * 0.33,
                                  child: Image.network(
                                    property![index].images[0],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.favorite_outline,
                                        size:
                                            MediaQuery.of(context).size.width *
                                                0.065,
                                      )),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(20, 210, 19, 10),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                      width: MediaQuery.of(context).size.width *
                                          0.45,
                                      color: Theme.of(context).backgroundColor,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(property![index].name,
                                              style: GoogleFonts.inter(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.02,
                                                fontWeight: FontWeight.w500,
                                              )),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.005,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                  property![index]
                                                          .bedRooms
                                                          .toString() +
                                                      'BHK ',
                                                  style: GoogleFonts.inter(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.012,
                                                    fontWeight: FontWeight.w400,
                                                  )),
                                              Text(property![index].type,
                                                  style: GoogleFonts.inter(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.012,
                                                    fontWeight: FontWeight.w400,
                                                  )),
                                            ],
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.005,
                                          ),
                                          Text(
                                              indiaFormat.format(
                                                  property![index].price),
                                              style: GoogleFonts.inter(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.015,
                                                fontWeight: FontWeight.w500,
                                              )),
                                        ],
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                return Container();
              })),
        ),
      Padding(
        padding: EdgeInsets.fromLTRB(16, 15, 16, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Renting a home",
              style: GoogleFonts.poppins(
                color: Theme.of(context).primaryColor,
                fontSize: MediaQuery.of(context).size.height * 0.02,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.height * 0.25,
            color: Color.fromARGB(255, 225, 214, 182),
            child: Image.network(
              'https://thumbs.dreamstime.com/b/modern-house-interior-exterior-design-46517595.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      TextButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => rental_body()));
        },
        child: Text("Find more house renting options",
            style: GoogleFonts.inter(
                color: Theme.of(context).primaryColor,
                fontSize: MediaQuery.of(context).size.height * 0.017,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline)),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: Text(
          "Services provided by us",
          style: GoogleFonts.poppins(
              color: Theme.of(context).primaryColor,
              fontSize: MediaQuery.of(context).size.width * 0.042,
              fontWeight: FontWeight.w500),
          textAlign: TextAlign.start,
        ),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.19,
              width: MediaQuery.of(context).size.width * 0.9,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 0.65,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: locality.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Container(
                      color: Theme.of(context).primaryColor,
                      height: MediaQuery.of(context).size.height * 0.16,
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          Text(
                            zones[index],
                            style: GoogleFonts.poppins(
                                color: Theme.of(context).backgroundColor,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.037),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.002,
                          ),
                          Text(
                              'Lorem ipsum dolor sit amet. Sed debitis accusantium non iste impedit et architecto quasi. Qui voluptate dolor et quia Quis quo cupiditate corrupti ut ipsam voluptas et rerum doloremque! Aut doloremque accusamus in voluptatem possimus nihil perferendis rem magnam tempore. Est eaque libero est quos dolor in quia veritatis est nisi recusandae ad pariatur laborum.',
                              style: GoogleFonts.inter(
                                color: Theme.of(context).backgroundColor,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.01,
                                fontWeight: FontWeight.w400,
                              )),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.002,
                          ),
                          Text(
                            "Know More",
                            style: GoogleFonts.poppins(
                                color: Theme.of(context).backgroundColor,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.037),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: Text(
          "Get great properties in popular cities",
          style: GoogleFonts.poppins(
              color: Theme.of(context).primaryColor,
              fontSize: MediaQuery.of(context).size.width * 0.042,
              fontWeight: FontWeight.w500),
          textAlign: TextAlign.start,
        ),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.12,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: locality.length,
            itemBuilder: ((context, index) {
              return Row(
                children: [
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(90),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.18,
                          height: MediaQuery.of(context).size.height * 0.085,
                          color: Theme.of(context).hintColor,
                          child: CircleAvatar(
                            radius: MediaQuery.of(context).size.width * 0.08,
                            backgroundImage: AssetImage(collectio[index]),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(
                        cities[index],
                        style: GoogleFonts.inter(
                            color: Theme.of(context).primaryColor,
                            fontSize: MediaQuery.of(context).size.width * 0.033,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.06,
                  )
                ],
              );
            }),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(16, 15, 16, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Handpicked Properties",
              style: GoogleFonts.poppins(
                color: Theme.of(context).primaryColor,
                fontSize: MediaQuery.of(context).size.height * 0.02,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),

      SizedBox(
        height: MediaQuery.of(context).size.height * 0.65,
        child: property != null ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0),
            itemCount: 4,
            shrinkWrap: true,
            itemBuilder: ((context, index) {
              if (property![index].propertyMode == "rent")
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            property_single_page(id: property![index].id)));
                  },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 8, 10, 12),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height:
                                MediaQuery.of(context).size.height * 0.25,
                            child: Image.network(
                              property![index].images[0],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite_outline,
                                  size: MediaQuery.of(context).size.width *
                                      0.065,
                                  color: Theme.of(context).backgroundColor,
                                )),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(4, 140, 5, 10),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                height: MediaQuery.of(context).size.height *
                                    0.1,
                                width: MediaQuery.of(context).size.width *
                                    0.48,
                                color: Theme.of(context).backgroundColor,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  children: [
                                    Text(property![index].name,
                                        style: GoogleFonts.inter(
                                          color: Theme.of(context)
                                              .primaryColor,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                          fontWeight: FontWeight.w500,
                                        )),
                                    SizedBox(
                                      height: MediaQuery.of(context)
                                              .size
                                              .height *
                                          0.005,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                            property![index]
                                                    .bedRooms
                                                    .toString() +
                                                'BHK ',
                                            style: GoogleFonts.inter(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontSize:
                                                  MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.012,
                                              fontWeight: FontWeight.w400,
                                            )),
                                        Text(property![index].type,
                                            style: GoogleFonts.inter(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontSize:
                                                  MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.012,
                                              fontWeight: FontWeight.w400,
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: MediaQuery.of(context)
                                              .size
                                              .height *
                                          0.005,
                                    ),
                                    Text(
                                        indiaFormat
                                            .format(property![index].price),
                                        style: GoogleFonts.inter(
                                          color: Theme.of(context)
                                              .primaryColor,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.015,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ],
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                );
              return Container();
            })) : Container(),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(16, 15, 16, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Why trust us",
              style: GoogleFonts.poppins(
                color: Theme.of(context).primaryColor,
                fontSize: MediaQuery.of(context).size.height * 0.02,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.18,
          width: MediaQuery.of(context).size.width * 0.95,
          color: Theme.of(context).primaryColor,
          child: Row(children: [
            Padding(
              padding: EdgeInsets.all(6.0),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.265,
                    child: Image.asset('assets/images/homie.png'),
                  ),
                  Text(
                    '230+',
                    style: GoogleFonts.poppins(
                      color: Theme.of(context).backgroundColor,
                      fontSize: MediaQuery.of(context).size.height * 0.016,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Properties sold',
                    style: GoogleFonts.inter(
                      color: Theme.of(context).backgroundColor,
                      fontSize: MediaQuery.of(context).size.height * 0.015,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.015,
            ),
            Padding(
              padding: EdgeInsets.all(6.0),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.265,
                    child: Image.asset('assets/images/home.png'),
                  ),
                  Text(
                    '350+',
                    style: GoogleFonts.poppins(
                      color: Theme.of(context).backgroundColor,
                      fontSize: MediaQuery.of(context).size.height * 0.016,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Properties listed',
                    style: GoogleFonts.inter(
                      color: Theme.of(context).backgroundColor,
                      fontSize: MediaQuery.of(context).size.height * 0.015,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(6.0),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.019,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.265,
                    child: Image.asset('assets/images/location.png'),
                  ),
                  Text(
                    'Great',
                    style: GoogleFonts.inter(
                      color: Theme.of(context).backgroundColor,
                      fontSize: MediaQuery.of(context).size.height * 0.016,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'locations',
                    style: GoogleFonts.inter(
                      color: Theme.of(context).backgroundColor,
                      fontSize: MediaQuery.of(context).size.height * 0.016,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: Text(
          "What our users say about us?",
          style: GoogleFonts.poppins(
              color: Theme.of(context).primaryColor,
              fontSize: MediaQuery.of(context).size.width * 0.045,
              fontWeight: FontWeight.w500),
          textAlign: TextAlign.start,
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.01,
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.19,
              width: MediaQuery.of(context).size.width * 0.9,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 0.65,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: locality.length,
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(90),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.158,
                                  height: MediaQuery.of(context).size.height *
                                      0.074,
                                  color: Theme.of(context).hintColor,
                                  child: CircleAvatar(
                                    radius: MediaQuery.of(context).size.width *
                                        0.08,
                                    backgroundImage:
                                        AssetImage(collectio[index]),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
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
                                        MediaQuery.of(context).size.width *
                                            0.037),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.002,
                              ),
                              Text(
                                'owner, ' + cities[index],
                                style: GoogleFonts.inter(
                                    color: Theme.of(context).hintColor,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.03),
                                textAlign: TextAlign.left,
                              ),
                              Divider(
                                color: Theme.of(context).primaryColor,
                                thickness: 1,
                                height:
                                    MediaQuery.of(context).size.width * 0.058,
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
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => testimonials()));
              },
              child: Text("View more testimonials",
                  style: GoogleFonts.inter(
                      color: Theme.of(context).primaryColor,
                      fontSize: MediaQuery.of(context).size.height * 0.017,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline)),
            ),
          ],
        ),
      ),
    ]);
  }
}
