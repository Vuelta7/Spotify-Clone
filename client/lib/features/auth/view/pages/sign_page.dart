import 'package:client/core/theme/app_pallete.dart';
import 'package:client/features/auth/view/widgets/auth_gradient_button.dart';
import 'package:client/features/auth/view/widgets/custom_filed.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final nameComtroller = TextEditingController();
  final emailComtroller = TextEditingController();
  final passwordComtroller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameComtroller.dispose();
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
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              CustomFiled(
                hintText: 'Name',
                controller: nameComtroller,
              ),
              SizedBox(height: 15),
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
                buttonText:  'Sign Up',
                onTap: () {}
              ),
              SizedBox(height: 20),
              RichText(text: 
                TextSpan(
                  text: 'Already have an account? ',
                  style: Theme.of(context).textTheme.titleMedium,
                  children: const [
                    TextSpan(
                      text: 'Sign In',
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
