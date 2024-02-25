import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:ttb_flutter_firebase/ui/posts/add_posts.dart';
import 'package:ttb_flutter_firebase/ui/posts/update_post.dart';
import 'package:ttb_flutter_firebase/utils/utilities.dart';
import 'package:firebase_database/firebase_database.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({
    super.key,
    required this.email,
  });
  final String email;

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final ref = FirebaseDatabase.instance.ref('Post');
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.email),
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
                return const AddPostScreen();
              },
            ),
          );
        },
        label: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Search Here',
                prefixIcon: Icon(Icons.search_outlined),
                border: OutlineInputBorder(),
              ),
              controller: searchController,
              onChanged: (String value) {
                setState(() {});
              },
            ),
          ),
          // 2nd method is by using firebaseAnimation

          Expanded(
            child: FirebaseAnimatedList(
              query: ref,
              itemBuilder: (context, snapshot, animation, index) {
                final title = snapshot.child('textContent').value.toString();
                final id = snapshot.child('id').value.toString();
                if (searchController.text.isEmpty) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return UpdatePostScreen(
                              id: id,
                              title: title,
                            );
                          },
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(
                        title,
                      ),
                      subtitle: Text(
                        id,
                      ),
                      trailing: PopupMenuButton(
                        icon: const Icon(Icons.more_vert),
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                              value: 1,
                              child: ListTile(
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return UpdatePostScreen(
                                        id: id,
                                        title: title,
                                      );
                                    },
                                  ));
                                },
                                leading: const Icon(Icons.edit),
                                title: const Text('Edit'),
                              ),
                            ),
                            PopupMenuItem(
                              value: 2,
                              child: ListTile(
                                onTap: () {
                                  ref.child(id).remove();
                                  Utils().toastMessage('Deleted');
                                  Navigator.pop(context);
                                },
                                leading: const Icon(Icons.delete),
                                title: const Text('Delete'),
                              ),
                            ),
                          ];
                        },
                      ),
                    ),
                  );
                } else if (title.toLowerCase().contains(
                      searchController.text.toLowerCase(),
                    )) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return UpdatePostScreen(
                              id: id,
                              title: title,
                            );
                          },
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(
                        title,
                      ),
                      subtitle: Text(
                        id,
                      ),
                      trailing: PopupMenuButton(
                        icon: const Icon(Icons.more_vert),
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                              value: 1,
                              child: ListTile(
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return UpdatePostScreen(
                                        id: id,
                                        title: title,
                                      );
                                    },
                                  ));
                                },
                                leading: const Icon(Icons.edit),
                                title: const Text('Edit'),
                              ),
                            ),
                            PopupMenuItem(
                              value: 2,
                              child: ListTile(
                                onTap: () {
                                  ref.child(id).remove();
                                  Utils().toastMessage('Deleted');
                                  Navigator.pop(context);
                                },
                                leading: const Icon(Icons.delete),
                                title: const Text('Delete'),
                              ),
                            ),
                          ];
                        },
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
// 1st method is by using stream builder
          // Expanded(
          //     child: StreamBuilder(
          //   stream: ref.onValue,
          //   builder: (context, snapshot) {
          //     if (!snapshot.hasData) {
          //       return const CircularProgressIndicator();
          //     } else {
          //       Map<dynamic, dynamic> map =
          //           snapshot.data!.snapshot.value as dynamic;
          //       List<dynamic> list = [];
          //       list.clear();
          //       list = map.values.toList();
          //       if (list.isEmpty) {
          //         return const Center(
          //           child: Text('No data till now'),
          //         );
          //       } else {
          //         return ListView.builder(
          //           itemCount: snapshot.data!.snapshot.children.length,
          //           itemBuilder: (context, index) {
          //             return ListTile(
          //               title: Text(list[index]['textContent']),
          //               subtitle: Text(list[index]['id']),
          //             );
          //           },
          //         );
          //       }
          //     }
          //   },
          // ),),