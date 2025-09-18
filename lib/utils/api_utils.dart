import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiUtils {
  static final String apiUtilsTokenHotmail =
      dotenv.env["API_TOKEN_HOTMAIL"] ?? "";
  static final String apiUtilsTokenGmail = dotenv.env["API_TOKEN_GMAIL"] ?? "";
  static const String urlRoot = "https://api.api-futebol.com.br";
}
