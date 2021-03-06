import 'package:dudi/parent/data/parent_repository.dart';
import 'package:dudi/parent/domain/model/parent_child.dart';

class ParentInteractor {
  final ParentRepository _parentRepository = ParentRepository();

  Future<void> init() async {
    await _parentRepository.getParentId();
  }

  Future<void> addChild(String childId) => _parentRepository.addChild(childId);

  Future<List<ParentChild>> getChildren() => _parentRepository.getChildren();
}