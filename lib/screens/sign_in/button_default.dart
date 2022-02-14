import 'package:flutter/material.dart';
import 'package:taxi_app/commons/app_colors.dart';
import 'package:taxi_app/commons/app_gradient.dart';

class ButtonDefault extends StatelessWidget {
  final String title;
  final Function? onTap;

  const ButtonDefault({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        height: 51,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.greenTop,
          borderRadius: BorderRadius.circular(12),
          gradient: AppGradient.gradientButton,
          boxShadow: const [
            BoxShadow(
              color: AppColors.greenBottom,
              offset: Offset(0, 6),
              blurRadius: 20,
            )
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
