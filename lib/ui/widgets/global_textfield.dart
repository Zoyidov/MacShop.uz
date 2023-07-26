import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class GlobalTextField extends StatefulWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final IconData prefixIcon;
  final String caption;

  const GlobalTextField({
    Key? key,
    required this.hintText,
    required this.keyboardType,
    required this.textInputAction,
    required this.prefixIcon,
    required this.caption,
  }) : super(key: key);

  @override
  _GlobalTextFieldState createState() => _GlobalTextFieldState();
}

class _GlobalTextFieldState extends State<GlobalTextField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.caption.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              widget.caption,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.black,
              ),
            ),
          ),
        SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 0,
                blurRadius: 20,
                offset: Offset.zero,
              ),
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: widget.hintText,
              prefixIcon: Icon(
                widget.prefixIcon,
                color: AppColors.black,
              ),
              suffixIcon: widget.keyboardType == TextInputType.visiblePassword
                  ? IconButton(
                splashRadius: 1,
                icon: Icon(
                  _isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: AppColors.black,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              )
                  : null,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.white, width: 1),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.black, width: 1),
                borderRadius: BorderRadius.circular(30),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1),
                borderRadius: BorderRadius.circular(30),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.white, width: 1),
                borderRadius: BorderRadius.circular(30),
              ),
              filled: true,
              fillColor: AppColors.white,
            ),
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            obscureText: widget.keyboardType == TextInputType.visiblePassword
                ? !_isPasswordVisible
                : false,
          ),
        ),
      ],
    );
  }
}
