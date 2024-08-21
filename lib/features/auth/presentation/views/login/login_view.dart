import 'package:aims_coding_task/features/auth/domain/usecases/login.dart';
import 'package:aims_coding_task/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:aims_coding_task/features/auth/presentation/cubits/login/login_state.dart';
import 'package:aims_coding_task/features/auth/presentation/views/login/widgets/login_form.dart';
import 'package:aims_coding_task/util/di/di.dart';
import 'package:aims_coding_task/util/resources/r.dart';
import 'package:aims_coding_task/util/router/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        loginDriverUsecase: sl<LoginUsecase>(),
      ),
      child: Scaffold(
        backgroundColor: R.colors.secondary,
        body: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              GoRouter.of(context).pushReplacement(RoutePaths.home);
            } else if (state is LoginError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage)),
              );
            }
          },
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return LoginForm(isLoading: state is LoginLoading);
            },
          ),
        ),
      ),
    );
  }
}
