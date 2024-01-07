import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ttb_flutter_firebase/utils/utilities.dart';
import 'package:ttb_flutter_firebase/widgets/round_button.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? _image;
  final picker = ImagePicker();
  firebase_storage.FirebaseStorage storage = FirebaseStorage.instance;
  DatabaseReference databaseRef = FirebaseDatabase.instance.ref('Posts');
  bool isLoading = false;
  Future getImageFromGallery() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected');
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload image to firestore'),
      ),
      body: Column(
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                getImageFromGallery();
              },
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.red),
                ),
                // child: _image == null
                child: const Icon(Icons.browse_gallery),
                //     ? const Icon(Icons.browse_gallery)
                //     : Image.file(_image!.absolute),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          RoundButton(
              title: 'Upload Image',
              isLoading: isLoading,
              onTap: () async {
                setState(() {
                  isLoading = true;
                });
                firebase_storage.Reference ref = firebase_storage
                    .FirebaseStorage.instance
                    .ref('/foldername/' + '1224');
                firebase_storage.UploadTask uploadTask =
                    ref.putFile(_image!.absolute);
                await Future.value(uploadTask).then((value) async {
                  var newUrl = await ref.getDownloadURL();
                  databaseRef.child('1').set({
                    'id': '1212',
                    'title': newUrl.toString(),
                  }).then((value) {
                    setState(() {
                      isLoading = false;
                    });

                    Utils().toastMessage('Uploaded');
                  }).onError((error, stackTrace) {
                    Utils().toastMessage('Some error occurred');
                    setState(() {
                      isLoading = false;
                    });
                  });
                }).onError((error, stackTrace) {
                  Utils().toastMessage(error.toString());
                });
              })
        ],
      ),
    );
  }
}
