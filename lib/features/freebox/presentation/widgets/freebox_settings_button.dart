import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freebox_remote_controller/features/freebox/presentation/cubits/freebox_code_cubit/freebox_code_cubit.dart';
import 'package:freebox_remote_controller/features/freebox/presentation/modals/freebox_code_modal.dart';
import 'package:freebox_remote_controller/features/freebox/presentation/widgets/freebox_button_widget.dart';

class FreeboxSettingsButton extends StatelessWidget {
  const FreeboxSettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FreeboxCodeCubit>();
    return FreeboxButtonWidget.icon(
      iconData: Icons.settings,
      onTap: () async {
        showFreeboxCodeModal(
          context: context,
          initialCode: cubit.state.code,
          onValidate: (code) async {
            await cubit.saveCode(code);
            if (context.mounted) Navigator.of(context).pop();
          },
        );
      },
    );
  }
}
