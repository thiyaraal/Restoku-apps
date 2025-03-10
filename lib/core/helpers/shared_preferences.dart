import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static const String themeKey = "isDarkMode";
  static const String notificationScheduledKey = "isNotificationScheduled";

  static Future<void> saveTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(themeKey, isDark);
  }

  static Future<bool> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(themeKey) ?? false;
  }

  static Future<void> saveNotificationScheduled(bool isScheduled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(notificationScheduledKey, isScheduled);
  }

  static Future<bool> getNotificationScheduled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(notificationScheduledKey) ?? false;
  }

  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
