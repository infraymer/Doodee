import 'package:get_storage/get_storage.dart';
import 'package:uuid/uuid.dart';

class ChildRepository {
  final GetStorage _box = GetStorage();

  Future<String> getChildId() async {
    // todo возможно нужно создавать ID и проверять в базе FB
    final String userId = _box.read('childId');
    if (userId != null) return userId;
    await _box.write('childId', Uuid().v4());
    return _box.read('childId');
  }
}