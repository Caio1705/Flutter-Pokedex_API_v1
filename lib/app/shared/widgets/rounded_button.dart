import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.child,
    required this.color,
    required this.click,
  });
  final Widget child;
  final Color color;
  final void Function() click;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: TextButton(
        onPressed: click,
        style: TextButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: child,
      ),
    );
  }
}
