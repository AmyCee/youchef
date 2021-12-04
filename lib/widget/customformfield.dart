

import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
 // Icon? formIcon;
  //bool suffixIcon;
  bool obscureText = false;
  String textLabel = "";
  double? height;
  bool multiline = false;
  //int? wid
  TextEditingController formController;

  CustomFormField({Key? key, this.obscureText = false, this.textLabel = "", this.height = 50, this.multiline = false, required this.formController }) : super(key: key);

  @override
  _CustomFormFieldState createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height!,
      width: 300,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5)
      ),
        child: TextFormField(
          keyboardType: widget.multiline ? TextInputType.multiline : null,
      maxLines:  widget.multiline ? null : 1,
      controller: widget.formController,
      decoration: InputDecoration(
     // icon: widget.formIcon,
      border: InputBorder.none,
      hintText: widget.textLabel,
         ),
       ),
    );
  }
}