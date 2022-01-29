import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freebox_remote_controller/resources/strings.dart';
import 'package:freebox_remote_controller/utils/format_utils.dart';

class NavigationUtils {
  static void showSettingsDialog({required BuildContext context}) {
    final _formKey = GlobalKey<FormState>();
    String _code = "";
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text(SystemStrings.settings),
          content: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(SystemStrings.remoteControllerCode),
                Form(
                  key: _formKey,
                  child: TextFieldWidget(
                    valueChange: (String value) {
                      _code = value;
                    },
                  ),
                )
              ],
            ),
          ),
          actions: <Widget>[
            ValidateButtonWidget(
              formKey: _formKey,
              assignCode: () {
                print(_code);
              },
            ),
          ],
        );
      },
    );
  }
}

class ValidateButtonWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final VoidCallback assignCode;
  const ValidateButtonWidget({
    Key? key,
    required this.formKey,
    required this.assignCode,
  }) :  super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text(SystemStrings.validate),
      onPressed: () {
        FocusScope.of(context).requestFocus(FocusNode());
        if (formKey.currentState!.validate()) {
          assignCode();
          Navigator.of(context).pop();
        }
      },
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  final ValueChanged<String> valueChange;
  const TextFieldWidget({
    Key? key,
    required this.valueChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp("[0-9]")),
      ],
      maxLength: 8,
      keyboardType: TextInputType.number,
      focusNode: FocusNode(),
      textAlignVertical: TextAlignVertical.center,
      autocorrect: false,
      onChanged: (String? value) {
        valueChange(value ?? "");
      },
      validator: (String? value) {
        if (!value!.isEightDigits()) {
          return SystemStrings.notValidCode;
        }
        return null;
      },
    );
  }
}