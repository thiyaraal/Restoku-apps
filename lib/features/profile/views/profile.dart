import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

import 'package:restoku_app/core/constants/image_network.dart';
import 'package:restoku_app/core/helpers/app_routes.dart';
import 'package:restoku_app/core/widgets/custom/app_bar.dart';
import 'package:restoku_app/core/widgets/custom/theme_widget.dart';
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
    return Container(
        decoration: CustomDecorations.backgroundDecoration(context),
        child: Column(
          children: [
            const SizedBox(height: 50),
            AppBarWidget(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      ProfileHeader(
                        profileImage: ImageNetwork.profileImage,
                        phone: "08123456789",
                        userEmail: "thiyaraal@gmai.cmom",
                        userName: "Thhiyara Al-Mawaddah",
                        onTap: () {
                          // Navigator.pushNamed(context, AppRoutes.detailProfile);
                        },
                      ),
                      const SizedBox(height: 16),
                      CustomProfileSection(
                        title: 'Akun',
                        items: [
                          ProfileMenuItem(
                            iconTitle: TablerIcons.user,
                            title: 'Profil',
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.detailProfile);
                            },
                          ),
                          ProfileMenuItem(
                            iconTitle: TablerIcons.bowl,
                            title: 'Pesanan Saya',
                            onTap: () {
                              Navigator.pushNamed(context, AppRoutes.myOrder);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      CustomProfileSection(
                        title: 'Pengaturan',
                        items: [
                          ProfileMenuItem(
                            iconTitle: TablerIcons.color_filter,
                            title: "Ubah warna tema",
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.changeTheme,
                              );
                            },
                          ),
                          ProfileMenuItem(
                              iconTitle: TablerIcons.help,
                              title: "Bantuan",
                              onTap: () {
                                Navigator.pushNamed(context, AppRoutes.helps);
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
}
