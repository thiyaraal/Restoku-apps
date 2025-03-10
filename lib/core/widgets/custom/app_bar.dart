import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:restoku_app/core/constants/text_style.dart';
import 'package:restoku_app/core/widgets/custom/theme_widget.dart';
import 'package:restoku_app/features/notification/views/notif_detail.dart';

class AppBarWidget extends StatefulWidget {
  final double? fontSize;
  final String? title;
  const AppBarWidget({super.key, this.title, this.fontSize});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
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
              // tittle ?? 'Restoku!',

              widget.title ?? 'Restoku!',

              style: TextStyles.regularDisplaySmall(context)?.copyWith(
                  fontSize: widget.fontSize ?? 36,
                  color: CustomDecorations.darkThemeColor(context)),
              overflow: TextOverflow.ellipsis,

              maxLines: 1,
              softWrap: false,
            ),
          ),
          IconButton(
            icon: Icon(
              TablerIcons.bell,
              color: CustomDecorations.darkThemeColor(context),
            ),
            onPressed: () {
              //detail notification
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotificationScreen()));
            },
          ),
        ],
      ),
    );
  }
}
