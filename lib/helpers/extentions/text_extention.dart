import 'package:flutter/material.dart';

extension TextExtention on String {
  Widget extentext({
    double? fontSize,
    FontWeight? fontweight,
    Color? color,
    bool isShadow = false,
    TextAlign? textAlign,
  }) {
    return Text(
      this,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontweight,
        color: color,
        shadows:
            isShadow
                ? [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 2,
                    spreadRadius: 1,
                    offset: Offset(-2, 2),
                  ),
                ]
                : null,
      ),
      textAlign: textAlign,
    );
  }
}
