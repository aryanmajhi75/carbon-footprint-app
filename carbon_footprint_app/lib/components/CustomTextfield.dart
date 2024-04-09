import 'package:carbon_footprint_app/constants.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:username_validator/username_validator.dart';

class CustomTextfield extends StatefulWidget {
  String type;
  Icon icon;
  String label;
  TextEditingController textController;
  CustomTextfield({
    super.key,
    required this.type,
    required this.icon,
    required this.label,
    required this.textController,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool _valid = false;

  validation(TextEditingController controller) {
    if (widget.type == "username") {
      _valid = UValidator.validateThis(
        username: controller.text,
        pattern: RegPattern.strict,
      );
    } else if (widget.type == "email") {
      _valid = EmailValidator.validate(controller.text);
      return _valid;
    } else if (widget.type == "age") {
    } else if (widget.type == "numMembers") {}
    // else if (widget.type == "emission") {}
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: DTprimary().onIconCol,
      controller: widget.textController,
      onSubmitted: (value) {
        widget.textController.text = value;
      },
      keyboardType: widget.type == "age" ||
              widget.type == "numMembers" ||
              widget.type == "yearsOld" ||
              widget.type == "chassisNum" ||
              widget.type == "serialNum"
          ? TextInputType.number
          : widget.type == "email"
              ? TextInputType.emailAddress
              : TextInputType.name,
      cursorErrorColor: DTprimary().error,
      style: TextStyle(
        color: DTprimary().white,
      ),
      decoration: InputDecoration(
        fillColor: DTprimary().onIconCol,
        labelText: widget.label,
        labelStyle: TextStyle(color: DTprimary().white),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: DTprimary().white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            color: DTprimary().onIconCol,
            width: 3,
          ),
          gapPadding: 5,
        ),
        icon: widget.icon,
        errorStyle: _valid == true ? TextStyle(color: DTprimary().error) : null,
        errorMaxLines: 1,
        errorBorder: _valid == true
            ? OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                  color: DTprimary().error,
                  width: 3,
                ),
                gapPadding: 5,
              )
            : null,
        errorText:
            _valid == true ? "Error! Please refer the instrction above." : null,
      ),
      autocorrect: false,
      enabled: true,
    );
  }
}
