import 'package:carbon_footprint_app/constants.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatefulWidget {
  final double height;
  final double width;
  final Color color;
  final Widget containerChild;
  const CustomContainer({
    super.key,
    required this.height,
    required this.width,
    required this.color,
    required this.containerChild,
  });

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: widget.color,
      ),
      child: Center(
        child: widget.containerChild,
      ),
    );
  }
}
