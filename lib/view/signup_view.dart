import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_box/view/home_screen.dart';
import 'package:task_box/view/login_view.dart';
import 'package:task_box/view_mdel/authVM.dart';

import '../utils/widgets/custom_button.dart';
import '../utils/widgets/custom_textfield.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {

  @override
  Widget build(BuildContext context) {
    final authVM = Provider.of<AuthVM>(context);
      TextEditingController usernameController = TextEditingController();
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
                        padding: const EdgeInsets.only(left: 13),
                        child: Text(
                          "Welcome !",
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
                        padding: const EdgeInsets.only(left: 13),
                        child: Text(
                          "Sign Up to continue",
                          style: Theme.of(
                            context,
                          ).textTheme.headlineSmall?.copyWith(),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    CustomTextfield(
                      hintText: "Username",
                      labelText: "Username",
                      controller: usernameController,
                      prefixIcon: Icons.person,
                    ),
                    SizedBox(height: 20),
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
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      btnText: "Sign Up",
                      onPressd: () async {
                        String email = emailController.text.trim();
                        String password = passwordController.text.trim();
                        await authVM.signUp(email, password);
                        if (authVM.errorMessage != null) {
                          // show error if sign up failed
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(authVM.errorMessage!))
                          );
                          return;
                        }
                        // sign up successful
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginView()));
                          },
                          child: Text(
                            "Login",
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
