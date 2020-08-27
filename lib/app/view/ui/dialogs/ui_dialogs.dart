import 'package:dudi/app/view/ui/widgets/ui_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddChildController extends GetxController {
  final isShowButton = false.obs;
}

class UiDialogs {
  static Future<String> showInputChildIdDialog() {
    final textController = TextEditingController();
    return Get.defaultDialog<String>(
      title: 'Add child',
      content: GetBuilder<AddChildController>(
        init: AddChildController(),
        builder: (controller) {
          return Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                TextField(
                  autofocus: true,
                  controller: textController,
                  maxLength: 6,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    border: OutlineInputBorder(),
                    hintText: 'X X X X X X',
                    labelText: 'Child code',
                  ),
                  onChanged: (value) {
                    controller.isShowButton.value = value.length > 5;
                  },
                ),
                SizedBox(height: 16),
                Obx(() => Visibility(
                      visible: controller.isShowButton.value,
                      child: UiRaisedButton(
                        text: 'Add',
                        onPressed: () {
                          if (textController.text.length < 6) {
                            return;
                          }
                          Get.back(result: textController.text);
                        },
                      ),
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}
