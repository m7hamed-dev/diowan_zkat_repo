import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  //
  final TextAlign? textAlign;
  final bool? isNumber;
  final String? emptyMsg;
  final String? hint;
  final TextEditingController? controller;
  final int? maxLines;
  final int? maxLength;
  final bool? isPassword;
  final bool? autofocus;
  final bool? isShowBuildCounter;
  final Function(String)? onChange;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  //
  const Input({
    Key? key,
    this.emptyMsg,
    this.isPassword,
    this.textAlign,
    this.hint,
    // this.obscureText,
    this.controller,
    this.maxLines,
    this.maxLength,
    this.onChange,
    this.validator,
    this.isNumber,
    this.onFieldSubmitted,
    this.autofocus,
    this.isShowBuildCounter,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  //
  bool obscureText = false;
  //
  void _changeObscureText() {
    obscureText = !obscureText;
    setState(() {});
  }

  //
  @override
  Widget build(BuildContext context) {
    //
    return TextFormField(
      controller: widget.controller,
      autofocus: widget.autofocus ?? false,
      maxLength: widget.maxLength ?? 80,
      maxLines: widget.maxLines ?? 1,
      keyboardType: widget.isNumber == true ? TextInputType.number : null,
      obscureText: obscureText,
      textAlign: widget.textAlign ?? TextAlign.right,
      // textDirection: TextDirection.ltr,
      buildCounter: (BuildContext context,
          {int? currentLength, int? maxLength, bool? isFocused}) {
        return null;
      },
      // buildCounter: (BuildContext context,
      //         {int currentLength, int maxLength, bool isFocused}) =>
      //     null,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      // validator: validator ?? ValidatorClass.generalValidation,
      onChanged: widget.onChange,
      style: const TextStyle(fontFamily: 'alamari-bold'),
      autocorrect: false,
      decoration: InputDecoration(
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        // !=n ?
        //     InkWell(
        //       onTap: _changeObscureText,
        //       child: Image.asset(
        //         obscureText
        //             ? 'assets/images/001-visibility.png'
        //             : 'assets/images/003-phone-call.png',
        //         width: 20.0,
        //         height: 20.0,
        //       ),
        //     ),
        hintText: widget.hint,
        hintStyle: const TextStyle(
          fontFamily: 'alamari-reg',
          color: Colors.grey,
        ),
        // contentPadding: const EdgeInsets.symmetric(
        //   vertical: 10.0,
        //   horizontal: 30.0,
        // ),
        errorBorder: _erroBorder(context),
        enabledBorder: _enabledBorder(context),
        focusedErrorBorder: _outLineBorder(context),
        focusedBorder: _focusedBorder(context),
      ),
    );
  }

  OutlineInputBorder _focusedBorder(BuildContext context) {
    // final customTheme = Get.find<CustomTheme>();
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        color: Colors.grey,
        // color: customTheme.isDark.value
        //     ? Colors.white
        //     : Theme.of(context).primaryColor,
        // color: HexColor('#f8f8f8'),
        width: 1.0,
      ),
    );
  }

  OutlineInputBorder _outLineBorder(BuildContext context) {
    // final customTheme = Get.find<CustomTheme>();
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        width: 1.0,
      ),
    );
  }

  OutlineInputBorder _enabledBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        width: 1.0,
        color: Colors.grey.shade200,
      ),
    );
  }

  OutlineInputBorder _erroBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        width: 1.0,
        color: Colors.red,
      ),
    );
  }
}
