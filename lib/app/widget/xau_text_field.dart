import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class XauTextField extends StatefulWidget {
  final bool enabled;
  final String labelText;
  final String hintText;
  final String errorText;
  final TextInputType keyboardType;
  final int maxLines;
  final int maxLength;
  final TextEditingController controller;
  final Function(String) onChanged;
  @required
  final bool useObscure;
  final Stream<String> streamValidation;
  final Function(String) validator;
  final Function(String) onSaved;
  final Widget icon;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final TextInputAction textInputAction;
  final List<TextInputFormatter> inputFormatters;
  final List<String> autofillHints;
  final Color fillColor;
  final OutlineInputBorder border;
  final bool readOnly;
  final bool useToggle;
  final VoidCallback ontap;

  const XauTextField(
      {Key key,
      this.enabled,
      this.labelText,
      this.hintText,
      this.errorText,
      this.keyboardType,
      this.maxLines,
      this.controller,
      this.onChanged,
      @required this.useObscure,
      this.streamValidation,
      this.validator,
      this.onSaved,
      this.icon,
      this.prefixIcon,
      this.suffixIcon,
      this.textInputAction,
      this.inputFormatters,
      this.autofillHints,
      this.fillColor,
      this.border,
      this.readOnly,
      this.ontap,
      this.maxLength,
      this.useToggle})
      : super(key: key);
  @override
  _XauTextFieldState createState() => _XauTextFieldState();
}

class _XauTextFieldState extends State<XauTextField> {
  bool _obscureText = false;
  FocusNode myFocusNode = new FocusNode();
  void initState() {
    if (widget.useObscure) {
      _obscureText = true;
    }
    super.initState();
  }

  void _toggleObscure() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget suffixIcon;

    if (widget.useObscure) {
      suffixIcon = IconButton(
          icon: Icon(
            _obscureText ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
            color: primaryColor,
            size: 20,
          ),
          onPressed: () => _toggleObscure());
    }

    if (widget.suffixIcon != null) {
      suffixIcon = widget.suffixIcon;
    }

    return TextFormField(
      onTap: widget.ontap,
      onSaved: widget.onSaved,
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      textInputAction: TextInputAction.next,
      style: stylePrimary,
      textAlignVertical: TextAlignVertical.bottom,
      onChanged: widget.onChanged,
      obscureText: _obscureText,
      inputFormatters: widget.inputFormatters,
      readOnly: widget.readOnly ?? false,
      maxLength: widget.maxLength,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: percentHeight(context, 2.5), horizontal: percentWidth(context, 5)),
          fillColor: fillColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(percentWidth(context, 3)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(percentWidth(context, 3)),
            borderSide: BorderSide(color: primaryColor, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(percentWidth(context, 3)),
            borderSide: BorderSide(color: brokenWhiteColor),
          ),
          prefixIcon: widget.prefixIcon,
          labelText: widget.labelText,
          disabledBorder: widget.border,
          errorText: widget.errorText,
          hintText: widget.hintText,
          suffixIcon: suffixIcon,
          hintStyle: stylePrimary,
          hintMaxLines: widget.maxLines,
          labelStyle: stylePrimary),
    );
  }
}
