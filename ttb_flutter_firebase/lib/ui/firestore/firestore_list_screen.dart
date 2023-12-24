import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ttb_flutter_firebase/ui/firestore/firestore_add_data.dart';
import 'package:ttb_flutter_firebase/utils/utilities.dart';

class FirestoreScreen extends StatefulWidget {
  const FirestoreScreen({super.key});

  @override
  State<FirestoreScreen> createState() => _FirestoreScreenState();
}

class _FirestoreScreenState extends State<FirestoreScreen> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FireStore'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance
                  .signOut()
                  .then(
                    (value) => Navigator.pop(context),
                  )
                  .onError(
                    (error, stackTrace) => Utils().toastMessage(
                      error.toString(),
                    ),
                  );
            },
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const AddFirestoreDataScreen();
              },
            ),
          );
        },
        label: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          // 2nd method is by using firebaseAnimation

          Expanded(
              child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Hello'),
              );
            },
          )),
        ],
      ),
    );
  }
}
