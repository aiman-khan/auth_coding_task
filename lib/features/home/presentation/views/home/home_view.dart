import 'package:aims_coding_task/features/auth/presentation/cubits/logout/logout_cubit.dart';
import 'package:aims_coding_task/features/auth/presentation/cubits/logout/logout_state.dart';
import 'package:aims_coding_task/features/auth/presentation/views/login/widgets/app_elevated_button.dart';
import 'package:aims_coding_task/features/auth/presentation/views/login/widgets/background_effect.dart';
import 'package:aims_coding_task/util/resources/r.dart';
import 'package:aims_coding_task/util/router/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LogoutCubit(),
      child: Scaffold(
        backgroundColor: R.colors.secondary,
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -134.h,
              child: const BackgroundBlurEffect(),
            ),
            SafeArea(
              child: Center(
                child: BlocConsumer<LogoutCubit, LogoutState>(
                  listener: (context, state) {
                    if (state is LogoutSuccess) {
                      GoRouter.of(context).go(RoutePaths.login);
                    } else if (state is LogoutError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.message)),
                      );
                    }
                  },
                  builder: (context, state) {
                    return AppFilledButton(
                      text: 'Logout',
                      onTap: state is LogoutLoading
                          ? () {}
                          : () {
                              context.read<LogoutCubit>().logout();
                            },
                      isLoading: state is LogoutLoading,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
