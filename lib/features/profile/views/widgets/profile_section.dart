import 'package:flutter/material.dart';
import 'package:restoku_app/core/constants/text_style.dart';
import 'package:restoku_app/core/widgets/custom/box_decoration.dart';

class CustomProfileSection extends StatelessWidget {
  final String title; 
  final List<Widget> items; 

  const CustomProfileSection({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyles.boldHeadlineSmall(context)?.copyWith(
                 color: CustomDecorations.darkThemeColor(context),
            )),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
          color: CustomDecorations.darkThemeColor(context),
            ),
          ),
          child: Column(
            children: items.map((item) {
              int index = items.indexOf(item);
              return Column(
                children: [
                  item,
                  if (index !=
                      items.length - 1) 
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Divider(
                        height: 1,
                        thickness: 1,
                         color: CustomDecorations.darkThemeColor(context),
                      ),
                    ),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
