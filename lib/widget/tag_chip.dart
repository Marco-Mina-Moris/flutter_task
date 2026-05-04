import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_theme.dart';
import '../model/vehicle_model.dart';

class TagChip extends StatelessWidget {
  final VehicleTag tag;

  const TagChip({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(36),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            tag.iconAsset,
            width: 13,
            height: 13,
            color: AppColors.neutral100,
            errorBuilder: (_, __, ___) =>
                const Icon(Icons.circle, size: 13, color: AppColors.neutral100),
          ),
          const SizedBox(width: 4),
          Text(tag.label, style: AppText.medium(12, AppColors.neutral100)),
        ],
      ),
    );
  }
}
