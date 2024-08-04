import 'package:flutter/material.dart';

import '../../utils/color.dart';

class TTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final Widget? suffix;
  final bool obscureText;
  final int maxLine;
  final bool readOnly;
  final String labelText;

  final bool showIcon;

  final TextInputType keyBoardType;
  const TTextFormField({
    super.key,
    this.controller,
    required this.hintText,
     this.suffix,
    this.obscureText = false,
    this.keyBoardType = TextInputType.multiline,
    this.maxLine = 1,
    this.showIcon = true,
    this.readOnly = false, required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      color: AppColor.whiteColor,
      shadowColor: Colors.black38,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        controller: controller,
        maxLines: maxLine,
        obscureText: obscureText,
        keyboardType: keyBoardType,
        readOnly: readOnly,

        cursorColor: AppColor.black,
        style: const TextStyle(fontSize: 15),
        decoration: InputDecoration(


            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            labelText: labelText,
            labelStyle: const TextStyle(color: Colors.grey),
            suffixIcon: showIcon ? suffix : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: AppColor.greyColor.withOpacity(0.35),
              ),
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: AppColor.redColor),),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:  BorderSide(color: AppColor.primary.withOpacity(0.60),),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColor.greyColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }
}
