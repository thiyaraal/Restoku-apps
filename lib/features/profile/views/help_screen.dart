import 'package:flutter/material.dart';
import 'package:restoku_app/core/constants/color_style.dart';
import 'package:restoku_app/core/constants/text_style.dart';
import 'package:restoku_app/core/widgets/button/row_button.dart';
import 'package:restoku_app/core/widgets/custom/theme_widget.dart';
import 'package:restoku_app/core/widgets/ftext_field/custom_text_field.dart';
import 'package:restoku_app/features/notification/views/chat_provider.dart';
import 'package:restoku_app/features/profile/views/widgets/incoming_messege.dart';
import 'package:restoku_app/features/profile/views/widgets/outcoming_messege.dart';

import 'package:provider/provider.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: CustomDecorations.backgroundDecoration(context),
          child: Column(
            children: [
              CustomHeader(
                title: 'Bantuan',
              ),
              Text(
                'Kamis, 21 April 2024',
                style: TextStyles.regularBodyMedium(context)?.copyWith(
                  color: ColorStyles.white,
                ),
              ),
          
              Expanded(
                child: ListView.builder(
                  itemCount: chatProvider.chatData.length,
                  itemBuilder: (context, index) {
                    final chat = chatProvider.chatData[index];
                    final bool isSentByUser = chat['isSentByUser'] ?? false;
          
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: isSentByUser
                          ? IncomingAdminMessege(
                              imageProfile: chat['profile'],
                              dateTimeMessege: chat['time'],
                              incomingMessege: chat['message'],
                            )
                          : SentMessege(
                              dateSentMessege: chat['time'],
                              sentMessege: chat['message'],
                            ),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: chatProvider.sentMessageController,
                      hintText: 'Ketik pesan di sini...',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: ColorStyles.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: chatProvider.sendMessage,
                      icon: const Icon(
                        size: 24,
                        Icons.arrow_upward_outlined,
                        color: ColorStyles.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
