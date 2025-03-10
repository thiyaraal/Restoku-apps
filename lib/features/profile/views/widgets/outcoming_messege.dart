import 'package:flutter/material.dart';
import 'package:restoku_app/core/constants/color_style.dart';
import 'package:restoku_app/core/constants/text_style.dart';

class SentMessege extends StatelessWidget {
  final String dateSentMessege;
  final String sentMessege;
  const SentMessege(
      {super.key, required this.sentMessege, required this.dateSentMessege});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: ColorStyles.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            sentMessege,
            style: TextStyles.boldBodyLarge(context)?.copyWith(
              color: ColorStyles.white,
            ),
          ),
        ),
        //jam kirim pesan
        const SizedBox(height: 8),
        Text(
          dateSentMessege,
          style: TextStyles.boldBodyLarge(context)?.copyWith(
              color: ColorStyles.white, fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}
