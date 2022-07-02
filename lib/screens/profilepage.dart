import 'package:flutter/material.dart';
import 'package:sanbeen_zedital/models/profile_model.dart';
import 'package:sanbeen_zedital/screens/account_details.dart';
import 'package:sanbeen_zedital/screens/feedback.dart';
import 'package:sanbeen_zedital/services/profile_helper.dart';
class profile_page extends StatefulWidget {
  const profile_page({Key? key}) : super(key: key);

  @override
  State<profile_page> createState() => _profile_pageState();
}

class _profile_pageState extends State<profile_page> {
  var name = "";
  var email = "sakshimallick001@gmail.com";
  var phone = "";
  List<Profiles>? profile;
  var is_loaded = false;
  @override
  void initState() {
    super.initState();
    getProfileData();
  }
  getProfileData() async{
    profile = await profile_services().getprofiles();
    if (profile != null) {
      setState(() {
        is_loaded = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text('My Profile',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: MediaQuery.of(context).size.width*0.05),),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: Theme.of(context).primaryColor,)),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
                radius: MediaQuery.of(context).size.width*0.15,
                backgroundImage:
                    NetworkImage(profile == null ? 'https://via.placeholder.com/150' : profile![0].img ?? 'https://via.placeholder.com/150'),
                backgroundColor: Colors.transparent,
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02),
              Text(profile == null ? 'Name' :profile![0].name,style: TextStyle(color: Theme.of(context).primaryColor,fontSize: MediaQuery.of(context).size.width*0.06,fontWeight: FontWeight.w600),),
              SizedBox(height: MediaQuery.of(context).size.height*0.02),
              Text(email,style: TextStyle(color: Theme.of(context).primaryColor,fontSize: MediaQuery.of(context).size.width*0.045)),
              SizedBox(height: MediaQuery.of(context).size.height*0.02),
              Text(profile == null ? 'Number' :profile![0].number,style: TextStyle(color: Theme.of(context).primaryColor,fontSize: MediaQuery.of(context).size.width*0.045),),
              SizedBox(height: MediaQuery.of(context).size.height*0.02),
              Divider(
                  color: Theme.of(context).primaryColor,
                  thickness: 1,
                ),  
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => account_details()));
                }, child: 
                Row(
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.person, color: Theme.of(context).primaryColor,),
                      backgroundColor: Theme.of(context).backgroundColor,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.03),
                        Text('Account Details',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: MediaQuery.of(context).size.width*0.05),),
                        SizedBox(width: MediaQuery.of(context).size.width*0.37),
                        Icon(Icons.arrow_forward_ios,color: Theme.of(context).primaryColor,)
                      ],
                )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(onPressed: () {
                  
                }, child: 
                Row(
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.lock, color: Theme.of(context).primaryColor,),
                      backgroundColor: Theme.of(context).backgroundColor,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.03),
                        Text('Change Password',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: MediaQuery.of(context).size.width*0.05),),
                        SizedBox(width: MediaQuery.of(context).size.width*0.32),
                        Icon(Icons.arrow_forward_ios,color: Theme.of(context).primaryColor,)
                      ],
                )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => feedback()));
                }, child: 
                Row(
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.feedback_sharp, color: Theme.of(context).primaryColor,),
                      backgroundColor: Theme.of(context).backgroundColor,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.03),
                        Text('Feedback',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: MediaQuery.of(context).size.width*0.05),),
                        SizedBox(width: MediaQuery.of(context).size.width*0.5),
                        Icon(Icons.arrow_forward_ios,color: Theme.of(context).primaryColor,)
                      ],
                )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(onPressed: () {
                  
                }, child: 
                Row(
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.logout_rounded, color: Theme.of(context).primaryColor,),
                      backgroundColor: Theme.of(context).backgroundColor,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.03),
                        Text('Logout',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: MediaQuery.of(context).size.width*0.05),),
                        ],
                )
                ),
              ),
          ],
        ),
      ),
    );
  }
}