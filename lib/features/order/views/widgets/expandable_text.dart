import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restoku_app/features/order/view_models/expanded_provider.dart';

class ExpandableText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final int maxLines;
  final int id; 

  const ExpandableText({
    super.key,
    required this.text,
    required this.id,
    this.style,
    this.maxLines = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpandableTextProvider>(
      builder: (context, provider, child) {
        bool isExpanded = provider.isExpanded(id);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: style,
              maxLines: isExpanded ? null : maxLines,
              overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
            ),
            const SizedBox(height: 5),
            GestureDetector(
              onTap: () => provider.toggleExpanded(id),
              child: Text(
                isExpanded ? "Read Less" : "Read More",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
