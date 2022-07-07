import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class photos_prop extends StatefulWidget {
  const photos_prop({Key? key}) : super(key: key);

  @override
  State<photos_prop> createState() => _photos_propState();
}

class _photos_propState extends State<photos_prop> {
  List<File?> image = [];
  final picker = ImagePicker();
  void choose_source() {
    showDialog(
           context: context,
           builder: (BuildContext context) {
                    return SimpleDialog(
              title:const Text('Select the source'),
              children: <Widget>[
                 SimpleDialogOption(
                       onPressed: () { 
                        chooseImage_camera();
                        Navigator.of(context).pop();
                       },
                            child:const Text('Camera'),
                         ),
                  SimpleDialogOption(
                     onPressed: () { 
                      chooseImage_gallery();
                        Navigator.of(context).pop();
                     },
                  child: const Text('Gallery'),
              ),
       ],
  );
       },
  );
  }
  Future<void> chooseImage_camera() async {
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        image.add(File(pickedImage.path));
      });
    }
  }
  Future<void> chooseImage_gallery() async {
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        image.add(File(pickedImage.path));
      });
    }
  }

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
              )),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Upload Property Photos and Videos',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: MediaQuery.of(context).size.width * 0.050),
                ),
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Upload photos and videos of your property either via your desktop device or from your mobile phone.',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: MediaQuery.of(context).size.width * 0.04),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                if(image.length == 0)
                GestureDetector(
                  onTap: () {
                    choose_source();
                  },
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.7,
                      color: Theme.of(context).hintColor,
                      alignment: Alignment.center,
                      child: Container(
                        child: Icon(
                            Icons.add_circle,color: Theme.of(context).backgroundColor,
                            size: MediaQuery.of(context).size.width*0.07,
                            ),
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                
                if(image.length != 0)
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: image.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Image.file(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width * 0.7,
                            image[0]!, fit: BoxFit.cover
                            ),
                            SizedBox(height: 40)
                          ],
                        );
                      },
                    ),
                    if(image.length >0 && image.length <3)
                       ElevatedButton(
                      onPressed: () {
                        choose_source();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor),
                      ),
                      child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(25, 0, 25, 0),
                          child: Text(
                            'Add more',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                color: Theme.of(context).hintColor),
                            textAlign: TextAlign.center,
                          ))),
                    if(image.length != 0)
                       ElevatedButton(
                      onPressed: () {
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor),
                      ),
                      child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(25, 0, 25, 0),
                          child: Text(
                            'Post',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                color: Theme.of(context).hintColor),
                            textAlign: TextAlign.center,
                          )))
              ]),
        ));
  }
}
