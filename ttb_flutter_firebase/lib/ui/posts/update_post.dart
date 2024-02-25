import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ttb_flutter_firebase/utils/utilities.dart';
import 'package:ttb_flutter_firebase/widgets/round_button.dart';

class UpdatePostScreen extends StatefulWidget {
  const UpdatePostScreen({
    super.key,
    required this.id,
    required this.title,
  });
  final String id;
  final String title;

  @override
  State<UpdatePostScreen> createState() => _UpdatePostScreenState();
}

class _UpdatePostScreenState extends State<UpdatePostScreen> {
  final idController = TextEditingController();
  final titleController = TextEditingController();
  bool isLoading = false;
  final databaseRef = FirebaseDatabase.instance.ref('Post');
  @override
  void initState() {
    super.initState();
    idController.text = widget.id;
    titleController.text = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Screen'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            controller: titleController,
          ),
          const SizedBox(
            height: 16,
          ),
          RoundButton(
              title: 'Update',
              isLoading: isLoading,
              onTap: () {
                isLoading = true;
                setState(() {});
                // databaseRef.child(widget.id).set({
                //   'id': widget.id,
                //   'textContent': titleController.text
                // })

                databaseRef.child(widget.id).update({
                  'id': widget.id,
                  'textContent': titleController.text
                }).then((value) {
                  isLoading = false;
                  Utils().toastMessage('Updation Successful');
                  Navigator.pop(context);
                }).onError((error, stackTrace) {
                  isLoading = false;
                  Utils().toastMessage(error.toString());
                });
              })
        ],
      ),
    );
  }
}
