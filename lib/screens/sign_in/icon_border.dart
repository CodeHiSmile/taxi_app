import 'package:flutter/material.dart';
import 'package:taxi_app/commons/app_colors.dart';

class IconBorder extends StatelessWidget {
  final String image;

  const IconBorder({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 51,
      width: 51,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.5),
        color: Colors.white,
        border: Border.all(
          color: AppColors.greyColor,
        ),
      ),
      child: Center(
        child: Image.asset(image),
      ),
    );
  }
}
