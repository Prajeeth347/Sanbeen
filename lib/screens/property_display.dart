import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'package:sanbeen_zedital/models/properties_model(20).dart';
import 'package:sanbeen_zedital/services/property_single_helper.dart';

class property_display extends StatefulWidget {
  property_display({
    required this.id,
  });
  String id;
  @override
  State<property_display> createState() => _property_displayState();
}

class _property_displayState extends State<property_display> {
  List<Properties>? property;
  var _prop_20_loaded = false;
  final _controller = ScrollController();
  @override
  void initState() {
    super.initState();
    getProfileData();
  }
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
    return Scaffold(
      appBar :AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
          )),
      backgroundColor: Theme.of(context).backgroundColor,
          body: property != null ?property_single_body(property: property) : LinearProgressIndicator(color: Theme.of(context).primaryColor,),
    );
  }
}

class property_single_body extends StatelessWidget {
   property_single_body({
    Key? key,
    required this.property,
  }) : super(key: key);

  final List<Properties>? property;
  @override
  Widget build(BuildContext context) {
    var indiaFormat = NumberFormat.compactSimpleCurrency(locale: 'en_IN');
    List aminities = ["Swimming Pool","Gym Facilities","Parking"];
    List images = property![0].images;
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Container(
          child: FittedBox(fit: BoxFit.fill,child: Image.network(property![0].images[0]))
          ,height: MediaQuery.of(context).size.height*0.29,
          width: MediaQuery.of(context).size.width
          ),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: 
                [SizedBox(height: MediaQuery.of(context).size.height*0.22,),
                  Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,0,8,0),
            child: IconButton(
              onPressed: () {
              },
              icon: Icon(Icons.favorite_outline,size: MediaQuery.of(context).size.width*0.08,)),
          ),
        ),
                ]),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).backgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 16, 8, 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(property![0].name,style: TextStyle(color: Theme.of(context).hintColor,fontSize: MediaQuery.of(context).size.width * 0.06,fontWeight: FontWeight.w700)),
                        SizedBox(height: MediaQuery.of(context).size.height *0.01,),
                        Text(indiaFormat.format(property![0].price),style: TextStyle(color: Theme.of(context).hintColor,fontSize: MediaQuery.of(context).size.width * 0.055,fontWeight: FontWeight.w500)),
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
                                      Text(property![0].bedRooms.toString() + " Bedrooms",style: TextStyle(color: Theme.of(context).hintColor),)
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.25,
                                  child: Row(
                                    children: [
                                      Icon(Icons.bathtub, color: Theme.of(context).hintColor,),
                                      SizedBox(width: MediaQuery.of(context).size.width*0.01),
                                      Text(property![0].bathRooms.toString() + " Baths",style: TextStyle(color: Theme.of(context).hintColor,fontSize: MediaQuery.of(context).size.width*0.04),)
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.32,
                                  child: Row(
                                    children: [
                                      Icon(Icons.square_foot_rounded,color: Theme.of(context).hintColor,),
                                      SizedBox(width: MediaQuery.of(context).size.width*0.01),
                                      Text(property![0].size.toString() + " sq. ft.",style: TextStyle(color: Theme.of(context).hintColor))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                        Text("Property Details",style: TextStyle(color: Theme.of(context).hintColor,fontSize: MediaQuery.of(context).size.width * 0.06,fontWeight: FontWeight.w700)),
                        SizedBox(height: MediaQuery.of(context).size.height*0.015,),
                        Text(property![0].description,style: TextStyle(color: Theme.of(context).primaryColor,fontSize: MediaQuery.of(context).size.width * 0.03)),
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
                              child: Text(property![0].account,style: TextStyle(color: Theme.of(context).hintColor,fontSize: MediaQuery.of(context).size.width * 0.05,fontWeight: FontWeight.w500))),
                          ],
                        ),
                        ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}