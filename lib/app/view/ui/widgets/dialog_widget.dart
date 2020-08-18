import 'package:flutter/material.dart';

class DialogWidget extends StatefulWidget {
  final Widget child;
  final EdgeInsets margin;
  final Color backgroundColor, overlayColor;
  final BorderRadius borderRadius;

  const DialogWidget({
    Key key,
    @required this.child,
    this.margin,
    this.backgroundColor,
    this.borderRadius,
    this.overlayColor,
  }) : super(key: key);

  @override
  _DialogWidgetState createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 270));
    scaleAnimation = CurvedAnimation(parent: controller, curve: Curves.ease);

    controller.addListener(() => setState(() {}));
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.overlayColor ?? Colors.transparent,
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: <Widget>[
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(color: Colors.transparent),
          ),
          Center(
            child: ScaleTransition(
              scale: scaleAnimation,
              child: Wrap(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 270),
                    decoration: BoxDecoration(
                      borderRadius:
                          widget.borderRadius ?? BorderRadius.circular(25),
                      color: widget.backgroundColor ?? Colors.white,
                    ),
                    margin: widget.margin,
                    child: Material(
                        child: widget.child, color: Colors.transparent),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
