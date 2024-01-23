import 'package:flutter/material.dart';

class ContainerBG extends StatelessWidget {
  final double? height;
  final double? width;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final BoxConstraints? constraints;
  final bool? circle;
  final bool? allRadius;
  final double topLeft;
  final double topRight;
  final double bottomLeft;
  final double bottomRight;
  final double? radius;
  final Color? fillColor;
  final double? borderWidth;
  final Color? borderColor;
  final Color? shadowColor;
  final Offset? offset;
  final double? blurRadius;
  final Widget? child;
  final DecorationImage? decorationImage;

  const ContainerBG({
    Key? key,
    this.height,
    this.width,
    this.alignment,
    this.margin,
    this.padding,
    this.constraints,
    this.circle = false,
    this.allRadius = false,
    this.topLeft = 0.0,
    this.topRight = 0.0,
    this.bottomLeft = 0.0,
    this.bottomRight = 0.0,
    this.radius = 0,
    this.fillColor,
    this.borderWidth,
    this.borderColor,
    this.shadowColor,
    this.offset,
    this.blurRadius,
    this.child,
    this.decorationImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment ?? Alignment.center,
      margin: margin ?? EdgeInsets.zero,
      padding: padding ?? EdgeInsets.zero,
      height: height,
      width: width,
      constraints:
          constraints ?? const BoxConstraints(minHeight: 25, minWidth: 25),
      decoration: BoxDecoration(
        shape: (circle != null && circle == true)
            ? BoxShape.circle
            : BoxShape.rectangle,
        // borderRadius: circle! ? null : BorderRadius.circular(radius ?? 0),
        borderRadius: (circle != null && circle == true)
            ? null
            : allRadius!
                ? BorderRadius.only(
                    topLeft: Radius.circular(topLeft),
                    topRight: Radius.circular(topRight),
                    bottomLeft: Radius.circular(bottomLeft),
                    bottomRight: Radius.circular(bottomRight),
                  )
                : BorderRadius.circular(radius ?? 0),
        color: fillColor,
        border: Border.all(
          width: borderWidth ?? 0,
          color: borderColor ?? Colors.transparent,
        ),
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? Colors.transparent,
            offset: offset ?? const Offset(0, 0),
            blurRadius: blurRadius ?? 0,
          ),
        ],
        image: decorationImage,
      ),
      child: child,
    );
  }
}
