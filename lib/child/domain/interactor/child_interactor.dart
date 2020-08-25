import 'package:dudi/child/data/child_repository.dart';

class ChildInteractor {
  final ChildRepository _childRepository = ChildRepository();

  Future<String> getChildId() => _childRepository.getChildId();
}