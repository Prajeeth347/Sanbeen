import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'package:sanbeen_zedital/models/properties_model(20).dart';
import 'package:sanbeen_zedital/screens/profilepage.dart';
import 'package:sanbeen_zedital/screens/properties(20).dart';
import 'package:sanbeen_zedital/screens/property_display.dart';
import 'package:sanbeen_zedital/services/properties_20_helper.dart';
import 'package:sanbeen_zedital/services/property_single_helper.dart';

class property_single_page extends StatefulWidget {
  property_single_page({
    required this.id
  });
  String id;

  @override
  State<property_single_page> createState() => _property_single_pageState();
}

class _property_single_pageState extends State<property_single_page> {
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
  var _prop_20_loaded = false;
  final _controller = ScrollController();
  @override
  getProfileData() async{
    property = await property_single_services().getprofiles(widget.id);
    if (property != null) {
      setState(() {
        _prop_20_loaded = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      
        backgroundColor: Theme.of(context).backgroundColor,
        body: property == null ?LinearProgressIndicator(color: Theme.of(context).primaryColor,) : NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
                actions: [
                  IconButton(onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>profile_page()));
                  }, icon: Icon(Icons.favorite_border,color: _isShrink ? Theme.of(context).hintColor: Theme.of(context).backgroundColor,))
                ],
                elevation: 0,
                backgroundColor: Theme.of(context).backgroundColor,
                pinned: true,
                expandedHeight: 190,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background: SafeArea(
                    child: Image.network(
                              property![0].images[0],
                              fit: BoxFit.cover,
                            )
                  ),
                  titlePadding:_isShrink == false ? EdgeInsets.only(top: 40) : null,
                  title: _isShrink == false ? ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Theme.of(context).backgroundColor,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16,8,8,8),
                        child: Text(property![0].name,style: TextStyle(color: Theme.of(context).hintColor),),
                      )),
                  ) : Text(property![0].name,style: TextStyle(color: Theme.of(context).hintColor),),
                  centerTitle: _isShrink == false ? true : false,
                )
              ),
            ];
          },
          body: CustomScrollView(
            scrollBehavior: const ScrollBehavior(),
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return property_body(property: property,);
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

class property_body extends StatefulWidget {
  property_body(
    {
      required this.property
    }
  );
  List<Properties>? property;
  @override
  State<property_body> createState() => _property_bodyState();
}

class _property_bodyState extends State<property_body> {
  List aminities = ["Swimming Pool","Gym Facilities","Parking"];
  List images = ["https://sanbeen.s3.ap-south-1.amazonaws.com/1656932938885_prop.png"];
  var indiaFormat = NumberFormat.compactSimpleCurrency(locale: 'en_IN');
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
                        Text(indiaFormat.format(widget.property![0].price),style: TextStyle(color: Theme.of(context).hintColor,fontSize: MediaQuery.of(context).size.width * 0.055,fontWeight: FontWeight.w500)),
                        SizedBox(height: MediaQuery.of(context).size.height *0.02,),
                        if (aminities.length != 0)...[
                          Column(
                            children: [
                              for(int i = 0;i<aminities.length;i++)...[
                                Row(
                                  children: [
                                    Icon(Icons.check_circle,color: Theme.of(context).primaryColor,),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                                    Text(aminities[i],style: TextStyle(color: Theme.of(context).primaryColor,fontSize: MediaQuery.of(context).size.width * 0.04)),
                                  ],
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height *0.01,),
                              ]
                            ],
                          )
                        ],
                        SizedBox(height: MediaQuery.of(context).size.height *0.01,),
                        Wrap(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.34,
                                  child: Row(
                                    children: [
                                      Icon(Icons.bed,color: Theme.of(context).hintColor,),
                                      SizedBox(width: MediaQuery.of(context).size.width*0.01),
                                      Text(widget.property![0].bedRooms.toString() + " Bedrooms",style: TextStyle(color: Theme.of(context).hintColor),)
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.25,
                                  child: Row(
                                    children: [
                                      Icon(Icons.bathtub, color: Theme.of(context).hintColor,),
                                      SizedBox(width: MediaQuery.of(context).size.width*0.01),
                                      Text(widget.property![0].bathRooms.toString() + " Baths",style: TextStyle(color: Theme.of(context).hintColor,fontSize: MediaQuery.of(context).size.width*0.04),)
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.32,
                                  child: Row(
                                    children: [
                                      Icon(Icons.square_foot_rounded,color: Theme.of(context).hintColor,),
                                      SizedBox(width: MediaQuery.of(context).size.width*0.01),
                                      Text(widget.property![0].size.toString() + " sq. ft.",style: TextStyle(color: Theme.of(context).hintColor))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                        Text("Property Details",style: TextStyle(color: Theme.of(context).hintColor,fontSize: MediaQuery.of(context).size.width * 0.06,fontWeight: FontWeight.w700)),
                        SizedBox(height: MediaQuery.of(context).size.height*0.015,),
                        Text(widget.property![0].description,style: TextStyle(color: Theme.of(context).primaryColor,fontSize: MediaQuery.of(context).size.width * 0.03)),
                        SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                        Text("View Photos",style: TextStyle(color: Theme.of(context).hintColor,fontSize: MediaQuery.of(context).size.width * 0.06,fontWeight: FontWeight.w700)),
                        SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                        StaggeredGrid.count(
                          crossAxisCount: 4,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          children: [
                            for(int i=0;i<images.length;i++)...[
                              StaggeredGridTile.count(
                                mainAxisCellCount: ((i+1)%2) == 0 ? 1 : 2,
                                crossAxisCellCount: 2,
                                child: Container(
                                child: FittedBox(fit: BoxFit.fill,child: Image.network(images[i]))
                                ,height: MediaQuery.of(context).size.height*0.15,
                                width: MediaQuery.of(context).size.width *0.35
                                ),
                              ),
                            ]
                          ],
                          ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width *0.5,
                              child: Text(widget.property![0].account,style: TextStyle(color: Theme.of(context).hintColor,fontSize: MediaQuery.of(context).size.width * 0.05,fontWeight: FontWeight.w500))),
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