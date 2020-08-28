import 'dart:math';

import 'package:get_storage/get_storage.dart';

class ChildRepository {
  final GetStorage _box = GetStorage();

  Future<String> getChildId() async {
    // todo возможно нужно создавать ID и проверять в базе FB
    final String userId = _box.read('childId');
    if (userId != null) return userId;
    final random = Random().nextInt(899999) + 100000;
    await _box.write('childId', '$random');
    return _box.read('childId');
  }
}