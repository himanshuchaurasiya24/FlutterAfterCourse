import 'package:dbes_http_riverpod/models/user_model.dart';
import 'package:dbes_http_riverpod/services/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dataProvider = FutureProvider<List<UserModel>>((ref) async {
  return await ref.watch(userProvider).getUsers();
});
