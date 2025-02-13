import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:provider/provider.dart';
import 'package:restoku_app/core/constants/color_style.dart';
import 'package:restoku_app/core/constants/image_network.dart';
import 'package:restoku_app/core/constants/text_style.dart';
import 'package:restoku_app/core/widgets/custom/app_bar.dart';
import 'package:restoku_app/core/widgets/custom/box_decoration.dart';
import 'package:restoku_app/core/widgets/snackbar/top_snackbar.dart';
import 'package:restoku_app/features/profile/services/theme_provider.dart';
import 'package:restoku_app/features/profile/views/widgets/profile_header.dart';
import 'package:restoku_app/features/profile/views/widgets/profile_menu_item.dart';
import 'package:restoku_app/features/profile/views/widgets/profile_section.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Container(
        decoration: CustomDecorations.backgroundDecoration(context),
        child: Column(
          children: [
            const SizedBox(height: 50),
            AppBarWidget(onPressed: themeProvider.toggleTheme),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  ProfileHeader(
                    profileImage: ImageNetwork.profileImage,
                    phone: "08123456789",
                    userEmail: "thiyaraal@gmai.cmom",
                    userName: "Thhiyara Al-Mawaddah",
                    onTap: () {},
                  ),
                  const SizedBox(height: 16),
                  CustomProfileSection(
                    title: 'Akun',
                    items: [
                      ProfileMenuItem(
                        iconTitle: TablerIcons.user,
                        title: 'Profil',
                        onTap: () {
                          TopSnackBarWidget.showInfoSnackBar(
                              context, "On Going gess");
                        },
                      ),
                      ProfileMenuItem(
                        iconTitle: TablerIcons.bowl,
                        title: 'Pesanan Saya',
                        onTap: () {
                          TopSnackBarWidget.showInfoSnackBar(
                              context, "On Going gess");
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  CustomProfileSection(
                    title: 'Pengaturan',
                    items: [
                      ProfileMenuItem(
                        iconTitle: TablerIcons.settings,
                        title: "Privasi & Keamanan",
                        onTap: () {
                          TopSnackBarWidget.showInfoSnackBar(
                              context, "On Going gess");
                        },
                      ),
                      ProfileMenuItem(
                            iconTitle: TablerIcons.help,
                        title: "Bantuan",
                        onTap: () {
                          TopSnackBarWidget.showInfoSnackBar(
                              context, "On Going gess");
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  CustomProfileSection(
                    title: 'Lainnya',
                    items: [
                      ProfileMenuItem(
                        iconTitle: TablerIcons.file_description,
                        title: "Syarat & Ketentuan",
                        onTap: () {
                          TopSnackBarWidget.showInfoSnackBar(
                              context, "On Going gess");
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        TopSnackBarWidget.showInfoSnackBar(
                            context, "Belum ada login nya kan ");
                      },
                      child: Text(
                        "Logout",
                        style: TextStyles.boldBodyLarge(context)
                            ?.copyWith(color: ColorStyles.white),
                      ),
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
