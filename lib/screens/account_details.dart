import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountDetails extends StatefulWidget {
  const AccountDetails({Key? key}) : super(key: key);

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  TextEditingController namecontroller = TextEditingController()
    ..text = 'Sakshi Mallick';
  TextEditingController phonecontroller = TextEditingController()
    ..text = 'XXXXXXXXXX';
  TextEditingController addresscontroller = TextEditingController()
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
                  fontSize: MediaQuery.of(context).size.height * 0.025,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.95,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Text(
                        'Name - ',
                        style: GoogleFonts.poppins(
                          color: Theme.of(context).primaryColor,
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
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
                        controller: namecontroller,
                      )),
                ],
              ),
            ),
            //SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.95,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Text(
                        'Phone Number - ',
                        style: GoogleFonts.poppins(
                          color: Theme.of(context).primaryColor,
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
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
                        controller: phonecontroller,
                      )),
                ],
              ),
            ),
            //SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.95,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Text(
                        'Address - ',
                        style: GoogleFonts.poppins(
                          color: Theme.of(context).primaryColor,
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
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
                        controller: addresscontroller,
                      )),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Center(
              child: SizedBox(
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
