import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:restoku_app/core/constants/color_style.dart';
import 'package:restoku_app/core/constants/text_style.dart';
import 'package:restoku_app/core/widgets/custom/theme_widget.dart';


class ProfileHeader extends StatelessWidget {
  final String profileImage;
  final String userName;
  final String phone;
  final String userEmail;
  final VoidCallback onTap;

  const ProfileHeader({
    super.key,
    required this.onTap,
    required this.profileImage,
    required this.userName,
    required this.phone,
    required this.userEmail,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: CustomDecorations.darkThemeColor(context),
          ),
        ),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              child: profileImage.isNotEmpty
                  ? CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.grey[200],
                      child: ClipOval(
                        child: Image.network(
                          profileImage,
                          fit: BoxFit.cover,
                          width: 62,
                          height: 72,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(
                              size: 52,
                              TablerIcons.user,
                              color: ColorStyles.disabled,
                            );
                          },
                        ),
                      ),
                    )
                  : Icon(
                          size: 52,
                      TablerIcons.user,
                      color: ColorStyles.disabled,
                    ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    
                    userName,
                    style: TextStyles.regularBodyLarge(context)
                        ?.copyWith(color: ColorStyles.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    phone,
                    style: TextStyles.boldBodySmall(context)?.copyWith(
                      color: ColorStyles.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    userEmail,
                    style: TextStyles.boldBodySmall(context)?.copyWith(
                      color: ColorStyles.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
