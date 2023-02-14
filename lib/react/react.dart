import 'package:flutter/material.dart';
import 'package:reactive/react/react_base.dart';

class React<T extends ReactBase> extends StatefulWidget {
  final T react;
  final Widget child;

  const React({super.key, required this.react, required this.child});
  @override
  State<React> createState() {
    return _ReactState();
  }

  static T of<T extends ReactBase>(BuildContext context) {
    React<T> provider = context.findAncestorWidgetOfExactType<React<T>>() as React<T>;
    return provider.react;
  }
}

class _ReactState extends State<React> {
  @override
  void dispose() {
    widget.react.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
