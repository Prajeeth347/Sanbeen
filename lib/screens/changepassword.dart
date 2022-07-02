import 'package:flutter/material.dart';

class change_password extends StatefulWidget {
  const change_password({Key? key}) : super(key: key);

  @override
  State<change_password> createState() => _account_detailsState();
}

class _account_detailsState extends State<change_password> {
  TextEditingController currcon = TextEditingController();
  TextEditingController newcon = TextEditingController();
  TextEditingController newconfcon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text('Change Password',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: MediaQuery.of(context).size.width*0.05),),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: Theme.of(context).primaryColor,)),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                        Text('Current password',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: MediaQuery.of(context).size.width*0.05),),
                        SizedBox(width: MediaQuery.of(context).size.width*0.04),
                        SizedBox(
                        width: MediaQuery.of(context).size.width*0.48,
                        child: 
                                TextField(
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            suffixIcon:Icon(Icons.edit,color: Theme.of(context).backgroundColor,),
                                            filled: true,
                                            fillColor: Theme.of(context).primaryColor,
                                          ),
                                          controller: currcon,
                                        )),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02),
            Row(
              children: [
                        Text('New password',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: MediaQuery.of(context).size.width*0.05),),
                        SizedBox(width: MediaQuery.of(context).size.width*0.1),
                        SizedBox(
                        width: MediaQuery.of(context).size.width*0.48,
                        child: 
                                TextField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            suffixIcon:Icon(Icons.edit,color: Theme.of(context).backgroundColor,),
                                            filled: true,
                                            fillColor: Theme.of(context).primaryColor,
                                          ),
                                          controller: newcon,
                                        )),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02),
            Row(
              children: [
                        Container(width: MediaQuery.of(context).size.width * 0.36,child: Flexible(child: Text('Confirm new password',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: MediaQuery.of(context).size.width*0.05),))),
                        SizedBox(width: MediaQuery.of(context).size.width*0.07),
                        SizedBox(
                        width: MediaQuery.of(context).size.width*0.48,
                        child: 
                                TextField(
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            suffixIcon: Icon(Icons.edit,color: Theme.of(context).backgroundColor,),
                                            filled: true,
                                            fillColor: Theme.of(context).primaryColor,
                                          ),
                                          controller: newconfcon,
                                        )),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02),
            Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(color: Theme.of(context).primaryColor)),
                        color: Theme.of(context).backgroundColor,
                        onPressed: () {
                         
                        },
                        child: Text(
                          "Save",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: MediaQuery.of(context).size.height * 0.02),
                        )),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}