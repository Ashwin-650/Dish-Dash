import 'package:flutter/widgets.dart';

class GestureDetectorWidget extends StatelessWidget {
  const GestureDetectorWidget({super.key, required this.onTap, this.widget});
  final GestureTapCallback onTap;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap, child: widget);
  }
}
