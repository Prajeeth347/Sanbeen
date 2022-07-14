import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanbeen_zedital/screens/photos_prop.dart';

class posting_prop extends StatefulWidget {
  const posting_prop({Key? key}) : super(key: key);

  @override
  State<posting_prop> createState() => _posting_propState();
}

class _posting_propState extends State<posting_prop> {
  TextEditingController nameprop_controller = TextEditingController();
  TextEditingController price_controller = TextEditingController();
  TextEditingController address_controller = TextEditingController();
  TextEditingController pincode_controller = TextEditingController();
  TextEditingController area_controller = TextEditingController();
  TextEditingController bedrooms_controller = TextEditingController();
  TextEditingController shower_controller = TextEditingController();
  TextEditingController writesomething_controller = TextEditingController();
  String city = 'City 1';
  var cities = [
    'City 1',
    'City 2',
    'City 3',
    'City 4',
    'City 5',
  ];
  String statee = 'State 1';
  var states = [
    'State 1',
    'State 2',
    'State 3',
    'State 4',
    'State 5',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 8.0, 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Posting your Property',
                style: GoogleFonts.poppins(
                  color: Theme.of(context).primaryColor,
                  fontSize: MediaQuery.of(context).size.height * 0.028,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Text(
                'Add Basic Details',
                style: GoogleFonts.poppins(
                  color: Theme.of(context).primaryColor,
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 16, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name of the property is',
                      style: GoogleFonts.poppins(
                        color: Theme.of(context).primaryColor,
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Theme.of(context).hintColor,
                          ),
                          controller: nameprop_controller,
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Text(
                      'Starting price is',
                      style: GoogleFonts.poppins(
                        color: Theme.of(context).primaryColor,
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Theme.of(context).hintColor,
                          ),
                          controller: price_controller,
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Text(
                      'Add address of the property',
                      style: GoogleFonts.poppins(
                        color: Theme.of(context).primaryColor,
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
                          minLines: 3,
                          maxLines: 10,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Theme.of(context).hintColor,
                          ),
                          controller: address_controller,
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'City',
                              style: GoogleFonts.poppins(
                                color: Theme.of(context).primaryColor,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            DropdownButton(
                              value: city,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: cities.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(
                                    items,
                                    style: GoogleFonts.poppins(
                                      color: Theme.of(context).primaryColor,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  city = newValue!;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'State',
                              style: GoogleFonts.poppins(
                                color: Theme.of(context).primaryColor,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            DropdownButton(
                              value: statee,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: states.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(
                                    items,
                                    style: GoogleFonts.poppins(
                                      color: Theme.of(context).primaryColor,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  statee = newValue!;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pincode',
                              style: GoogleFonts.poppins(
                                color: Theme.of(context).primaryColor,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Theme.of(context).hintColor,
                                  ),
                                  controller: pincode_controller,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Text(
                      'Priority Area',
                      style: GoogleFonts.poppins(
                        color: Theme.of(context).primaryColor,
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Theme.of(context).hintColor,
                          ),
                          controller: area_controller,
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bedrooms',
                              style: GoogleFonts.poppins(
                                color: Theme.of(context).primaryColor,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Theme.of(context).hintColor,
                                  ),
                                  controller: bedrooms_controller,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.1,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Shower',
                              style: GoogleFonts.poppins(
                                color: Theme.of(context).primaryColor,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Theme.of(context).hintColor,
                                  ),
                                  controller: shower_controller,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Text(
                      'Write something about the property',
                      style: GoogleFonts.poppins(
                        color: Theme.of(context).primaryColor,
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
                          minLines: 3,
                          maxLines: 10,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Theme.of(context).hintColor,
                          ),
                          controller: writesomething_controller,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.44,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(
                              color: Theme.of(context).primaryColor)),
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => photos_prop()));
                      },
                      child: Text(
                        "Upload Photos",
                        style: GoogleFonts.poppins(
                          color: Theme.of(context).hintColor,
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          fontWeight: FontWeight.w400,
                        ),
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
