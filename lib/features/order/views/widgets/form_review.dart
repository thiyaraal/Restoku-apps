import 'package:flutter/material.dart';
import 'package:restoku_app/core/constants/color_style.dart';
import 'package:restoku_app/core/constants/text_style.dart';
import 'package:restoku_app/core/widgets/button/elevated_button.dart';
import 'package:restoku_app/core/widgets/custom/box_decoration.dart';


class ReviewFormWidget extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController reviewController;
  final VoidCallback onSend;

  const ReviewFormWidget({
    super.key,
    required this.nameController,
    required this.reviewController,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: CustomDecorations.darkThemeColor(context),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: CustomDecorations.darkThemeColor(context),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Masukan nama kamu',
                hintStyle: TextStyles.regularBodyMedium(context)?.copyWith(
                  color: ColorStyles.disabled,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: CustomDecorations.darkThemeColor(context),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: reviewController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Silahkan masukan review kamu",
                hintStyle: TextStyles.regularBodyMedium(context)?.copyWith(
                  color: ColorStyles.disabled,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10.0, right: 10),
            child: Align(
              alignment: Alignment.centerRight,
              child: CustomElevatedButton(
                height: 32,
                width: 150,
                onPressed: onSend,
                variant: ButtonVariant.primary,
                labelText: "Kirim Review",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
