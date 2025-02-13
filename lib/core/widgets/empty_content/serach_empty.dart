import 'package:flutter/material.dart';
import 'package:restoku_app/core/constants/color_style.dart';
import 'package:restoku_app/core/constants/text_style.dart';

class SeacrhEmptyWidget extends StatelessWidget {
  final VoidCallback? onTap;
  const SeacrhEmptyWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/search.png',
          width: 100,
        ),
        const SizedBox(height: 20),
        Text('Silahkan cari restoran\ndan menu yang anda inginkan',
            textAlign: TextAlign.center,
            style: TextStyles.regularBodyLarge(context)?.copyWith(
              color: ColorStyles.white,
            )),
      ],
    );
  }
}
