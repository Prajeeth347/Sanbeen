import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:sanbeen_zedital/drawers/main_drawer.dart';
import 'package:sanbeen_zedital/models/properties_model(20).dart';
import 'package:sanbeen_zedital/screens/aboutuspage.dart';
import 'package:sanbeen_zedital/screens/begin_posting.dart';
import 'package:sanbeen_zedital/screens/kdummy.dart';
import 'package:sanbeen_zedital/screens/profilepage.dart';
import 'package:sanbeen_zedital/screens/properties(20).dart';
import 'package:sanbeen_zedital/screens/property_display.dart';
import 'package:sanbeen_zedital/screens/property_single.dart';
import 'package:sanbeen_zedital/screens/signin.dart';
import 'package:sanbeen_zedital/services/properties_20_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class buying_prop_page extends StatefulWidget {
  const buying_prop_page({Key? key}) : super(key: key);

  @override
  State<buying_prop_page> createState() => _buying_prop_pageState();
}

class _buying_prop_pageState extends State<buying_prop_page> {
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
                      ))
                ],
                elevation: 0,
                backgroundColor: Theme.of(context).backgroundColor,
                pinned: true,
                expandedHeight: 190,
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
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_ezKQ7JACM7cfswq9o1FRdQ8QerKO-Yqtgw&usqp=CAU",
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
                  return buy_prop_body();
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
          hintStyle: TextStyle(
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

class buy_prop_body extends StatefulWidget {
  const buy_prop_body({
    Key? key,
  }) : super(key: key);

  @override
  State<buy_prop_body> createState() => _buy_prop_bodyState();
}

class _buy_prop_bodyState extends State<buy_prop_body> {
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

  var number;
  List collectio = [
    'assets/images/bill.png',
    'assets/images/house.png',
    'assets/images/bill.png',
    'assets/images/house.png'
  ];
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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        // SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.fromLTRB(24, 15, 16, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recommended Properties",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: MediaQuery.of(context).size.width * 0.05),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => properties_20()));
                },
                child: Text("View all",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: MediaQuery.of(context).size.width * 0.033,
                        decoration: TextDecoration.underline)),
              )
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        if (_prop_20_loaded == false)
          CircularProgressIndicator(color: Theme.of(context).primaryColor),
        if (_prop_20_loaded == true)
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
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
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      width: 170,
                                      height: 120,
                                      child: Image.network(
                                        property![index].images[0],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          120, 0, 0, 0),
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.favorite_outline,
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.065,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.fromLTRB(10, 8, 10, 12)),
                          Text(property![index].name,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.04)),
                        ],
                      ),
                    );
                  return Container();
                })),
          ),
        Padding(
          padding: EdgeInsets.fromLTRB(24, 15, 16, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recommended Projects",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: MediaQuery.of(context).size.width * 0.05),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => properties_20()));
                },
                child: Text("View all",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: MediaQuery.of(context).size.width * 0.033,
                        decoration: TextDecoration.underline)),
              )
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.35,
          child: property == null
              ? CircularProgressIndicator(color: Theme.of(context).primaryColor)
              : ListView.builder(
                  itemCount: property?.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    if (property![index].propertyMode == "rent")
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => property_single_page(
                                  id: property![index].id)));
                        },
                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.35,
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 8, 10, 12),
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Container(
                                            width: 170,
                                            height: 120,
                                            child: Image.network(
                                              property![index].images[0],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 10, 0),
                                            child: IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.favorite_outline,
                                                  size: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.065,
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(property![index].name,
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04)),
                                  Text(property![index].description,
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.017)),
                                  Text(property![index].price.toString(),
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04)),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    return Container();
                  })),
        ),

        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),

        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 8, 0),
            child: Container(
                height: MediaQuery.of(context).size.height * 0.03,
                width: MediaQuery.of(context).size.width * 1,
                color: Theme.of(context).primaryColor,
                child: Text(
                  'Featured Dealers',
                  style: TextStyle(
                      color: Theme.of(context).backgroundColor,
                      fontSize: MediaQuery.of(context).size.width * 0.055,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.justify,
                ))),
        Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 8, 8),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width * 1,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: locality.length,
              itemBuilder: ((context, index) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.37,
                  width: MediaQuery.of(context).size.width * 0.45,
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 0.4,
                          color: Theme.of(context).backgroundColor,
                          child: Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              CircleAvatar(
                                radius:
                                    MediaQuery.of(context).size.width * 0.06,
                                backgroundImage: AssetImage(collectio[index]),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Text(dealer[index],
                                  style: TextStyle(
                                      color: Theme.of(context).hintColor,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04)),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.005,
                              ),
                              Text(buyer[index] + ' Buyers this week',
                                  style: TextStyle(
                                      color: Theme.of(context).hintColor,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.03)),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.005,
                              ),
                              Text('Member Since ' + time[index],
                                  style: TextStyle(
                                      color: Theme.of(context).hintColor,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.025)),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.005,
                              ),
                              Center(
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.05,
                                    ),
                                    Icon(
                                      Icons.star_rounded,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    Icon(
                                      Icons.star_rounded,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    Icon(
                                      Icons.star_rounded,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    Icon(
                                      Icons.star_rounded,
                                      color: Theme.of(context).primaryColor,
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: () async {
                                        var whatsappURl_android =
                                            "whatsapp://send?phone=" +
                                                number +
                                                "&text=Hello";
                                        var whatappURL_ios =
                                            "https://wa.me/$number?text=${Uri.parse("Hello")}";
                                        if (Platform.isIOS) {
                                          // for iOS phone only
                                          if (await canLaunchUrl(
                                              Uri(path: whatappURL_ios))) {
                                            await launchUrl(
                                                Uri(path: whatappURL_ios));
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: new Text(
                                                        "whatsapp no installed")));
                                          }
                                        } else {
                                          if (await canLaunch(
                                              whatsappURl_android)) {
                                            await launch(whatsappURl_android);
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: new Text(
                                                        "whatsapp no installed")));
                                          }
                                        }
                                      },
                                      icon: Image.network(
                                          'https://cdn-icons-png.flaticon.com/512/124/124034.png?w=740&t=st=1656751163~exp=1656751763~hmac=3e5cd586eb711d53069f6ec6c5f9fdbd67c451cca7915d8684aae3d1a53cee94')),
                                  Text('Whatsapp',
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      color: Theme.of(context).hintColor,
                                      onPressed: () {
                                        FlutterPhoneDirectCaller.callNumber(
                                            number);
                                      },
                                      icon: Icon(
                                        Icons.phone,
                                        color: Theme.of(context).primaryColor,
                                        size: 20,
                                      )),
                                  Text('Call Now',
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03,
                                          fontWeight: FontWeight.w500))
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
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Text(
          " New localities",
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: MediaQuery.of(context).size.width * 0.05,
              fontWeight: FontWeight.w500),
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(16, 8, 8, 8),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.18,
            width: MediaQuery.of(context).size.width * 0.9,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.35,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20),
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
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: MediaQuery.of(context).size.height * 0.07,
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
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Column(
                      children: [
                        Text(
                          locality[index],
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.002,
                        ),
                        Text(
                          localit1[index] + ' new localities',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.035),
                          textAlign: TextAlign.left,
                        ),
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
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.height * 0.2,
          color: Theme.of(context).primaryColor,
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.03,
              ),
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Text(
                    'Introducing new ways',
                    style: TextStyle(
                        color: Theme.of(context).backgroundColor,
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'of paying rent',
                    style: TextStyle(
                        color: Theme.of(context).backgroundColor,
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    '100% secure | Lowest Convinience Fee',
                    style: TextStyle(
                        color: Theme.of(context).backgroundColor,
                        fontSize: MediaQuery.of(context).size.width * 0.03,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => begin_posting()));
                      },
                      child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10, 0, 10, 0),
                          child: Text(
                            'Pay Rent Now  ->',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                color: Theme.of(context).backgroundColor),
                            textAlign: TextAlign.center,
                          )))
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.000001,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.19,
                width: MediaQuery.of(context).size.width * 0.3,
                alignment: Alignment.centerRight,
                child: Image.asset(
                  'assets/images/bill.png',
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
          child: Text(
            "Get great properties in popular cities",
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: MediaQuery.of(context).size.width * 0.05),
            textAlign: TextAlign.start,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
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
                            width: MediaQuery.of(context).size.width * 0.22,
                            height: MediaQuery.of(context).size.height * 0.11,
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
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04),
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
      ]),
    );
  }
}
