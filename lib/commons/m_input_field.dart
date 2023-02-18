import 'package:flutter/material.dart';

class MInputField extends StatefulWidget {
  const MInputField({
    Key? key,
    this.controller,
    this.obscureText = false,
    this.hintText,
    this.suffixIcon,
    this.isPassword = false,
  }) : super(key: key);

  final TextEditingController? controller;
  final bool obscureText;
  final String? hintText;
  final Widget? suffixIcon;
  final bool isPassword;

  @override
  State<MInputField> createState() => _MInputFieldState();
}

class _MInputFieldState extends State<MInputField> {
  late bool obscureText;

  @override
  void initState() {
    obscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: widget.controller != null
            ? widget.controller!.text.isNotEmpty
                ? GestureDetector(
                    onTap: widget.isPassword
                        ? () => setState(() {
                              obscureText = !obscureText;
                            })
                        : () => setState(() {
                              widget.controller?.clear();
                            }),
                    child: widget.suffixIcon,
                  )
                : null
            : null,
        suffixIconConstraints: const BoxConstraints(maxWidth: 20),
      ),
      onChanged: (val) {
        setState(() {});
      },
    );
  }
}
