import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthInputTextField extends StatefulWidget {
  @override
  _AuthInputTextFieldState createState() => _AuthInputTextFieldState();

  final FocusNode node;

  final FormFieldValidator validator;
  final bool obscure;
  final TextInputType textInputType;
  final String hintText;
  final TextEditingController controller;
  final TextInputAction action;
  final Function changeCallback;
  final String error;
  final ValueChanged<String> onFieldSubmitted;
  final EdgeInsets padding;
  final List<TextInputFormatter> inputFormatter;
  final TextCapitalization textCapitalization;
  final bool autofocus;
  final Key key;

  final Function deleteButtonPressed;

  AuthInputTextField(
      {this.autofocus = false,
      this.node,
      this.key,
      this.obscure = false,
      this.textInputType = TextInputType.text,
      this.hintText,
      this.controller,
      this.changeCallback,
      this.onFieldSubmitted,
      this.validator,
      this.padding = const EdgeInsets.fromLTRB(16, 16, 16, 0),
      this.action = TextInputAction.done,
      this.inputFormatter = const [],
      this.error = "",
      this.textCapitalization = TextCapitalization.none,
      this.deleteButtonPressed});
}

class _AuthInputTextFieldState extends State<AuthInputTextField> {
  @override
  Widget build(BuildContext context) => Padding(
        key: widget.key,
        padding: widget.padding,
        child: Container(
          color: Colors.transparent,
          child: TextFormField(
            validator: widget.validator,
            autofocus: widget.autofocus,
            textCapitalization: widget.textCapitalization,
            inputFormatters: widget.inputFormatter,
            textInputAction: widget.action,
            onFieldSubmitted: widget.onFieldSubmitted,
            controller: widget.controller,
            obscureText: widget.obscure,
            keyboardType: widget.textInputType,
            focusNode: widget.node,
            textAlign: TextAlign.center,
            onChanged: (val) => widget.changeCallback(val),
            decoration: InputDecoration(
                labelStyle: TextStyle(
                    color:
                        getTextFieldColor(widget.node.hasFocus, widget.error)),
                hintText: widget.hintText,
                hintStyle: TextStyle(),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: _border(
                    getTextFieldColor(widget.node.hasFocus, widget.error),
                    widget.error),
                focusColor: Colors.blue,
                errorBorder: _border(
                    getTextFieldColor(widget.node.hasFocus, widget.error),
                    widget.error),
                focusedErrorBorder: _border(
                    getTextFieldColor(widget.node.hasFocus, widget.error),
                    widget.error),
                focusedBorder: _border(
                    getTextFieldColor(widget.node.hasFocus, widget.error),
                    widget.error)),
          ),
        ),
      );
}

InputBorder _border(Color color, String error) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide(color: color, width: error.isEmpty ? 1 : 2));
}

Color getTextFieldColor(bool focused, String error) {
  if (error.length != 0) {
    return Colors.red;
  } else {
    if (focused) {
      return Colors.lightBlue;
    } else {
      return Colors.transparent;
    }
  }
}
