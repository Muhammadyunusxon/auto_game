import 'package:auto_game/presentation/components/modal_drag.dart';
import 'package:auto_game/presentation/components/modal_wrap.dart';
import 'package:auto_game/presentation/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:json_view/json_view.dart';

class UpgResponseModal extends StatelessWidget {
  final ScrollController? controller;
  final dynamic response;

  const UpgResponseModal({
    super.key,
    this.controller,
    this.response,
  });

  @override
  Widget build(BuildContext context) {
    return ModalWrap(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ModalDrag(),
            12.verticalSpace,
            if (response != null)
              Container(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.sizeOf(context).height / 0.6,
                    minHeight: 300),
                child: JsonConfig(
                  data: JsonConfigData(
                      animation: true,
                      animationDuration: const Duration(milliseconds: 300),
                      animationCurve: Curves.ease,
                      itemPadding: REdgeInsets.only(left: 8),
                      color: const JsonColorScheme(
                        stringColor: Colors.black,
                      ),
                      style: JsonStyleScheme(
                          arrow: const Icon(Icons.arrow_right),
                          keysStyle: Style.interNormal(size: 14))),
                  child: JsonView(json: response),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
