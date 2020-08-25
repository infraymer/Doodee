import 'package:dudi/app/view/ui/widgets/ui_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UiDialogs {
  static Future<String> showInputChildIdDialog() {
    final controller = TextEditingController();
    return Get.dialog<String>(Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          TextField(
            controller: controller,
          ),
          SizedBox(height: 16),
          UiRaisedButton(
            text: 'Add',
            onPressed: () => Get.back(result: controller.text),
          ),
        ],
      ),
    ));
  }
}
