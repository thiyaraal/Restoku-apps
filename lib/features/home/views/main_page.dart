import 'package:flutter/material.dart';
import 'package:restoku_app/features/home/views/home_screen.dart';
import 'package:restoku_app/features/home/views/widgets/bottom_navbar.dart';
import 'package:restoku_app/features/order/views/resto_list.dart';
import 'package:restoku_app/features/profile/views/profile.dart';

class MainScreen extends StatefulWidget {
  final int? activeScreen;
  const MainScreen({super.key, this.activeScreen});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedNavbar = 0;

  @override
  void initState() {
    super.initState();
    
    if (widget.activeScreen != null) {
      _selectedNavbar = widget.activeScreen!;
    }
  }

  void _changeSelectedNavbar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  Widget screenBottomNavigation(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return RestoListScreen();
      case 2:
        return ProfileScreen();
      default:
        return const HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isWideScreen = constraints.maxWidth > 600;

        return Scaffold(
          body: Row(
            children: [
              
              if (isWideScreen)
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: BottomNavbarWidget(
                          currentIndex: _selectedNavbar,
                          onTap: _changeSelectedNavbar,
                          isVertical:
                              true, 
                        ),
                      ),
                    ),
                  ],
                ),
              
              Expanded(
                flex: 4, 
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 1000),
                  child: screenBottomNavigation(_selectedNavbar),
                ),
              ),
            ],
          ),
          
          bottomNavigationBar: isWideScreen
              ? null
              : BottomNavbarWidget(
                  currentIndex: _selectedNavbar,
                  onTap: _changeSelectedNavbar,
                ),
        );
      },
    );
  }
}
