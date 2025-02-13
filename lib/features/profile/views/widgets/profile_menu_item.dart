import 'package:flutter/material.dart';
import 'package:restoku_app/core/constants/color_style.dart';
import 'package:restoku_app/core/constants/text_style.dart';
import 'package:restoku_app/core/widgets/custom/theme_widget.dart';


class ProfileMenuItem extends StatelessWidget {
  final IconData iconTitle;
  final String title;
  final Widget? trailing;
  final Color? leadingBackgroundColor;
  final Color? leadingIconColor;
  final VoidCallback? onTap;

  const ProfileMenuItem({super.key, 
    required this.iconTitle,

    required this.title,
    this.trailing,
    this.leadingBackgroundColor,
    this.leadingIconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      leading: SizedBox(
        width: 30,
        height: 30,
        child: Icon(
          iconTitle,
          color: ColorStyles.white,
          
        )
      ),
      title: Text(title,
          style: TextStyles.regularBodyMedium(context)?.copyWith(
            color: ColorStyles.white,
          )),
      trailing: trailing ??
          Icon(
            Icons.chevron_right,
               color: CustomDecorations.darkThemeColor(context),
          ),
      onTap: onTap,
    );
  }
}
