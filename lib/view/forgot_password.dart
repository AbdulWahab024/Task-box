import 'package:flutter/material.dart';
import 'package:task_box/utils/widgets/custom_button.dart';
import 'package:task_box/utils/widgets/custom_textfield.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 19.0),
                  child: Text(
                    "Forgot Password?",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 19.0),
                  child: Text(
                    "Ener you email address to reset your password.",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
              SizedBox(height: 20),
              CustomTextfield(
                controller: controller,
                prefixIcon: Icons.email,
                hintText: "Email Address",
                labelText: "Email Address",
              ),
              SizedBox(height: 30),
              CustomButton(onPressd: () {}, btnText: "Reset Password"),
            ],
          ),
        ),
      ),
    );
  }
}
