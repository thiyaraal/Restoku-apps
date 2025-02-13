import 'package:flutter/material.dart';
import 'package:restoku_app/core/constants/color_style.dart';
import 'package:restoku_app/core/constants/text_style.dart';
import 'package:restoku_app/core/widgets/custom/box_decoration.dart';

class ProfileHeader extends StatelessWidget {
  final String profileImage;
  final String userName;
  final String phone;
  final String userEmail;
  final VoidCallback onTap;

  const ProfileHeader(
      {super.key,
      required this.onTap,
      required this.profileImage,
      required this.userName,
      required this.phone,
      required this.userEmail});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
              child: CircleAvatar(
                radius: 36,
                backgroundImage: NetworkImage(
                  profileImage,
                ),
              ),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: TextStyles. 
                 regularBodyLarge(context)?.copyWith(
                                    color: ColorStyles.white
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  phone,
                  style: TextStyles.boldBodySmall(context)?.copyWith(
                    color: ColorStyles.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  userEmail,
                  style: TextStyles.
                  boldBodySmall(context)?.copyWith(
                    color: ColorStyles.white,
                  ),
                ),
              ],
            ),
           
          ],
        ),
      ),
    );
  }
}
