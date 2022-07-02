import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:sanbeen_zedital/models/properties_model(20).dart';
import 'package:sanbeen_zedital/services/properties_20_helper.dart';

class properties_20 extends StatefulWidget {
  const properties_20({Key? key}) : super(key: key);

  @override
  State<properties_20> createState() => _propertiesState();
}

class _propertiesState extends State<properties_20> {
  List<Properties>? property;
  var _prop_20_loaded = false;
  @override
  void initState() {
    super.initState();
    getProfileData();
  }
  getProfileData() async{
    property = await property_services().getprofiles();
    if (property != null) {
      setState(() {
        _prop_20_loaded = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: Theme.of(context).primaryColor,)),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _prop_20_loaded == false ? Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,)):
       ListView.builder(
              itemCount: property?.length,
              itemBuilder: (context, index) {
              return properties_20_card(name: property![index].name,bedrooms: property![index].bedrooms,bath: property![index].baths,sft: property![index].sft,cost: property![index].price,dealer:property![index].dealer,number: property![index].contact, img:property![index].img,);
              // return properties_20_card();
            })
      ,
    );
  }
}

class properties_20_card extends StatelessWidget {
  properties_20_card({
    required this.name,
    required this.bedrooms,
    required this.bath,
    required this.sft,
    required this.cost,
    required this.dealer,
    required this.number,
    required this.img,
  });
  String name;
  String img;
  int bedrooms;
  int bath;
  int sft;
  String cost; 
  String dealer;
  String number;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.97,
      height: MediaQuery.of(context).size.height*0.4,
      child: Stack(
        children: <Widget>[
          Image.network(img,height: MediaQuery.of(context).size.height*0.4,width: MediaQuery.of(context).size.width*0.97),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,0,8,8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                height: MediaQuery.of(context).size.height*0.14,
                ),
                Text(name,style: TextStyle(color: Theme.of(context).hintColor ,fontSize: MediaQuery.of(context).size.width*0.05,fontWeight: FontWeight.w900),),
                SizedBox(height :MediaQuery.of(context).size.height*0.02),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.9,
                    color: Theme.of(context).backgroundColor,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20,8,8,8),
                      child: Column(
                        children: [
                          Wrap(
                            textDirection: TextDirection.ltr,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Row(
                                  children: [
                                    Icon(Icons.bed,color: Theme.of(context).hintColor,),
                                    SizedBox(width: MediaQuery.of(context).size.width*0.01),
                                    Text(bedrooms.toString() + " Bedrooms",style: TextStyle(color: Theme.of(context).hintColor),)
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Row(
                                  children: [
                                    Icon(Icons.bathtub, color: Theme.of(context).hintColor,),
                                    SizedBox(width: MediaQuery.of(context).size.width*0.01),
                                    Text(bath.toString() + " Baths",style: TextStyle(color: Theme.of(context).hintColor,fontSize: MediaQuery.of(context).size.width*0.04),)
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height*0.015,
                                width: MediaQuery.of(context).size.width * 0.9,
                                ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Row(
                                  children: [
                                    Icon(Icons.square_foot_rounded,color: Theme.of(context).hintColor,),
                                    SizedBox(width: MediaQuery.of(context).size.width*0.01),
                                    Text(sft.toString() + " sq. ft.",style: TextStyle(color: Theme.of(context).hintColor))
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Row(
                                  children: [
                                    Icon(Icons.bed,color: Theme.of(context).hintColor,),
                                    SizedBox(width: MediaQuery.of(context).size.width*0.01),
                                    Text(cost ,style: TextStyle(color: Theme.of(context).hintColor),)
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.015,),
                          Divider(
                            color: Theme.of(context).primaryColor,
                            thickness: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,0,15,0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(dealer,style: TextStyle(color: Colors.white),),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {}, icon: Image.network('https://cdn-icons-png.flaticon.com/512/124/124034.png?w=740&t=st=1656751163~exp=1656751763~hmac=3e5cd586eb711d53069f6ec6c5f9fdbd67c451cca7915d8684aae3d1a53cee94')),
                                    IconButton(
                                      color: Theme.of(context).hintColor,
                                      onPressed: () {
                                        FlutterPhoneDirectCaller.callNumber(number);
                                    }, icon: Icon(Icons.phone))
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
    );
  }
}