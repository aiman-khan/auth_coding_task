import 'package:aims_coding_task/common/extensions/sized_box.dart';
import 'package:aims_coding_task/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:aims_coding_task/features/auth/presentation/views/login/widgets/app_elevated_button.dart';
import 'package:aims_coding_task/features/auth/presentation/views/login/widgets/background_effect.dart';
import 'package:aims_coding_task/features/auth/presentation/views/login/widgets/app_text_field.dart';
import 'package:aims_coding_task/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatefulWidget {
  final bool isLoading;

  const LoginForm({super.key, this.isLoading = false});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final _emailInputController = TextEditingController();
  final _passwordInputController = TextEditingController();

  late FocusNode _emailFocusNode;
  late FocusNode _passwordFocusNode;

  void initializeNodes() {
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  Future<void> disposeNodes() async {
    _passwordFocusNode.dispose();
    _emailFocusNode.dispose();
  }

  Future<void> disposeControllers() async {
    _emailInputController.dispose();
    _passwordInputController.dispose();
  }

  @override
  void initState() {
    super.initState();
    initializeNodes();
  }

  @override
  void dispose() {
    super.dispose();
    disposeControllers();
    disposeNodes();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -200.h,
          child: const BackgroundBlurEffect(),
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  151.hb,

                  /// [Heading]
                  Text(
                    'Log in!',
                    style: TextStyle(
                      color: R.colors.primary,
                      fontSize: 41.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  129.hb,

                  /// [Email Text Field]
                  LoginTextField(
                    controller: _emailInputController,
                    focusNode: _emailFocusNode,
                    prefixIcon: Icon(
                      Icons.alternate_email,
                      color: R.colors.white,
                    ),
                    hintText: 'Email',
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return 'Please enter your email';
                      }

                      final emailRegex = RegExp(
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                      );

                      if (!emailRegex.hasMatch(v)) {
                        return 'Please enter a valid email';
                      }

                      return null;
                    },
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(_passwordFocusNode);
                    },
                  ),

                  24.hb,

                  /// [Password Text Field]
                  LoginTextField(
                    controller: _passwordInputController,
                    focusNode: _passwordFocusNode,
                    obscureText: true,
                    prefixIcon: Icon(
                      Icons.lock,
                      color: R.colors.white,
                    ),
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return 'Please enter your password';
                      }

                      if (v.length < 8) {
                        return 'Password must be at least 8 characters long';
                      }

                      return null;
                    },
                    hintText: 'Password',
                    onEditingComplete: () {
                      FocusScope.of(context).unfocus();
                    },
                  ),
                  62.hb,

                  /// [Login Button]
                  Center(
                    child: AppFilledButton(
                      text: 'Login',
                      onTap: widget.isLoading
                          ? () {}
                          : () {
                              if (_formKey.currentState?.validate() ?? false) {
                                context.read<LoginCubit>().login(
                                      _emailInputController.text,
                                      _passwordInputController.text,
                                    );
                              }
                            },
                      isLoading:
                          widget.isLoading, // Pass loading state to the button
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
