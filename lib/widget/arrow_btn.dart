import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_theme.dart';

class ArrowBtn extends StatelessWidget {
  final Color bg;
  final VoidCallback onTap;

  const ArrowBtn({super.key, required this.bg, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
        child: const ImageIcon(AssetImage(AppAssets.arrow)),
      ),
    );
  }
}
