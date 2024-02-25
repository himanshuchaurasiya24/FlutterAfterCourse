import 'package:flutter/material.dart';
import 'package:riverpod_http_request/models/user_model.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.userModel});
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: ListView(
        children: [
          Text(userModel.firstname),
          Text(userModel.lastname),
          Text(userModel.email),
          CircleAvatar(
            backgroundImage: NetworkImage(userModel.avatar),
          ),
          Text(
            userModel.id.toString(),
          ),
        ],
      ),
    );
  }
}
