import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ttb_flutter_firebase/utils/utilities.dart';
import 'package:ttb_flutter_firebase/widgets/round_button.dart';

class UpdateFirestorePostScreen extends StatefulWidget {
  const UpdateFirestorePostScreen({
    super.key,
    required this.id,
    required this.title,
  });
  final String id;
  final String title;

  @override
  State<UpdateFirestorePostScreen> createState() =>
      _UpdateFirestorePostScreenState();
}

class _UpdateFirestorePostScreenState extends State<UpdateFirestorePostScreen> {
  final idController = TextEditingController();
  final titleController = TextEditingController();
  bool isLoading = false;
  final firestore = FirebaseFirestore.instance.collection('Posts');
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

                firestore.doc(widget.id).update({
                  'id': widget.id,
                  'title': titleController.text
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
