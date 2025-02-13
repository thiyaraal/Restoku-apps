import 'package:flutter/material.dart';
import 'package:restoku_app/core/constants/color_style.dart';
import 'package:restoku_app/core/constants/text_style.dart';

class BadNetworkWidget extends StatelessWidget {
  final VoidCallback? onTap;
  const BadNetworkWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/bad_network.png',
          width: 120,
        ),
        const SizedBox(height: 20),
        const Text(
          'Network issue Detected.\nPlease Try Again.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        
        TextButton(
          onPressed: onTap,
          child: Text('Refresh',
              style: TextStyles.boldBodyLarge(context)
                  ?.copyWith(color: ColorStyles.primary)),
        )
      ],
    );
  }
}
