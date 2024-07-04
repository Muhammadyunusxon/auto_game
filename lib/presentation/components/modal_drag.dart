import 'package:auto_game/presentation/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ModalDrag extends StatelessWidget {
  const ModalDrag({super.key}) ;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          8.verticalSpace,
          Container(
            width: 48.r,
            height: 4.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.r),
              color: Style.bottomSheetIconColor,
            ),
          ),
          18.verticalSpace,
        ],
      ),
    );
  }
}