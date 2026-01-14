import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_box/utils/widgets/custom_button.dart';
import 'package:task_box/utils/widgets/custom_textfield.dart';
import 'package:task_box/view/forgot_password.dart';
import 'package:task_box/view/home_screen.dart';
import 'package:task_box/view/signup_view.dart';
import 'package:task_box/view_mdel/authVM.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  @override
  Widget build(BuildContext context) {
      final authVM = Provider.of<AuthVM>(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Theme.of(context).colorScheme.surfaceContainer,
              ),
              child: Image.asset("assets/images/logo.png", fit: BoxFit.cover),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          "Welcome Back!",
                          style: Theme.of(
                            context,
                          ).textTheme.headlineLarge?.copyWith(),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          "Login to continue",
                          style: Theme.of(
                            context,
                          ).textTheme.headlineSmall?.copyWith(),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    CustomTextfield(
                      hintText: "Email Address",
                      labelText: "Email Address",
                      controller: emailController,
                      prefixIcon: Icons.email,
                    ),
                    SizedBox(height: 20),
                    CustomTextfield(
                      hintText: "Password",
                      labelText: "Password",
                      controller: passwordController,
                      suffixIcon: Icons.visibility_off,
                      prefixIcon: Icons.lock,
                      icon2: Icons.visibility,
                      isPassword: true,
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 13),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgotPassword(),
                              ),
                            );
                          },
                          child: Text(
                            "Forgot Password?",
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.copyWith(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      btnText: "Login",
                      onPressd: () async{
                        final email = emailController.text.trim();
                    final password = passwordController.text.trim();

                    if (email.isEmpty || password.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Please fill all the fields"))
                      );
                      return;
                    }
                    await authVM.login(email, password);
                    if (authVM.errorMessage != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(authVM.errorMessage!))
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    }
                      
                      },
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignupView()));
                          },
                          child: Text(
                            "Register",
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
