import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:restoku_app/core/constants/text_style.dart';
import 'package:restoku_app/core/widgets/custom/theme_widget.dart';

class AppBarWidget extends StatelessWidget {
  final void Function() onPressed;
  const AppBarWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              'Restoku!',
              style: TextStyles.regularDisplaySmall(context)
                  ?.copyWith(color: CustomDecorations.darkThemeColor(context)),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
            ),
          ),
          IconButton(
            color: CustomDecorations.darkThemeColor(context),
            icon: const Icon(TablerIcons.sun),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
