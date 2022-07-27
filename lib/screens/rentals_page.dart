import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:sanbeen_zedital/drawers/main_drawer.dart';
import 'package:sanbeen_zedital/models/properties_model(20).dart';
//import 'package:sanbeen_zedital/screens/aboutuspage.dart';
import 'package:sanbeen_zedital/screens/begin_posting.dart';
import 'package:sanbeen_zedital/screens/profilepage.dart';
import 'package:sanbeen_zedital/screens/properties_all.dart';
//import 'package:sanbeen_zedital/screens/property_display.dart';
import 'package:sanbeen_zedital/screens/property_single.dart';
import 'package:sanbeen_zedital/services/properties_20_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class RentalsPage extends StatefulWidget {
  const RentalsPage({Key? key}) : super(key: key);

  @override
  State<RentalsPage> createState() => _RentalsPageState();
}

class _RentalsPageState extends State<RentalsPage> {
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
    //final TextTheme textTheme = Theme.of(context).textTheme;

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
                            builder: (context) => const ProfilePage()));
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
                  title: SizedBox(
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
                    "https://images.pexels.com/photos/186077/pexels-photo-186077.jpeg?cs=srgb&dl=pexels-binyamin-mellish-186077.jpg&fm=jpg",
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
                  return const RentalBody();
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
      // drawer: main_drawer(
      //   user_image:
      //       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjjYXm0bKrsV1VZPuyaq-j009UD1aBDCUz5A&usqp=CAU",
      // ),
    );
  }

  Widget searchField() {
    return TextField(
      autofocus: true,
      decoration: InputDecoration(
          hintText: "search cities, localities, etc",
          hintStyle: GoogleFonts.inter(
              color: const Color.fromARGB(156, 76, 72, 60),
              fontWeight: FontWeight.w400,
              fontSize: _isShrink
                  ? MediaQuery.of(context).size.width * 0.040
                  : MediaQuery.of(context).size.width * 0.025),
          enabled: false,
          suffixIcon: const Icon(Icons.search),
          fillColor: Theme.of(context).hintColor,
          filled: true),
    );
  }
}

class RentalBody extends StatefulWidget {
  const RentalBody({
    Key? key,
  }) : super(key: key);

  @override
  State<RentalBody> createState() => _RentalBodyState();
}

class _RentalBodyState extends State<RentalBody> {
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

  String number = "7989772884";
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
  List zones = ["zone-1", "zone-2", "zone-3", "zone-4"];
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

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 15, 16, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Recently Posted Properties",
              style: GoogleFonts.poppins(
                color: Theme.of(context).primaryColor,
                fontSize: MediaQuery.of(context).size.width * 0.04,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PropertiesAll()));
              },
              child: Text("View all",
                  style: GoogleFonts.inter(
                      color: Theme.of(context).primaryColor,
                      fontSize: MediaQuery.of(context).size.width * 0.03,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline)),
            )
          ],
        ),
      ),
      // if (prop20loaded == false)

      // CircularProgressIndicator(color: Theme.of(context).primaryColor),
      if (prop20loaded == true)
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.22,
          child: ListView.builder(
              itemCount: property?.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                if (property![index].propertyMode == "rent") {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              PropertySinglePage(id: property![index].id)));
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(3, 8, 3, 10),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
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
                            ],
                          ),
                        ),
                        Text(property![index].name,
                            style: GoogleFonts.inter(
                              color: Theme.of(context).primaryColor,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.035,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                  );
                }
                return Container();
              })),
        ),
      Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.19,
            color: Theme.of(context).primaryColor,
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.08,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Text(
                      'Want to sell/rent',
                      style: GoogleFonts.poppins(
                          color: Theme.of(context).backgroundColor,
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'your property?',
                      style: GoogleFonts.poppins(
                          color: Theme.of(context).backgroundColor,
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const BeginPosting()));
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Theme.of(context).backgroundColor),
                            ),
                            child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8, 0, 8, 0),
                                child: Text(
                                  'Post Property',
                                  style: GoogleFonts.poppins(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.035,
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.center,
                                ))))
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.06,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.3,
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    'assets/images/house.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.01,
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: Text(
          "Rental Collections",
          style: GoogleFonts.poppins(
              color: Theme.of(context).primaryColor,
              fontSize: MediaQuery.of(context).size.width * 0.04,
              fontWeight: FontWeight.w500),
          textAlign: TextAlign.start,
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: collectio.length,
            itemBuilder: ((context, index) {
              return Row(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: MediaQuery.of(context).size.height * 0.2,
                          color: const Color.fromARGB(255, 225, 214, 182),
                          child: Image.asset(
                            collectio[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Text(
                                  collectio1[index],
                                  style: GoogleFonts.inter(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.045,
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context).backgroundColor),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  collectio2[index],
                                  style: GoogleFonts.inter(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.03,
                                      fontWeight: FontWeight.w300,
                                      color: Theme.of(context).backgroundColor),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                ],
              );
            }),
          ),
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.01,
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: Text(
          "Homes by furnishing",
          style: GoogleFonts.poppins(
              color: Theme.of(context).primaryColor,
              fontSize: MediaQuery.of(context).size.width * 0.04,
              fontWeight: FontWeight.w500),
          textAlign: TextAlign.start,
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.18,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: furnishing.length,
            itemBuilder: ((context, index) {
              return Row(
                children: [
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.13,
                        color: const Color.fromARGB(255, 225, 214, 182),
                        child: Image.asset(
                          collectio[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.014,
                      ),
                      Text(
                        furnishing[index],
                        style: GoogleFonts.inter(
                            color: Theme.of(context).primaryColor,
                            fontSize: MediaQuery.of(context).size.width * 0.035,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  )
                ],
              );
            }),
          ),
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.001,
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: Text(
          "Popular Localities",
          style: GoogleFonts.poppins(
              color: Theme.of(context).primaryColor,
              fontSize: MediaQuery.of(context).size.width * 0.04,
              fontWeight: FontWeight.w500),
          textAlign: TextAlign.start,
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.01,
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 4, 8, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.9,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.45,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0),
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
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.07,
                              backgroundImage: AssetImage(collectio[index]),
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
                            locality[index],
                            style: GoogleFonts.poppins(
                                color: Theme.of(context).hintColor,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.035),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.002,
                          ),
                          Text(
                            localit1[index] + ' new localities',
                            style: GoogleFonts.inter(
                                color: Theme.of(context).hintColor,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.03),
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
                  );
                }),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PropertiesAll()));
              },
              child: Row(
                children: [
                  Text("View all new localities",
                      style: GoogleFonts.inter(
                          color: Theme.of(context).primaryColor,
                          fontSize: MediaQuery.of(context).size.width * 0.035,
                          fontWeight: FontWeight.w400)),
                  Icon(
                    Icons.arrow_right_alt,
                    size: MediaQuery.of(context).size.width * 0.06,
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ],
        ),
      ),

      Padding(
        padding: const EdgeInsets.fromLTRB(16, 5, 8, 8),
        child: Text(
          "Residential Zones",
          style: GoogleFonts.poppins(
              color: Theme.of(context).primaryColor,
              fontSize: MediaQuery.of(context).size.width * 0.04,
              fontWeight: FontWeight.w500),
          textAlign: TextAlign.start,
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.19,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: zones.length,
            itemBuilder: ((context, index) {
              return Row(
                children: [
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.48,
                        height: MediaQuery.of(context).size.height * 0.14,
                        color: const Color.fromARGB(255, 225, 214, 182),
                        child: Image.asset(
                          collectio[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(
                        zones[index],
                        style: GoogleFonts.inter(
                            color: Theme.of(context).primaryColor,
                            fontSize: MediaQuery.of(context).size.width * 0.035,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  )
                ],
              );
            }),
          ),
        ),
      ),
      Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: Container(
              height: MediaQuery.of(context).size.height * 0.03,
              width: MediaQuery.of(context).size.width * 1,
              color: Theme.of(context).primaryColor,
              child: Text(
                '   Featured Dealers',
                style: GoogleFonts.poppins(
                    color: Theme.of(context).backgroundColor,
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ))),
      Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 1,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: locality.length,
            itemBuilder: ((context, index) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width * 0.5,
                color: Theme.of(context).primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.width * 0.48,
                        color: Theme.of(context).backgroundColor,
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.06,
                              backgroundImage: AssetImage(collectio[index]),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Text(dealer[index],
                                style: GoogleFonts.poppins(
                                    color: Theme.of(context).hintColor,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.032,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.0015,
                            ),
                            Text(buyer[index] + ' Buyers this week',
                                style: GoogleFonts.inter(
                                    color: Theme.of(context).hintColor,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.025)),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005,
                            ),
                            Text('Member Since ' + time[index],
                                style: GoogleFonts.inter(
                                    color: Theme.of(context).hintColor,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.02)),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005,
                            ),
                            Center(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                  ),
                                  Icon(
                                    Icons.star_rounded,
                                    color: Theme.of(context).primaryColor,
                                    size: MediaQuery.of(context).size.width *
                                        0.05,
                                  ),
                                  Icon(
                                    Icons.star_rounded,
                                    color: Theme.of(context).primaryColor,
                                    size: MediaQuery.of(context).size.width *
                                        0.05,
                                  ),
                                  Icon(
                                    Icons.star_rounded,
                                    color: Theme.of(context).primaryColor,
                                    size: MediaQuery.of(context).size.width *
                                        0.05,
                                  ),
                                  Icon(
                                    Icons.star_rounded,
                                    color: Theme.of(context).primaryColor,
                                    size: MediaQuery.of(context).size.width *
                                        0.05,
                                  )
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () async {
                                        var whatsappURlandroid =
                                            "${"whatsapp://send?phone=" + number}&text=Hello";
                                        var whatappURLios =
                                            "https://wa.me/$number?text=${Uri.parse("Hello")}";
                                        if (Platform.isIOS) {
                                          // for iOS phone only
                                          if (await canLaunchUrl(
                                              Uri(path: whatappURLios))) {
                                            await launchUrl(
                                                Uri(path: whatappURLios));
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text(
                                                        "whatsapp no installed")));
                                          }
                                        } else {
                                          if (await canLaunch(
                                              whatsappURlandroid)) {
                                            await launch(whatsappURlandroid);
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text(
                                                        "whatsapp no installed")));
                                          }
                                        }
                                      },
                                      icon: Image.asset(
                                          'assets/images/whatsapp.png'),
                                      iconSize:
                                          MediaQuery.of(context).size.width *
                                              0.005,
                                    ),
                                    Text('Whatsapp',
                                        style: GoogleFonts.inter(
                                            color: Theme.of(context).hintColor,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.025,
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.03,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    FlutterPhoneDirectCaller.callNumber(number);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.phone,
                                        color: Theme.of(context).primaryColor,
                                        size:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                      ),
                                      Text('Call Now',
                                          style: GoogleFonts.inter(
                                              color:
                                                  Theme.of(context).hintColor,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.025,
                                              fontWeight: FontWeight.w400))
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ]),
                ),
              );
            }),
          ),
        ),
      ),
    ]);
  }
}
