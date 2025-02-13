import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:provider/provider.dart';
import 'package:restoku_app/core/constants/color_style.dart';
import 'package:restoku_app/core/widgets/custom/box_decoration.dart';
import 'package:restoku_app/features/profile/services/theme_provider.dart';


class BottomNavbarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final bool isVertical;

  const BottomNavbarWidget({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.isVertical = false,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor:
              CustomDecorations.darkThemeBottomNavigationColor(context),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(TablerIcons.home_2),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(TablerIcons.building_store),
              label: 'Resto',
            ),
            BottomNavigationBarItem(
              icon: Icon(TablerIcons.user),
              label: 'Profile',
            ),
          ],
          currentIndex: currentIndex,
          selectedItemColor: ColorStyles.primary,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          onTap: onTap,
        );
      },
    );
  }
}
