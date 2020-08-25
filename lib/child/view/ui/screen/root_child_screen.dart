import 'package:dudi/child/presentation/child_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootChildScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _buildChildId(),
      ),
    );
  }

  Widget _buildChildId() {
    return Obx(
      () => ChildController.to.isLoading.value
          ? CircularProgressIndicator()
          : Text(
              '${ChildController.to.childId.value}',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }
}
