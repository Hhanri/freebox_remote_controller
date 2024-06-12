import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freebox_remote_controller/core/utils/app_config.dart';
import 'package:freebox_remote_controller/features/freebox/presentation/cubits/freebox_controller_cubit/freebox_controller_cubit.dart';
import 'package:freebox_remote_controller/features/freebox/presentation/widgets/freebox_arrow_pad.dart';
import 'package:freebox_remote_controller/features/freebox/presentation/widgets/freebox_home_row.dart';
import 'package:freebox_remote_controller/features/freebox/presentation/widgets/freebox_media_control_pad.dart';
import 'package:freebox_remote_controller/features/freebox/presentation/widgets/freebox_numpad.dart';
import 'package:freebox_remote_controller/features/freebox/presentation/widgets/freebox_power_row.dart';

class FreeboxRemoteControllerPage extends StatelessWidget {
  const FreeboxRemoteControllerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FreeboxControllerCubit>();
    final onTap = cubit.onTap;
    final onLongPress = cubit.onLongPress;

    return Scaffold(
      body: SizedBox(
        height: AppConfig.trueScreenHeight(context),
        width: AppConfig.screenWidth(context),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FreeboxPowerRow(onTap: onTap, onLongPress: onLongPress),
              const SizedBox(height: 12),
              FreeboxNumpad(onTap: onTap, onLongPress: onLongPress),
              const SizedBox(height: 12),
              FreeboxArrowPad(onTap: onTap, onLongPress: onLongPress),
              const SizedBox(height: 12),
              FreeboxHomeRow(onTap: onTap, onLongPress: onLongPress),
              const SizedBox(height: 12),
              FreeboxMediaControlPad(onTap: onTap, onLongPress: onLongPress)
            ],
          ),
        ),
      ),
    );
  }
}
