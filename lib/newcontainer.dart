import 'package:calculator_3/calculator_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NewContainer extends StatefulWidget {
  final Widget? child;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  const NewContainer({
    Key? key,
    this.child,
    this.borderRadius,
    this.padding,
    this.color
  }) : super(key: key);

  @override
  State<NewContainer> createState() => _NewContainerState();
}

class _NewContainerState extends State<NewContainer> {
  bool _Press = false;
  void _onPointerDown(PointerDownEvent event) {
    setState(
      () {
        _Press = true;
      },
    );
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(
      () {
        _Press = false;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      child: Container(
          padding: widget.padding,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: widget.borderRadius,
            boxShadow: _Press
                ? null
                : [
                    BoxShadow(
                      color: Colors.blueGrey.shade200,
                      offset: Offset(4.0, 4.0),
                      blurRadius: 15,
                      spreadRadius: 1.0,
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4.0, -4.0),
                      blurRadius: 15,
                      spreadRadius: 1.0,
                    ),
                  ],
          ),
          child: widget.child),
    );
  }
}
