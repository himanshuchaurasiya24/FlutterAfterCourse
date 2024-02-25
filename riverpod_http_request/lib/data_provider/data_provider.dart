import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_model.dart';
import '../services/services.dart';

final userDataProvider = FutureProvider<List<UserModel>>((ref) async {
  return await ref.watch(userProvider).getUsers();
});
