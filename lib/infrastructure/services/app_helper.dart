import 'package:auto_game/app_constants.dart';
import 'package:auto_game/presentation/styles/style.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

abstract class AppHelper {
  AppHelper._();

  static String numberFormat({
    num? number,
    String? symbol,
    bool? isOrder,
    int? decimalDigits,
  }) {
    number = number ?? 0;

    return NumberFormat.currency(
      customPattern: '#,###.# \u00a4',
      symbol: "coin",
      decimalDigits: decimalDigits ?? 0,
    ).format(number);
  }

  static Future<void> showCustomModalBottomDragSheet({
    required BuildContext context,
    required Function(ScrollController controller) modal,
    double radius = AppConstants.radius,
    bool isDrag = true,
    bool isDismissible = true,
    double paddingTop = 100,
    double maxChildSize = 0.95,
    double initSize = 0.9,
  }) async {
    return await showModalBottomSheet(
      isDismissible: isDismissible,
      enableDrag: isDrag,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius.r),
          topRight: Radius.circular(radius.r),
        ),
      ),
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height - paddingTop.r,
      ),
      backgroundColor: Style.transparent,
      context: context,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: initSize,
        maxChildSize: maxChildSize,
        expand: false,
        builder: (BuildContext context, ScrollController scrollController) {
          return modal(scrollController);
        },
      ),
    );
  }

  static int? errorSecond(e) {
    print("object");
    print(e.response?.data);
    return (e as DioException).response?.data["error_code"] ==
            "UPGRADE_COOLDOWN"
        ? int.tryParse(e.response?.data["cooldownSeconds"].toString() ?? '')
        : null;
  }


}
