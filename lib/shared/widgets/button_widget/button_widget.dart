import 'package:brasa_hacks_stone/shared/themes/app_colors.dart';
import 'package:brasa_hacks_stone/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  Color color;
  bool isOutlined;
  ButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
    this.isOutlined = false,
    this.color = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: isOutlined ? Colors.transparent : color,
        minimumSize: const Size(double.maxFinite, 50),
        padding: const EdgeInsets.all(0),
        shape: !isOutlined
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              )
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                  color: color,
                  width: 2,
                  style: BorderStyle.solid,
                ),
              ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: AppTextStyles.button,
      ),
    );
  }
}
