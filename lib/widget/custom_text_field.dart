import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.controller,
      this.hintText,
      required this.textInputType,
      required this.textInputAction,
      required this.backgroundColor,
      this.prefixIcon,
      this.suffixIcon,
      required this.obscureText})
      : super(key: key);

  final TextEditingController? controller;
  final String? hintText;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final Color backgroundColor;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 15,
      decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(width: 1.0, color: backgroundColor),
          borderRadius: const BorderRadius.all(Radius.circular(18.0))),
      child: Center(
        child: TextField(
          controller: controller,
          textInputAction: textInputAction,
          keyboardType: textInputType,
          cursorColor: Colors.black,
          textAlign: TextAlign.start,
          obscureText: obscureText!,
          decoration: InputDecoration(
            hintStyle: TextStyle(
              color: Colors.grey.shade400,
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText!,
            border: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.transparent,
            )),
            disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.transparent,
            )),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
          ),
        ),
      ),
    );
  }
}
