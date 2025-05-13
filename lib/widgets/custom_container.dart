import 'package:flutter/widgets.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    this.height,
    this.padding,
    this.alignment,
    this.color,
    this.borderRadius,
    this.image,
    this.boxFit,
    this.width,
    this.isAsset = true,
    this.widget,
  });
  final double? height;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final String? image;
  final BoxFit? boxFit;
  final double? width;
  final Widget? widget;
  final bool isAsset;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      alignment: alignment,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
        image: DecorationImage(
          image: isAsset ? NetworkImage(image ?? '') : AssetImage(image ?? ''),
          fit: boxFit,
        ),
      ),

      child: widget,
    );
  }
}
