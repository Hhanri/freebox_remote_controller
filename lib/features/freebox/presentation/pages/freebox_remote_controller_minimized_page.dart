import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freebox_remote_controller/features/freebox/presentation/cubits/freebox_controller_cubit/freebox_controller_cubit.dart';
import 'package:freebox_remote_controller/features/freebox/presentation/widgets/freebox_home_row.dart';
import 'package:freebox_remote_controller/features/freebox/presentation/widgets/freebox_media_control_pad.dart';
import 'package:freebox_remote_controller/features/freebox/presentation/widgets/freebox_power_row.dart';

class FreeboxRemoteControllerMinimizedPage extends StatelessWidget {
  const FreeboxRemoteControllerMinimizedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FreeboxControllerCubit>();
    final onTap = cubit.onTap;
    final onLongPress = cubit.onLongPress;

    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FreeboxPowerRow(onTap: onTap, onLongPress: onLongPress),
          FreeboxHomeRow(onTap: onTap, onLongPress: onLongPress),
          FreeboxMediaControlPad(
            onTap: onTap,
            onLongPress: onLongPress,
          )
        ],
      ),
    );
  }
}
