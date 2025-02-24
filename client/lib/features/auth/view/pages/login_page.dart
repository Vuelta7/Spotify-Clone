import 'package:client/core/theme/app_pallete.dart';
import 'package:client/features/auth/view/widgets/auth_gradient_button.dart';
import 'package:client/features/auth/view/widgets/custom_filed.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailComtroller = TextEditingController();
  final passwordComtroller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailComtroller.dispose();
    passwordComtroller.dispose();
    super.dispose();
    formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign in',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              CustomFiled(
                hintText: 'Email',
                controller: emailComtroller,
              ), 
              SizedBox(height: 15),
              CustomFiled(
                hintText: 'Password',
                controller: passwordComtroller,
                isObscure: true,
              ),
              SizedBox(height: 20),
              AuthGradientButton(
                buttonText: 'Sign in', 
                onTap: () {}
              ),
              SizedBox(height: 20),
              RichText(text: 
                TextSpan(
                  text: 'Dont\' have an account? ',
                  style: Theme.of(context).textTheme.titleMedium,
                  children: const [
                    TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(
                      color: Pallete.gradient2,
                      fontWeight: FontWeight.bold,
                      ),
                    ),
                  ], 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
