import 'package:flutter/material.dart';
import 'package:taxi_app/commons/app_colors.dart';
import 'package:taxi_app/commons/app_images.dart';

class PhoneSelected extends StatelessWidget {
  const PhoneSelected({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 24),
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.greyBorder,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.fromLTRB(11, 11, 3, 11),
            child: Row(
              children: <Widget>[
                Image.asset(
                  AppImages.icFlag,
                ),
                const SizedBox(
                  height: 14,
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.greenTop,
                  size: 28,
                )
              ],
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Container(
              height: 51,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.greyBorder,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                children: <Widget>[
                  const Text(
                    "+84",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.greyBorder,
                        ),
                        hintText: 'Phone Number',
                        border: InputBorder.none,
                        // contentPadding: EdgeInsets.only(bottom: 11),
                      ),
                      maxLines: 1,
                      keyboardType: TextInputType.multiline,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
