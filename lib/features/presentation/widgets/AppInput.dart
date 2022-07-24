import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppInput extends StatefulWidget {
  String text;
  Function function;
  AppInput({
    Key? key,
    required this.text,
    required this.function,
  }) : super(key: key);

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final List<String> errors = [];
    void addError({required String error}) {
      if (!errors.contains(error))
        setState(() {
          errors.add(error);
        });
    }

    void removeError({required String error}) {
      if (errors.contains(error))
        setState(() {
          errors.remove(error);
        });
    }

    Widget userInput(TextEditingController userInput, String hintTitle,
        TextInputType keyboardType) {
      return Container(
        height: 50,
        // margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            // color: Colors.blueGrey.shade100,
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.only(left: 0.0, right: 0),
          child: Center(
              child: TextFormField(
            controller: userInput,
            // Requests a keyboard with ready access to the "@" and "." keys.
            keyboardType: keyboardType,
            onSaved: (newValue) => widget.text = newValue ?? "",
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains('kEmailNullError')) {
                removeError(error: 'kEmailNullError');
              }
              // else if (emailValidatorRegExp.hasMatch(value)) {
              //   removeError(error: 'kInvalidEmailError');
              // }
              else if (value.isNotEmpty) {
                addError(error: 'kInvalidEmailError');
                return null;
              }
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                addError(error: 'kEmailNullError');
                removeError(error: 'kInvalidEmailError');
                return 'Email Empty';
              } else if (value.isNotEmpty) {
                addError(error: 'kInvalidEmailError');
              }
              return null;
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.only(
                top: 14.0,
                bottom: 12.0,
                left: 14.0,
                right: 14.0,
              ),
              errorStyle: TextStyle(fontSize: 12, height: 0.2),
              hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.black26,
                  fontStyle: FontStyle.normal),

              border: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(6.0),
                borderSide: BorderSide.none,
              ),
              hintText: hintTitle,
              // When [FloatingLabelBehavior.always] the label will always float at the top of the field above the content.
              floatingLabelBehavior: FloatingLabelBehavior.never,
              suffixIcon: UnconstrainedBox(
                child: SvgPicture.asset(
                  "assets/svg/ic_plus.svg",
                  height: 24,
                  width: 24,
                ),
              ),
            ),
          )),
        ),
      );
    }

    return userInput(textController, 'Create Post', TextInputType.text);
  }
}
