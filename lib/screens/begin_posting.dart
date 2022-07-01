import 'package:flutter/material.dart';
import 'package:sanbeen_zedital/screens/posting_property.dart';

class begin_posting extends StatefulWidget {
  const begin_posting({Key? key}) : super(key: key);

  @override
  State<begin_posting> createState() => _begin_postingState();
}

class _begin_postingState extends State<begin_posting> {
  @override
  String _lookingfor = 'Apartment';
  String _sellingtype = "Sell";
  bool pressAttention = true;
  bool press = false;
  bool secpressAttention = true;
  bool secpress = false;
  bool secpress1 = false;
  bool secpress2 = false;
  TextEditingController mobile_controller = TextEditingController();  
   List<bool> isSelected = [true, false, false];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text('Begin Posting your Property',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: MediaQuery.of(context).size.width*0.05),),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: Theme.of(context).primaryColor,)),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0,8.0,8.0,8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Add Basic Details',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: MediaQuery.of(context).size.width*0.045),),
              SizedBox(height: MediaQuery.of(context).size.height*0.02),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0,8.0,0,0),
                child: Text('You are looking to',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: MediaQuery.of(context).size.width*0.045),),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02),
              Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.07,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.2,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(color: Theme.of(context).primaryColor)),
                    color: pressAttention
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).scaffoldBackgroundColor,
                    onPressed: () => setState(() {
                          if(_sellingtype != 'Sell'){
                          press = !press;
                          pressAttention = !pressAttention;
                          _sellingtype = "Sell";
                          }
                        }),
                    child: Text(
                      "Sell",
                      style: TextStyle(
                          color: pressAttention ? Theme.of(context).hintColor : Theme.of(context).backgroundColor,
                          fontWeight: FontWeight.w400,
                          fontSize: MediaQuery.of(context).size.height * 0.02),
                    )),
              ),
              SizedBox(width : MediaQuery.of(context).size.width*0.03),
              Container(
                width: MediaQuery.of(context).size.width * 0.2,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(color: Theme.of(context).primaryColor)),
                    color: press
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).scaffoldBackgroundColor,
                    onPressed: () => setState(() {
                          if(_sellingtype != 'Rent'){
                          press = !press;
                          pressAttention = !pressAttention;
                          _sellingtype = "Rent";
                          }
                        }),
                    child: Text(
                      "Rent",
                      style: TextStyle(
                          color: press ? Theme.of(context).hintColor : Theme.of(context).backgroundColor,
                          fontWeight: FontWeight.w400,
                          fontSize: MediaQuery.of(context).size.height * 0.02),
                    )),
              ),
            ],
          ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0,8.0,0,0),
                child: Text('You are looking to',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: MediaQuery.of(context).size.width*0.045),),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02),
              Row(
                children: [
                  SizedBox(
                width: MediaQuery.of(context).size.width * 0.07,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(color: Theme.of(context).primaryColor)),
                    color: secpressAttention
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).scaffoldBackgroundColor,
                    onPressed: () => setState(() {
                          if(_sellingtype != 'Apartment'){
                          secpress = false;
                          secpressAttention = true;
                          secpress1 = false;
                          secpress2 = false;
                          _lookingfor = "Apartment";
                          }
                        }),
                    child: Text(
                      "Apartment",
                      style: TextStyle(
                          color: secpressAttention ? Theme.of(context).hintColor : Theme.of(context).backgroundColor,
                          fontWeight: FontWeight.w400,
                          fontSize: MediaQuery.of(context).size.height * 0.02),
                    )),
              ),
              SizedBox(width : MediaQuery.of(context).size.width*0.03),
              Container(
                width: MediaQuery.of(context).size.width * 0.52,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(color: Theme.of(context).primaryColor)),
                    color: secpress
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).scaffoldBackgroundColor,
                    onPressed: () => setState(() {
                          if(_sellingtype != 'independent house'){
                          secpress = true;
                          secpressAttention = false;
                          secpress1 = false;
                          secpress2 = false;
                          _lookingfor = "independent house";
                          }
                        }),
                    child: Text(
                      "Independent house/Villa",
                      style: TextStyle(
                          color: secpress ? Theme.of(context).hintColor : Theme.of(context).backgroundColor,
                          fontWeight: FontWeight.w400,
                          fontSize: MediaQuery.of(context).size.height * 0.02),
                    )),
              ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                width: MediaQuery.of(context).size.width * 0.07,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.55,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(color: Theme.of(context).primaryColor)),
                    color: secpress2
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).scaffoldBackgroundColor,
                    onPressed: () => setState(() {
                          if(_sellingtype != 'Independent/builder'){
                          secpress = false;
                          secpressAttention = false;
                          secpress1 = false;
                          secpress2 = true;
                          _lookingfor = "Independent/builder";
                          }
                        }),
                    child: Text(
                      "Indepndent/Builder floor",
                      style: TextStyle(
                          color: secpress2 ? Theme.of(context).hintColor : Theme.of(context).backgroundColor,
                          fontWeight: FontWeight.w400,
                          fontSize: MediaQuery.of(context).size.height * 0.02),
                    )),
              ),
              SizedBox(width : MediaQuery.of(context).size.width*0.03),
              Container(
                width: MediaQuery.of(context).size.width * 0.18,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(color: Theme.of(context).primaryColor)),
                    color: secpress1
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).scaffoldBackgroundColor,
                    onPressed: () => setState(() {
                          if(_sellingtype != 'Land'){
                          secpress = false;
                          secpressAttention = false;
                          secpress1 = true;
                          secpress2 = false;
                          _lookingfor = "Land";
                          }
                        }),
                    child: Text(
                      "Land",
                      style: TextStyle(
                          color: secpress1 ? Theme.of(context).hintColor : Theme.of(context).backgroundColor,
                          fontWeight: FontWeight.w400,
                          fontSize: MediaQuery.of(context).size.height * 0.02),
                    )),
              ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0,8.0,0,0),
                child: Text('Your contact details for the buyer to reach you',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: MediaQuery.of(context).size.width*0.040),),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02),
              TextField(
                style: TextStyle(color: Theme.of(context).hintColor),
                keyboardType: TextInputType.number,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Theme.of(context).hintColor),
                  hintText: 'Phone number',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Theme.of(context).hintColor), //<-- SEE HERE
                  ),
                ),
                controller: mobile_controller,
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.04),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(color: Theme.of(context).primaryColor)),
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => posting_prop()));
                      },
                      child: Text(
                        "Begin to Post your Property",
                        style: TextStyle(
                            color: Theme.of(context).hintColor,
                            fontWeight: FontWeight.w400,
                            fontSize: MediaQuery.of(context).size.height * 0.02),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}