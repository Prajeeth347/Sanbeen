import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:sanbeen_zedital/drawers/main_drawer.dart';
import 'package:sanbeen_zedital/models/properties_model(20).dart';
import 'package:sanbeen_zedital/screens/aboutuspage.dart';
import 'package:sanbeen_zedital/screens/begin_posting.dart';
import 'package:sanbeen_zedital/screens/profilepage.dart';
import 'package:sanbeen_zedital/screens/properties(20).dart';
import 'package:sanbeen_zedital/screens/property_display.dart';
import 'package:sanbeen_zedital/screens/property_single.dart';
import 'package:sanbeen_zedital/services/properties_20_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class rentals_page extends StatefulWidget {
  const rentals_page({Key? key}) : super(key: key);

  @override
  State<rentals_page> createState() => _rentals_pageState();
}

class _rentals_pageState extends State<rentals_page> {
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

  var number;
  List collectio = ["Hi","Hello","Hola"];
  List furnishing = ["Hi","Hello","Hola"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      // SizedBox(height: 20),
      Padding(
        padding: EdgeInsets.fromLTRB(16, 15, 16, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Recently Posted Properties",
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
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      decoration: TextDecoration.underline)),
            )
          ],
        ),
      ),
      if (_prop_20_loaded == false)
        CircularProgressIndicator(color: Theme.of(context).primaryColor),
      if (_prop_20_loaded == true)
        SizedBox(
          height: 200,
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
      Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
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
                    'Want to sell/rent',
                    style: TextStyle(
                        color: Theme.of(context).backgroundColor,
                        fontSize: MediaQuery.of(context).size.width * 0.055,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'your property?',
                    style: TextStyle(
                        color: Theme.of(context).backgroundColor,
                        fontSize: MediaQuery.of(context).size.width * 0.055,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => begin_posting()));
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).backgroundColor),
                          ),
                          child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10, 0, 10, 0),
                              child: Text(
                                'Post Property',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04,
                                    color: Theme.of(context).primaryColor),
                                textAlign: TextAlign.center,
                              ))))
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.06,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.19,
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
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.02,
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(16,8,8,8),
        child: Text(
          "Rental Collections",
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: MediaQuery.of(context).size.width * 0.05),
          textAlign: TextAlign.start,
        ),
      ),
        Padding(
          padding: EdgeInsets.fromLTRB(16,8,8,8),
          child: SizedBox(
            height: 130,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: collectio.length,
              itemBuilder: ((context,index){
                return Text(collectio[index],style: TextStyle(color: Colors.white),);
              }),
            ),
          ),
        ),
        SizedBox(
        height: MediaQuery.of(context).size.height * 0.02,
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(16,8,8,8),
        child: Text(
          "Homes by furnishing",
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: MediaQuery.of(context).size.width * 0.05),
          textAlign: TextAlign.start,
        ),
      ),
        Padding(
          padding: EdgeInsets.fromLTRB(16,8,8,8),
          child: SizedBox(
            height: 150,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: furnishing.length,
              itemBuilder: ((context,index){
                return Text(furnishing[index],style: TextStyle(color: Colors.white),);
              }),
            ),
          ),
        ),
    ]);
  }
}
