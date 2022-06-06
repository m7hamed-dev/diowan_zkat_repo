import 'package:flutter/material.dart';

class Txt extends StatelessWidget {
  ///
  const Txt({
    Key? key,
    this.data,
    this.color,
    this.fontSize,
  }) : super(key: key);

  ///
  final String? data;
  final double? fontSize;
  final Color? color;

  ///
  @override
  Widget build(BuildContext context) {
    return Text(
      data ?? '',
      textAlign: TextAlign.center,
      softWrap: true,
      overflow: TextOverflow.clip,
      style: TextStyle(
        fontFamily: 'ibm-med',
        color: color ?? Colors.black,
        fontSize: fontSize ?? 15.0,
      ),
    );
  }
}
