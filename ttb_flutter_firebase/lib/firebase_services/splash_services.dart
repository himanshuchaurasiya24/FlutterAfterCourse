import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ttb_flutter_firebase/ui/auth/login_screen.dart';
import 'package:ttb_flutter_firebase/ui/firestore/firestore_list_screen.dart';
import 'package:ttb_flutter_firebase/ui/posts/post_screen.dart';
import 'package:ttb_flutter_firebase/ui/upload_images.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      Timer(const Duration(seconds: 3), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              // return PostScreen(
              //   email: user.email.toString(),
              // );
              // return const FirestoreScreen();
              return const UploadImage();
            },
          ),
        );
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const LoginScreen();
              // return const UploadImage();
            },
          ),
        );
      });
    }
  }
}
