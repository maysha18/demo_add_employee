import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldView extends StatelessWidget {
  final TextEditingController? controller;
  final bool? obscureText;
  final bool? editable;
  final GestureTapCallback? onTap;
  final String? hintText;
  final String? errorText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? label;
  final TextStyle? labelStyle;
  final double? radius;
  final double? borderWidth;
  final Color? borderColor;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final bool? isDense;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsets? scrollPadding;
  final Color? fillColor;

  const TextFieldView({
    Key? key,
    this.isDense = false,
    this.controller,
    this.obscureText = false,
    this.editable = true,
    this.onTap,
    this.hintText = "",
    this.errorText = "",
    this.suffixIcon,
    this.prefixIcon,
    this.label,
    this.labelStyle,
    this.radius,
    this.borderWidth,
    this.borderColor,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.inputFormatters,
    this.keyboardType = TextInputType.text,
    this.fillColor,
    this.textInputAction = TextInputAction.next,
    this.contentPadding =
        const EdgeInsets.only(left: 15, right: 15, top: 12, bottom: 12),
    this.scrollPadding = const EdgeInsets.all(20.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Colors.grey,
            ),
      ),
      child: TextField(
        scrollPadding: scrollPadding!,
        onTap: onTap,
        enabled: editable,
        inputFormatters: inputFormatters,
        controller: controller ?? TextEditingController(),
        obscureText: obscureText!,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        maxLength: maxLength,
        maxLines: maxLines ?? 1,
        minLines: minLines,
        decoration: InputDecoration(
          isDense: isDense,
          hintText: hintText,
          filled: true,
          counter: const SizedBox.shrink(),
          label: label,
          labelStyle: labelStyle,
          fillColor: fillColor ?? Colors.white,
          hintStyle: TextStyle(fontSize: 14, color: Colors.grey, height: 0.6),
          errorText: errorText,
          errorStyle: TextStyle(fontSize: 14, height: 0),
          contentPadding: contentPadding,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular((radius ?? 12))),
            borderSide: BorderSide(
                width: (borderWidth ?? 1),
                color: borderColor ?? Color.fromARGB(255, 222, 221, 221)),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular((radius ?? 12))),
            borderSide: BorderSide(
                width: (borderWidth ?? 1),
                color: borderColor ?? Color.fromARGB(255, 222, 221, 221)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular((radius ?? 12))),
            borderSide: BorderSide(
                width: (borderWidth ?? 1),
                color: borderColor ?? Color.fromARGB(255, 222, 221, 221)),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular((radius ?? 12))),
            borderSide: BorderSide(
                width: (borderWidth ?? 1),
                color: borderColor ?? Color.fromARGB(255, 222, 221, 221)),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular((radius ?? 12))),
            borderSide: BorderSide(
                width: (borderWidth ?? 1),
                color: borderColor ?? Color.fromARGB(255, 222, 221, 221)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular((radius ?? 12))),
            borderSide: BorderSide(
                width: (borderWidth ?? 1),
                color: borderColor ?? Color.fromARGB(255, 222, 221, 221)),
          ),
        ),
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),
      ),
    );
  }
}
