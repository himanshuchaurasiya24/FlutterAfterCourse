import 'package:dbes_http_riverpod/data_provider.dart';
import 'package:dbes_http_riverpod/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var res = ref.watch(dataProvider);
    return Scaffold(
      body: res.when(
        data: (data) {
          List<UserModel> userList = data.map((e) => e).toList();
          return Column(
            children: [
              Expanded(
                  child: ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(userList[index].first_name),
                    subtitle: Text(userList[index].last_name),
                    trailing: CircleAvatar(
                      backgroundImage: NetworkImage(userList[index].avatar),
                    ),
                  );
                },
              ))
            ],
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: Text(
              error.toString() + stackTrace.toString(),
            ),
          );
        },
        loading: () {
          return const CircularProgressIndicator.adaptive();
        },
      ),
    );
  }
}
