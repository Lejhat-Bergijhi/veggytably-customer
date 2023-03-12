import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:veggytably_driver/views/landing_page.dart';

class UploadPic extends StatefulWidget {
  const UploadPic({super.key});

  @override
  State<UploadPic> createState() => _UploadPicState();
}

class _UploadPicState extends State<UploadPic> {
  late XFile _imageFile;
  final ImagePicker picker = ImagePicker();

  void takePhoto(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile == null) return;
    setState(() {
      _imageFile = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        alignment: Alignment.centerLeft,
        // padding: EdgeInsets.symmetric(horizontal: 40),
        child: Text(
          "PROFILE IMAGE",
          style: TextStyle(
            color: Color(0xff9f9f9f),
            fontSize: 10,
            fontFamily: "Rubik",
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.left,
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [],
        ),
      ),
      SizedBox(height: 16),
      Container(
        width: MediaQuery.of(context).size.width - 40 * 2,
        child: DottedBorder(
          dashPattern: [8, 8],
          radius: Radius.circular(8),
          child: Container(
              alignment: Alignment.center,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    // Profile Image preview
                    Image.asset(
                      "images/img_dummy.png",
                      width: 130,
                      height: 104,
                    ),
                    SizedBox(height: 19),
                    Text(
                      "Upload from your device",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 19),
                    // Camera Button
                    Container(
                      width:
                          MediaQuery.of(context).size.width - 40 * 2 - 23 * 2,
                      height: 36,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xfff6f7fb),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                          ),
                        ),
                        onPressed: () {
                          takePhoto(ImageSource.camera);
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Spacer(),
                            Container(
                                width: 20,
                                height: 18,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image.asset(
                                  "images/camera.png",
                                  fit: BoxFit.none,
                                )),
                            SizedBox(width: 10),
                            Text(
                              "Camera",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 3),
                    Container(
                        width:
                            MediaQuery.of(context).size.width - 40 * 2 - 23 * 2,
                        height: 36,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xfff6f7fb),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ),
                            ),
                          ),
                          onPressed: () {
                            takePhoto(ImageSource.gallery);
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Spacer(),
                              Container(
                                  width: 22,
                                  height: 15,
                                  child: Image.asset(
                                    "images/gallery.png",
                                    fit: BoxFit.none,)
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Gallery",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                              Spacer(),
                              
                            ],
                          ),
                        )),
                    SizedBox(height: 24),
                  ])),
        ),
      ),
      SizedBox(
        height: 16,
      ),
      // Login button
      
      // Text: Sign Up
    ]);
  }
}
