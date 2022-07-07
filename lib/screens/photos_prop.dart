import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class photos_prop extends StatefulWidget {
  const photos_prop({Key? key}) : super(key: key);

  @override
  State<photos_prop> createState() => _photos_propState();
}

class _photos_propState extends State<photos_prop> {
  File? image;
  final picker = ImagePicker();

  Future<void> chooseImage() async {
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
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
                //backgroundColor: Theme.of(context).backgroundColor,
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.4,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: IconButton(
                        onPressed: () => chooseImage(),
                        icon: Icon(Icons.add_a_photo))),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.35,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: image != null
                        ? Image.file(image!, fit: BoxFit.cover)
                        : const Text('image please')),
              ]),
        ));
  }
}
