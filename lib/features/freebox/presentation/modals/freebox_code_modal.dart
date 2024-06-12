import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freebox_remote_controller/core/resources/strings.dart';
import 'package:freebox_remote_controller/features/freebox/value_objects/freebox_code.dart';

Future<void> showFreeboxCodeModal({
  required BuildContext context,
  required FreeboxCode? initialCode,
  required void Function(FreeboxCode code) onValidate,
}) {
  return showDialog(
    context: context,
    builder: (_) {
      return FreeboxSettingsForm(
        onValidate: onValidate,
        initialCode: initialCode,
      );
    },
  );
}

class FreeboxSettingsForm extends StatefulWidget {
  final FreeboxCode? initialCode;
  final void Function(FreeboxCode code) onValidate;
  const FreeboxSettingsForm({
    super.key,
    required this.onValidate,
    required this.initialCode,
  });

  @override
  State<FreeboxSettingsForm> createState() => _FreeboxSettingsFormState();
}

class _FreeboxSettingsFormState extends State<FreeboxSettingsForm> {
  final controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controller.text = widget.initialCode?.value ?? "";
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void submit() {
    if (!(formKey.currentState?.validate() ?? false)) return;
    final code = FreeboxCode(controller.text);
    widget.onValidate(code);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: const Text(SystemStrings.remoteControllerCode),
      content: Form(
        key: formKey,
        child: TextFormField(
          controller: controller,
          onFieldSubmitted: (_) => submit(),
          maxLength: 8,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          validator: (value) {
            final hasMatch = RegExp(r'^\d{8}$').hasMatch(value ?? "");
            if (!hasMatch) return "Invalid Freebox Code";
            return null;
          },
        ),
      ),
      actions: [
        SimpleDialogOption(
          onPressed: submit,
          child: const Text(SystemStrings.validate),
        )
      ],
    );
  }
}
