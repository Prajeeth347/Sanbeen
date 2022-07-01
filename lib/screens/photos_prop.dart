import 'package:flutter/material.dart';

class photos_prop extends StatefulWidget {
  const photos_prop({Key? key}) : super(key: key);

  @override
  State<photos_prop> createState() => _photos_propState();
}

class _photos_propState extends State<photos_prop> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text('Upload property photos and videos',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: MediaQuery.of(context).size.width*0.045),),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: Theme.of(context).primaryColor,)),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Upload photos and videos of your property either via your desktop device or from your mobile phone.',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: MediaQuery.of(context).size.width*0.045),))
          ],
        ),
      ),
   );
  }
}