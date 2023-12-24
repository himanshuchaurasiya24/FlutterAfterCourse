import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ttb_flutter_firebase/utils/utilities.dart';
import 'package:ttb_flutter_firebase/widgets/round_button.dart';

class AddFirestoreDataScreen extends StatefulWidget {
  const AddFirestoreDataScreen({super.key});

  @override
  State<AddFirestoreDataScreen> createState() => _AddFirestoreDataScreenState();
}

class _AddFirestoreDataScreenState extends State<AddFirestoreDataScreen> {
  bool isLoading = false;
  final fireStore = FirebaseFirestore.instance.collection('Posts');
  final postController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add FireStore Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: postController,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: 'What\'s is in your mind?',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            RoundButton(
              title: 'Add',
              isLoading: isLoading,
              onTap: () {
                setState(() {
                  isLoading = true;
                });
                String id = DateTime.now().millisecondsSinceEpoch.toString();
                fireStore.doc(id).set({
                  'id': id,
                  'title': postController.text.toString()
                }).then((value) {
                  setState(() {
                    isLoading = false;
                  });
                  Utils().toastMessage(
                    'Post Added',
                  );
                  Navigator.pop(context);
                }).onError((error, stackTrace) {
                  isLoading = false;
                  Utils().toastMessage(
                    error.toString(),
                  );
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
