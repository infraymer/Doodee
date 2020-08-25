import 'package:dudi/app/view/ui/dialogs/ui_dialogs.dart';
import 'package:dudi/parent/presentation/parent_controller.dart';
import 'package:dudi/parent/view/ui/widget/map_parent_widget.dart';
import 'package:flutter/material.dart';

class RootParentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            MapParentWidget(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final childId = await UiDialogs.showInputChildIdDialog();
          if (childId == null) return;
          ParentController.to.onAddChild(childId);
        },
      ),
    );
  }
}
