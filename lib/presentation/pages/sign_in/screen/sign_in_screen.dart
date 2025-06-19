import 'package:auto_route/auto_route.dart';
import 'package:example_flutter_app/core/application/auth/authentication_bloc.dart';
import 'package:example_flutter_app/injection/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            FormBuilderTextField(
              name: 'username',
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
              textInputAction: TextInputAction.next,
            ),
            16.verticalSpace,
            FormBuilderTextField(
              name: 'password',
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              textInputAction: TextInputAction.next,
            ),
            16.verticalSpace,
            ElevatedButton(
              onPressed: () {
                getIt<AuthenticationBloc>().add(
                  AuthenticationEvent.emailSignIn(
                    email: _emailController.text,
                    password: _passwordController.text,
                  ),
                );
              },
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
