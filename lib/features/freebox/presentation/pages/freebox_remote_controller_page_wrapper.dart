import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freebox_remote_controller/config/setup_container.dart';
import 'package:freebox_remote_controller/core/utils/show_snackbar.dart';
import 'package:freebox_remote_controller/features/freebox/presentation/cubits/freebox_code_cubit/freebox_code_cubit.dart';
import 'package:freebox_remote_controller/features/freebox/presentation/cubits/freebox_controller_cubit/freebox_controller_cubit.dart';
import 'package:freebox_remote_controller/features/freebox/presentation/pages/freebox_remote_controller_page.dart';

class FreeboxRemoteControllerPageWrapper extends StatelessWidget {
  const FreeboxRemoteControllerPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FreeboxControllerCubit>(
          create: (_) => sl.get<FreeboxControllerCubit>(),
        ),
        BlocProvider<FreeboxCodeCubit>(
          create: (_) => sl.get<FreeboxCodeCubit>(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<FreeboxControllerCubit, FreeboxControllerState>(
            listener: (context, state) {
              if (state is FreeboxControllerError) {
                showSnackBar(context, state.message);
              }
            },
          ),
          BlocListener<FreeboxCodeCubit, FreeboxCodeState>(
            listener: (context, state) {
              if (state is FreeboxCodeError) {
                showSnackBar(context, state.message);
              }
            },
          ),
        ],
        child: const FreeboxRemoteControllerPage(),
      ),
    );
  }
}
