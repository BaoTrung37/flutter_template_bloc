import 'package:auto_route/auto_route.dart';
import 'package:example_flutter_app/core/application/auth/authentication_bloc.dart';
import 'package:example_flutter_app/injection/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state.isAuthenticated) {
          print('Authenticated');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
        ),
        body: Center(
          child: Column(
            children: [
              const Text('Sign Up'),
              FormBuilderTextField(
                name: 'username',
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
              ),
              16.verticalSpace,
              FormBuilderTextField(
                name: 'password',
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
              ),
              16.verticalSpace,
              ElevatedButton(
                onPressed: () {
                  getIt<AuthenticationBloc>().add(
                    AuthenticationEvent.emailSignUp(
                      email: _emailController.text,
                      password: _passwordController.text,
                    ),
                  );
                },
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
