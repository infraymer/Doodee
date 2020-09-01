import 'package:dudi/parent/domain/interactor/parent_interactor.dart';
import 'package:get/get.dart';

class ParentController extends GetxController {
  static ParentController get to => Get.find();
  final ParentInteractor _parentInteractor = ParentInteractor();
  final lastChildAdd = ''.obs;

  void onAddChild(String childId) async {
    _parentInteractor.addChild(childId);
    lastChildAdd.value = childId;
  }
}
