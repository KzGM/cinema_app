import 'package:flutter_dotenv/flutter_dotenv.dart';

class DotEnvUtils {
  static String get apiKey => dotenv.env['THE_MOVIE_DB_API_KEY'] ?? '';
  static String get hostApi => dotenv.env['HOST_API'] ?? '';
  static String get apiVersion => dotenv.env['API_VERSION'] ?? '';

  static Future<void> initDotEnv() async {
    await dotenv.load(fileName: '.env');
  }
}
