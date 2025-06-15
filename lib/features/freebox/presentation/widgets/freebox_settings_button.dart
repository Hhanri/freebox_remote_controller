import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freebox_remote_controller/core/utils/show_custom_menu.dart';
import 'package:freebox_remote_controller/core/widgets/custom_popup_menu_item.dart';
import 'package:freebox_remote_controller/features/alert_window/alert_window.dart';
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
      onTap: () {
        _showMenu(context);
      },
    );
  }

  void _showMenu(BuildContext context) {
    showCustomMenu(
      context: context,
      items: [
        PopupMenuItem(
          onTap: () {
            final cubit = context.read<FreeboxCodeCubit>();
            showFreeboxCodeModal(
              context: context,
              initialCode: cubit.state.code,
              onValidate: (code) async {
                await cubit.saveCode(code);
                if (context.mounted) Navigator.of(context).pop();
              },
            );
          },
          child: const CustomPopupMenuItem(
            icon: Icons.settings,
            text: "Edit code",
          ),
        ),
        PopupMenuItem(
          onTap: () async {
            final alertWindow = IAlertWindow();
            if (await alertWindow.isActive()) {
              await alertWindow.hide();
              return;
            }
            if (context.mounted) alertWindow.show(context);
          },
          child: const CustomPopupMenuItem(
            icon: Icons.picture_in_picture_alt,
            text: "Hide / Show window",
          ),
        ),
      ],
    );
  }
}
