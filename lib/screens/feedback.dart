import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:sanbeen_zedital/main.dart';

class feedback extends StatefulWidget {
  const feedback({Key? key}) : super(key: key);

  @override
  State<feedback> createState() => _feedbackState();
}

class _feedbackState extends State<feedback> {
  TextEditingController feedback_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController name_controller = TextEditingController();
  TextEditingController mobile_controller = TextEditingController();
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
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.fromLTRB(20,8,8,8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Feedback',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: MediaQuery.of(context).size.width*0.06),),
              SizedBox(height: MediaQuery.of(context).size.height*0.02),
                TextField(
                  style: TextStyle(color: Theme.of(context).primaryColor),
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                    labelText: 'Write your feedback',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Theme.of(context).primaryColor), //<-- SEE HERE
                    ),
                  ),
                  controller: feedback_controller,
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.02),
                TextField(
                  style: TextStyle(color: Theme.of(context).primaryColor),
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                    labelText: 'Email',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Theme.of(context).primaryColor), //<-- SEE HERE
                    ),
                  ),
                  controller: email_controller,
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.02),
                TextField(
                  style: TextStyle(color: Theme.of(context).primaryColor),
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                    labelText: 'Name',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Theme.of(context).primaryColor), //<-- SEE HERE
                    ),
                  ),
                  controller: name_controller,
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.02),
                TextField(
                  style: TextStyle(color: Theme.of(context).primaryColor),
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                    labelText: 'Mobile no.',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Theme.of(context).primaryColor), //<-- SEE HERE
                    ),
                  ),
                  controller: mobile_controller,
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.02),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(color: Theme.of(context).primaryColor)),
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          showAlertDialog(context);
                        },
                        child: Text(
                          "Submit feedback",
                          style: TextStyle(
                              color: Theme.of(context).hintColor,
                              fontWeight: FontWeight.w400,
                              fontSize: MediaQuery.of(context).size.height * 0.02),
                        )),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.05),
                Center(
                  child: Text('or you can call the tollfree number',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: MediaQuery.of(context).size.width*0.05),),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.03),
                TextButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.support_agent,color: Theme.of(context).primaryColor,size: MediaQuery.of(context).size.width*0.09,),
                      SizedBox(width: MediaQuery.of(context).size.width*0.015,),
                      Text('1800-XXXX-YYYY',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: MediaQuery.of(context).size.width*0.08),)
                    ],
                  ),
                  onPressed: (){
                    FlutterPhoneDirectCaller.callNumber('7989772884');
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
  
showAlertDialog(BuildContext context) {  
  Widget okButton = FlatButton(  
    child: Text("OK",style: TextStyle(color: Theme.of(context).primaryColor)),  
    onPressed: () {  
      feedback_controller.clear();
      email_controller.clear();
      name_controller.clear();
      mobile_controller.clear();
      Navigator.of(context).pop();  
    },  
  );  
  AlertDialog alert = AlertDialog( 
    backgroundColor: Theme.of(context).backgroundColor, 
    title: Text("Success",style: TextStyle(color: Theme.of(context).primaryColor),),  
    content: Text("Feddback sent successfully",style: TextStyle(color: Theme.of(context).primaryColor)),  
    actions: [  
      okButton,  
    ],  
  );  
  showDialog(  
    context: context,  
    builder: (BuildContext context) {  
      return alert;  
    },  
  );  
  }
}