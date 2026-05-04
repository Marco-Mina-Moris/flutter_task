import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_theme.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int>? onTap;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    this.onTap,
  });

  static const _icons = [
    AppAssets.home,
    AppAssets.search,
    AppAssets.history,
    AppAssets.profile,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(48),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(_icons.length, (i) {
                final active = selectedIndex == i;
                return GestureDetector(
                  onTap: () => onTap?.call(i),
                  child: Container(
                    width: 42,
                    height: 42,
                    margin:
                        EdgeInsets.only(right: i < _icons.length - 1 ? 12 : 0),
                    decoration: BoxDecoration(
                      color: active ? AppColors.primary : AppColors.surfaceCard,
                      shape: BoxShape.circle,
                    ),
                    child: ImageIcon(
                      AssetImage(_icons[i]),
                      color: AppColors.neutral100,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
