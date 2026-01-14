import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_box/provider/hide_password.dart';

class CustomTextfield extends StatefulWidget {
  final TextEditingController controller;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? hintText;
  final String? labelText;
  final IconData? icon2;
  final bool isPassword;
  const CustomTextfield({
    super.key,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.labelText,
    this.icon2,
    this.isPassword = false,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: 330,
      height: 55,
      child: Consumer<HidePassword>(
        builder: (context, value, child) {
          return TextField(
            controller: widget.controller,
            obscureText: widget.isPassword ? value.hidePassword : false,
            decoration: InputDecoration(
              prefixIcon: Icon(widget.prefixIcon, color: colorScheme.primary),
              suffixIcon: InkWell(
                onTap: (){
                  value.toggle();
                },
                child: Icon(value.hidePassword == true ? widget.icon2 : widget.suffixIcon, color: colorScheme.primary)),
              hintText: widget.hintText,
              labelText: widget.labelText,
              filled: true,
              fillColor: colorScheme.surfaceContainer,
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
          );
        },
      ),
    );
  }
}
