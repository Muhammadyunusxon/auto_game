import 'package:flutter/services.dart';

abstract class InputFormatter {
  InputFormatter._();
  static final TextInputFormatter currency = FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'));
  static final TextInputFormatter digitsOnly = FilteringTextInputFormatter.allow(RegExp(r'[0-9]'));
  static final TextInputFormatter phoneOnly = PhoneInputFormatter();
}
class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text.replaceAll(RegExp(r'\D'), '');
    return newValue.copyWith(
      text: text.isNotEmpty ? '+$text' : '',
      selection: TextSelection.collapsed(offset: text.length + 1),
    );
  }
}