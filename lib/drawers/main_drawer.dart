import 'package:flutter/material.dart';
import 'package:sanbeen_zedital/screens/aboutuspage.dart';
import 'package:sanbeen_zedital/screens/begin_posting.dart';
import 'package:sanbeen_zedital/screens/rentals_page.dart';

class main_drawer extends StatelessWidget {
  main_drawer({
    required this.user_image
  });
  String user_image;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // DrawerHeader(
          //   decoration: BoxDecoration(
          //     // color: Theme.of(context).primaryColor,
          //     image: DecorationImage(
          //       fit: BoxFit.cover,
          //       image: NetworkImage(
          //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuw2csIYaS7KuekqlPBYserItx4Mfv-T6tuQ&usqp=CAU"),
          //     ),
          //   ),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       SizedBox(height: MediaQuery.of(context).size.height*0.075),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //         CircleAvatar(
          //         backgroundImage: NetworkImage(user_image),
          //         minRadius: MediaQuery.of(context).size.width * 0.1,
          //       ),
          //       Container()
          //         ],
          //       )
                
          //     ],
          //   )
          // ),
          Stack(
            children:[
              Image.network(
                fit: BoxFit.cover,
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.19,
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuw2csIYaS7KuekqlPBYserItx4Mfv-T6tuQ&usqp=CAU"),
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*0.12),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  CircleAvatar(
                  backgroundImage: NetworkImage(user_image),
                  minRadius: MediaQuery.of(context).size.width * 0.1,
                ),
                Container()
                  ],
                ),)
              ]
              ),
              ]
              ),
          ListTile(
            iconColor: Theme.of(context).backgroundColor,
            textColor: Theme.of(context).backgroundColor,
            leading: Icon(
              Icons.sell_sharp,
            ),
            title: const Text('Post your property'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => begin_posting(),));
            },
          ),
          ListTile(
            iconColor: Theme.of(context).backgroundColor,
            textColor: Theme.of(context).backgroundColor,
            leading: Icon(
              Icons.house_rounded,
            ),
            title: const Text('Find houses or property'),
            onTap: () {
              Navigator.pop(context);
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => begin_posting(),));
            },
          ),
          ListTile(
            iconColor: Theme.of(context).backgroundColor,
            textColor: Theme.of(context).backgroundColor,
            leading: Icon(
              Icons.house_rounded,
            ),
            title: const Text('Find rental apartments'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => rentals_page(),));
            },
          ),
          ListTile(
            iconColor: Theme.of(context).backgroundColor,
            textColor: Theme.of(context).backgroundColor,
            leading: Icon(
              Icons.notifications,
            ),
            title: const Text('Notifications'),
            onTap: () {
              Navigator.pop(context);
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => begin_posting(),));
            },
          ),
          ListTile(
            iconColor: Theme.of(context).backgroundColor,
            textColor: Theme.of(context).backgroundColor,
            leading: Icon(
              Icons.info_rounded,
            ),
            title: const Text('About us'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => aboutus(),));
            },
          ),
          ListTile(
            iconColor: Theme.of(context).backgroundColor,
            textColor: Theme.of(context).backgroundColor,
            leading: Icon(
              Icons.logout_sharp,
            ),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pop(context);
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => begin_posting(),));
            },
          ),
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
} 