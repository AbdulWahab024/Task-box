import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressd;
  final String btnText;
  const CustomButton({super.key, required this.onPressd, required this.btnText,});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: 330,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: colorScheme.onPrimary,
          backgroundColor: colorScheme.primary,
          textStyle: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressd,
        child: Text(btnText),
      ),
    );
  }
}
