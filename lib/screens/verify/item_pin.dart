import 'package:flutter/material.dart';
import 'package:taxi_app/commons/app_colors.dart';

class ItemPin extends StatelessWidget {
  const ItemPin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.greyBorder,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 14),
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Center(
          child: TextFormField(
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            decoration: const InputDecoration(
              hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.greyBorder,
              ),
              hintText: '-',
              border: InputBorder.none,
            ),
            maxLines: 1,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
          ),
        ),
      ),
    );
  }
}
