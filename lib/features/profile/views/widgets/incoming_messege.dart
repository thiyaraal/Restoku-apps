import 'package:flutter/material.dart';
import 'package:restoku_app/core/constants/color_style.dart';
import 'package:restoku_app/core/constants/text_style.dart';

class IncomingAdminMessege extends StatelessWidget {
  final String imageProfile;

  final String dateTimeMessege;
  final String incomingMessege;

  const IncomingAdminMessege(
      {super.key,
      required this.imageProfile,
      required this.dateTimeMessege,
      required this.incomingMessege});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(
                imageProfile,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dateTimeMessege,
                  style: TextStyles.boldBodyMedium(context)?.copyWith(color: ColorStyles.white),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: ColorStyles.tertiary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    incomingMessege,
                    style: TextStyles.regularBodyLarge(context),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
