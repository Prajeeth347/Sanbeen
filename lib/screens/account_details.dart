import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class account_details extends StatefulWidget {
  const account_details({Key? key}) : super(key: key);

  @override
  State<account_details> createState() => _account_detailsState();
}

class _account_detailsState extends State<account_details> {
  TextEditingController name_controller = TextEditingController()
    ..text = 'Sakshi Mallick';
  TextEditingController phone_controller = TextEditingController()
    ..text = 'XXXXXXXXXX';
  TextEditingController address_controller = TextEditingController()
    ..text = 'XXXXX';
  bool iseditablename = false;
  bool iseditablephone = false;
  bool iseditableaddress = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Account Details',
                style: GoogleFonts.poppins(
                  color: Theme.of(context).primaryColor,
                  fontSize: MediaQuery.of(context).size.height * 0.024,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Row(
              children: [
                Text(
                  'Name - ',
                  style: GoogleFonts.poppins(
                    color: Theme.of(context).primaryColor,
                    fontSize: MediaQuery.of(context).size.height * 0.019,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      enabled: iseditablename,
                      decoration: InputDecoration(
                        suffixIcon: iseditablename == false
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    iseditablename = true;
                                  });
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: Theme.of(context).backgroundColor,
                                ))
                            : null,
                        filled: true,
                        fillColor: Theme.of(context).primaryColor,
                      ),
                      controller: name_controller,
                    )),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Row(
              children: [
                Text(
                  'Phone Number - ',
                  style: GoogleFonts.poppins(
                    color: Theme.of(context).primaryColor,
                    fontSize: MediaQuery.of(context).size.height * 0.019,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.51,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      enabled: iseditablephone,
                      decoration: InputDecoration(
                        suffixIcon: iseditablephone == false
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    iseditablephone = true;
                                  });
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: Theme.of(context).backgroundColor,
                                ))
                            : null,
                        filled: true,
                        fillColor: Theme.of(context).primaryColor,
                      ),
                      controller: phone_controller,
                    )),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Row(
              children: [
                Text(
                  'Address - ',
                  style: GoogleFonts.poppins(
                    color: Theme.of(context).primaryColor,
                    fontSize: MediaQuery.of(context).size.height * 0.019,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      enabled: iseditableaddress,
                      decoration: InputDecoration(
                        suffixIcon: iseditablename == false
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    iseditableaddress = false;
                                  });
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: Theme.of(context).backgroundColor,
                                ))
                            : null,
                        filled: true,
                        fillColor: Theme.of(context).primaryColor,
                      ),
                      controller: address_controller,
                    )),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side:
                            BorderSide(color: Theme.of(context).primaryColor)),
                    color: Theme.of(context).backgroundColor,
                    onPressed: () {
                      setState(() {
                        iseditablename = false;
                        iseditablephone = false;
                        iseditableaddress = false;
                      });
                    },
                    child: Text(
                      "SAVE",
                      style: GoogleFonts.poppins(
                        color: Theme.of(context).primaryColor,
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: FontWeight.w400,
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
