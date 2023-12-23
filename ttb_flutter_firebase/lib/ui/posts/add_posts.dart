import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ttb_flutter_firebase/utils/utilities.dart';
import 'package:ttb_flutter_firebase/widgets/round_button.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  bool isLoading = false;
  final databaseRef = FirebaseDatabase.instance.ref('Post');
  final postController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Post'),
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
                databaseRef.child(id).set(
                  {
                    'id': id,
                    'textContent': postController.text.toString(),
                  },
                ).then((value) {
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
