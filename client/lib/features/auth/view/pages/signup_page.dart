import 'package:client/core/theme/app_pallete.dart';
import 'package:client/features/auth/repositories/auth_remote_repositories.dart';
import 'package:client/features/auth/view/widgets/auth_gradient_button.dart';
import 'package:client/features/auth/view/widgets/custom_filed.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
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
                controller: nameController,
              ),
              SizedBox(height: 15),
              CustomFiled(
                hintText: 'Email',
                controller: emailController,
              ), 
              SizedBox(height: 15),
              CustomFiled(
                hintText: 'Password',
                controller: passwordController,
                isObscure: true,
              ),
              SizedBox(height: 20),
              AuthGradientButton(
                buttonText:  'Sign Up',
                onTap: () async {
                  final res = await AuthRemoteRepositories().signup(
                    name: nameController.text, 
                    email: emailController.text, 
                    password: passwordController.text,
                  );
                  
                  final val = switch(res){
                    Left(value: final l) => l,
                    Right(value: final r) => r.toString(),
                  };
                  print(val);
                }
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/login');
                },
                child: RichText(text: 
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
