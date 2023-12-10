import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_http_request/data_provider/data_provider.dart';
import 'package:riverpod_http_request/models/user_model.dart';
import 'package:riverpod_http_request/sceens/details_screen.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final _data = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: _data.when(
        data: (_data) {
          List<UserModel> userList = _data.map((e) => e).toList();

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailsScreen(userModel: userList[index]);
                        },
                      ),
                    );
                  },
                  child: Card(
                    color: Colors.blue,
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      title: Text(
                        userList[index].firstname,
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        userList[index].lastname,
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: CircleAvatar(
                        backgroundImage: NetworkImage(userList[index].avatar),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
        error: (err, s) => Text(
          err.toString(),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
