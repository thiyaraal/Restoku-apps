import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restoku_app/core/constants/color_style.dart';
import 'package:restoku_app/core/constants/text_style.dart';
import 'package:restoku_app/core/widgets/button/row_button.dart';
import 'package:restoku_app/core/widgets/custom/theme_widget.dart';
import 'package:restoku_app/features/notification/view_models/local_notification_provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: CustomDecorations.backgroundDecoration(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20.0,
            ),
             CustomHeader(
           title: 'Notifikasi',
             ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Consumer<LocalNotificationProvider>(
                    builder: (context, provider, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Aktifkan Notifikasi Pengingat',
                            style: TextStyles.boldBodyLarge(context)
                                ?.copyWith(color: ColorStyles.white),
                          ),
                          Switch(
                            value: provider.isScheduled,
                            onChanged: (value) {
                              if (value) {
                                provider.scheduleDailyTenAMNotification();
                              } else {
                                provider.cancelScheduledNotification();
                              }
                            },
                            activeColor: ColorStyles.warning,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
