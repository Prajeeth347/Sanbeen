import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<ChangePassword> {
  TextEditingController currcon = TextEditingController();
  TextEditingController newcon = TextEditingController();
  TextEditingController newconfcon = TextEditingController();
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Change Password',
                style: GoogleFonts.poppins(
                  color: Theme.of(context).primaryColor,
                  fontSize: MediaQuery.of(context).size.height * 0.023,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.95,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: Text(
                      'Current password',
                      style: GoogleFonts.poppins(
                        color: Theme.of(context).primaryColor,
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextField(
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.edit,
                            color: Theme.of(context).backgroundColor,
                          ),
                          filled: true,
                          fillColor: Theme.of(context).primaryColor,
                        ),
                        controller: currcon,
                      )),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.95,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: Text(
                      'New password',
                      style: GoogleFonts.poppins(
                        color: Theme.of(context).primaryColor,
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextField(
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.edit,
                            color: Theme.of(context).backgroundColor,
                          ),
                          filled: true,
                          fillColor: Theme.of(context).primaryColor,
                        ),
                        controller: newcon,
                      )),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.95,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: Text(
                      'Confirm new password',
                      style: GoogleFonts.poppins(
                        color: Theme.of(context).primaryColor,
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextField(
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.edit,
                            color: Theme.of(context).backgroundColor,
                          ),
                          filled: true,
                          fillColor: Theme.of(context).primaryColor,
                        ),
                        controller: newconfcon,
                      )),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side:
                            BorderSide(color: Theme.of(context).primaryColor)),
                    color: Theme.of(context).backgroundColor,
                    onPressed: () {},
                    child: Text(
                      "Save",
                      style: GoogleFonts.poppins(
                        color: Theme.of(context).primaryColor,
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: FontWeight.w300,
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
