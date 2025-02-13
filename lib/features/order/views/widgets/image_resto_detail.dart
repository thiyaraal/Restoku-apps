import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class ImageDetailResto extends StatelessWidget {

  final String imageUrl;
  final String imageTag;
  final double height;
  final VoidCallback? onBack;

  const ImageDetailResto({
    super.key,
    required this.imageUrl,
    required this.imageTag,
    this.height = 250,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: imageTag,
          child: Image.network(
            imageUrl,
            height: height,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: IconButton(
            icon: const Icon(
              TablerIcons.chevron_left,
              size: 24,
              color: Colors.white,
            ),
            onPressed: onBack ?? () => Navigator.pop(context),
          ),
        ),
      ],
    );
  }
}
