import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class PhotosProp extends StatefulWidget {
  const PhotosProp({Key? key}) : super(key: key);

  @override
  State<PhotosProp> createState() => _PhotosPropState();
}

class _PhotosPropState extends State<PhotosProp> {
  List<File?> image = [];
  final picker = ImagePicker();
  void choosesource() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Select the source'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                chooseImagecamera();
                Navigator.of(context).pop();
                // print(image[0].toString());
              },
              child: const Text('Camera'),
            ),
            SimpleDialogOption(
              onPressed: () {
                chooseImagegallery();
                Navigator.of(context).pop();
              },
              child: const Text('Gallery'),
            ),
          ],
        );
      },
    );
  }

  Future<void> chooseImagecamera() async {
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        image.add(File(pickedImage.path));
      });
    }
  }

  Future<void> chooseImagegallery() async {
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
                size: MediaQuery.of(context).size.width * 0.08,
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
                  style: GoogleFonts.poppins(
                    color: Theme.of(context).primaryColor,
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Upload photos and videos of your property either via your desktop device or from your mobile phone.',
                      style: GoogleFonts.poppins(
                        color: Theme.of(context).primaryColor,
                        fontSize: MediaQuery.of(context).size.width * 0.037,
                        fontWeight: FontWeight.w300,
                      ),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                if (image.isEmpty)
                  GestureDetector(
                    onTap: () {
                      choosesource();
                    },
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.7,
                        color: Theme.of(context).hintColor,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.add_circle,
                          color: Theme.of(context).backgroundColor,
                          size: MediaQuery.of(context).size.width * 0.07,
                        )),
                  ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                if (image.isNotEmpty)
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: image.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Image.file(
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width * 0.7,
                              image[0]!,
                              fit: BoxFit.cover),
                          const SizedBox(height: 40)
                        ],
                      );
                    },
                  ),
                if (image.length > 0 && image.length < 3)
                  ElevatedButton(
                      onPressed: () {
                        choosesource();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor),
                      ),
                      child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              25, 0, 25, 0),
                          child: Text(
                            'Add more',
                            style: GoogleFonts.inter(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.035,
                                color: Theme.of(context).hintColor),
                            textAlign: TextAlign.center,
                          ))),
                if (image.isNotEmpty)
                  ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor),
                      ),
                      child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              25, 0, 25, 0),
                          child: Text(
                            'Post',
                            style: GoogleFonts.inter(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                color: Theme.of(context).hintColor),
                            textAlign: TextAlign.center,
                          )))
              ]),
        ));
  }
}
