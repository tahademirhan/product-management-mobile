import 'package:flutter/material.dart';

class Buttoni extends StatelessWidget {
  String label;
  Color? color;
  Color? backgroundColor;
  VoidCallback? onPressed;
  double? width;
  double? height;
  Icon? icon;
  Color? borderColor;
  double? fontSize;
  double? radius;

  Buttoni({
    Key? key,
    required this.label,
    this.color,
    this.backgroundColor,
    this.width,
    this.height = 52,
    this.icon,
    this.borderColor,
    this.fontSize,
    this.radius,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: width ?? size.width * 0.89,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(
              color:
                  onPressed == null ? Colors.grey : borderColor ?? Colors.grey,
              width: 1.0),
          backgroundColor: onPressed == null
              ? Colors.grey
              : backgroundColor ?? Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 53),
          ),
          textStyle: TextStyle(color: color ?? Colors.white),
        ),
        child: Row(
          mainAxisAlignment: icon == null
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: fontSize ?? 16,
                fontWeight: FontWeight.w600,
                color: color ?? Colors.white,
              ),
            ),
            icon ?? Container()
          ],
        ),
      ),
    );
  }
}
