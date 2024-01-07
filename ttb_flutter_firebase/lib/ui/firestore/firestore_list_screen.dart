import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ttb_flutter_firebase/ui/firestore/firestore_add_data.dart';
import 'package:ttb_flutter_firebase/ui/firestore/update_screen_firestore.dart';
import 'package:ttb_flutter_firebase/utils/utilities.dart';

class FirestoreScreen extends StatefulWidget {
  const FirestoreScreen({super.key});

  @override
  State<FirestoreScreen> createState() => _FirestoreScreenState();
}

class _FirestoreScreenState extends State<FirestoreScreen> {
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance.collection('Posts').snapshots();
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

          const SizedBox(),
          StreamBuilder<QuerySnapshot>(
            stream: fireStore,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Some error occurred'),
                );
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onLongPress: () {
                        FirebaseFirestore.instance
                            .collection('Posts')
                            .doc(snapshot.data!.docs[index]['id'])
                            .delete();
                      },
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return UpdateFirestorePostScreen(
                                  id: snapshot.data!.docs[index]['id'],
                                  title: snapshot.data!.docs[index]['title']
                                      .toString());
                            },
                          ),
                        );
                      },
                      child: Card(
                        elevation: 2,
                        child: ListTile(
                          title: Text(
                            snapshot.data!.docs[index]['id'].toString(),
                          ),
                          subtitle: Text(
                            snapshot.data!.docs[index]['title'].toString(),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
