// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomFActionButton extends StatelessWidget {
  Icon icon;
  Function()? function;
  int tag;
  CustomFActionButton({
    Key? key,
    required this.icon,
    this.function,
    required this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: function,
      heroTag: '$tag',
      child: icon,
    );
  }
}
