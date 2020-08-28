import 'package:dudi/child/domain/interactor/child_interactor.dart';
import 'package:get/get.dart';

class ChildController extends GetxController {
  static ChildController get to => Get.find();
  final ChildInteractor _childInteractor = ChildInteractor();

  final childId = ''.obs;
  final isLoading = false.obs;
  final RxString errorMessage = RxString(null);

  ChildController() {
    init();
  }

  Future<void> init() async {
    try {
      isLoading.value = true;
      childId.value = await _childInteractor.getChildId();
    } catch(e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}