import 'package:flutter/material.dart';

import 'txt.dart';

class Btn extends StatelessWidget {
  //
  final Function()? onPressed;
  final String? title;
  final Color? color;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final double? elevation;
  // final Color? textColor;
  const Btn({
    Key? key,
    this.onPressed,
    this.title,
    this.color,
    this.margin,
    this.padding,
    this.width,
    this.elevation,
    this.height,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // new
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        clipBehavior: Clip.antiAlias,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(10.0),
          primary: color ?? Theme.of(context).primaryColor,
          shadowColor: Colors.transparent,
        ),
        child: Txt(
          data: title ?? '',
          color: Colors.white,
          fontSize: 15.0,
        ),
      ),
    );
  }
}
