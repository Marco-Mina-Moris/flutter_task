import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_theme.dart';
import 'package:flutter_task/model/vehicle_model.dart';

class FeatureCard extends StatelessWidget {
  final VehicleFeature feature;

  const FeatureCard({super.key, required this.feature});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(11, 10, 11, 10),
      decoration: BoxDecoration(
        color: AppColors.surfaceSecondary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(children: [
        Image.asset(
          feature.iconAsset,
          width: 24,
          height: 24,
          color: AppColors.neutral100,
          errorBuilder: (_, __, ___) =>
              const Icon(Icons.info_outline, size: 24, color: AppColors.text0),
        ),
        const SizedBox(width: 9),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(feature.value, style: AppText.bold(14, AppColors.text0)),
              const SizedBox(height: 2),
              Text(
                feature.description,
                style: AppText.regular(11, AppColors.text300),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
