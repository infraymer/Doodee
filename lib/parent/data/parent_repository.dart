import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uuid/uuid.dart';

class ParentRepository {
  final GetStorage _box = GetStorage();

  Future<String> getParentId() async {
    final String userId = _box.read('parentId');
    if (userId != null) return userId;
    await _box.write('parentId', Uuid().v4());
    return _box.read('parentId');
  }

  Future<void> addChild(String childId) async {
    final userId = await getParentId();
    await FirebaseFirestore.instance.collection('children').add({
      'parent': '$userId',
      'child': '$childId',
    });
  }

  Future<void> getChildren() async {
    final userId = await getParentId();
    FirebaseFirestore.instance
        .collection('children')
        .where('parent', isEqualTo: '$userId')
        .get();
  }
}
