import 'package:clickshoppy/main.dart';

Map<String, String>? get headers {
  final String? token = globalSettingsProvider?.token;
  if (token != null && token.toString().trim().isNotEmpty) {
    return {
      'Authorization': 'Bearer $token',
    };
  }
  return null;
}
