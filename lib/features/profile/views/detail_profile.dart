import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:restoku_app/core/constants/color_style.dart';
import 'package:restoku_app/core/constants/image_network.dart';
import 'package:restoku_app/core/constants/text_style.dart';
import 'package:restoku_app/core/widgets/button/row_button.dart';
import 'package:restoku_app/core/widgets/custom/theme_widget.dart';
import 'package:restoku_app/features/profile/views/widgets/profile_menu_item.dart';

class DetailProfileScreen extends StatefulWidget {
  const DetailProfileScreen({super.key});

  @override
  State<DetailProfileScreen> createState() => _DetailProfileScreenState();
}

class _DetailProfileScreenState extends State<DetailProfileScreen> {
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
           title: 'Profil',
             ),
            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: ClipOval(
                    child: Image.network(
                      ImageNetwork.profileImage,
                      fit: BoxFit.cover,
                      width: 160,
                      height: 160,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 160,
                          height: 160,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            // ignore: deprecated_member_use
                            color: ColorStyles.disabled.withOpacity(0.3),
                          ),
                          child: Icon(
                            TablerIcons.user,
                            size: 40,
                            color: ColorStyles.disabled,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Thiyara Al- Mawaddah',
                  style: TextStyles.regularHeadlineSmall(context)
                      ?.copyWith(color: ColorStyles.white),
                ),
                ProfileMenuItem(
                  iconTitle: TablerIcons.phone,
                  title: '08123456789',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  iconTitle: TablerIcons.mail,
                  title: 'thiyaraal@gmail.com',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  iconTitle: TablerIcons.location,
                  title: 'Medan, Indonesia',
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
