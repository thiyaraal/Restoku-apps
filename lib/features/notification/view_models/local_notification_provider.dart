import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:restoku_app/features/notification/services/local_notification_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalNotificationProvider extends ChangeNotifier {
  final LocalNotificationService flutterNotificationService;

  LocalNotificationProvider(this.flutterNotificationService) {
    _loadScheduleStatus(); 
  }

  int _notificationId = 0;
  bool _permission = false;
  bool _isScheduled = false; 

  bool? get permission => _permission;
  bool get isScheduled => _isScheduled;

  List<PendingNotificationRequest> pendingNotificationRequests = [];

  Future<void> requestPermissions() async {
    _permission = (await flutterNotificationService.requestPermissions())!;
    notifyListeners();
  }

  void showNotification() {
    _notificationId += 1;
    flutterNotificationService.showNotification(
      id: _notificationId,
      title: "New Notification",
      body: "This is a new notification with id $_notificationId",
      payload: "This is a payload from notification with id $_notificationId",
    );
  }

  Future<void> scheduleDailyTenAMNotification() async {
    _notificationId += 1;
    await flutterNotificationService.scheduleDailyNotification(
      id: _notificationId,
    );
    _isScheduled = true;
    await _saveScheduleStatus(true); 
    notifyListeners();
  }

  Future<void> cancelScheduledNotification() async {
    await flutterNotificationService.cancelNotification(_notificationId);
    _isScheduled = false;
    await _saveScheduleStatus(false); 
    notifyListeners();
  }

  Future<void> _saveScheduleStatus(bool status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isNotificationScheduled", status);
  }

  Future<void> _loadScheduleStatus() async {
    final prefs = await SharedPreferences.getInstance();
    _isScheduled = prefs.getBool("isNotificationScheduled") ?? false;
    notifyListeners();
  }
}