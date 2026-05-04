import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_theme.dart';
import '../model/vehicle_model.dart';
import 'tag_chip.dart';
import 'arrow_btn.dart';

class VehicleCard extends StatelessWidget {
  final Vehicle vehicle;
  final VoidCallback onTap;

  const VehicleCard({super.key, required this.vehicle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    switch (vehicle.cardStyle) {
      case CardStyle.highlighted:
        return HighlightedCard(vehicle: vehicle, onTap: onTap);
      case CardStyle.imageLeft:
        return SideCard(vehicle: vehicle, onTap: onTap, imageOnLeft: true);
      case CardStyle.imageRight:
        return SideCard(vehicle: vehicle, onTap: onTap, imageOnLeft: false);
    }
  }
}

class HighlightedCard extends StatelessWidget {
  final Vehicle vehicle;
  final VoidCallback onTap;

  const HighlightedCard(
      {super.key, required this.vehicle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 254,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(children: [
          Positioned(
            left: -7,
            bottom: 0,
            child: Container(
              width: 400,
              height: 102,
              color: Colors.white.withOpacity(0.48),
            ),
          ),
          Positioned(
            right: -16,
            top: 27,
            width: 279.51,
            height: 186.49,
            child: Image.asset(
              vehicle.imageAsset,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => const Icon(Icons.two_wheeler,
                  size: 100, color: Colors.black26),
            ),
          ),
          Positioned(
            left: 16,
            top: 24,
            child: Text(vehicle.name,
                style: AppText.extraBold(24, AppColors.text0)),
          ),
          Positioned(
            left: 16,
            top: 62,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: vehicle.tags
                  .map((t) => Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: TagChip(tag: t),
                      ))
                  .toList(),
            ),
          ),

          Positioned(
            left: 16,
            bottom: 18,
            child: Row(children: [
              Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child: Center(
                  child: Image.asset(AppAssets.dolar,
                      width: 18,
                      height: 18,
                      errorBuilder: (_, __, ___) =>
                          const ImageIcon(AssetImage(AppAssets.dolar))),
                ),
              ),
              const SizedBox(width: 8),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(vehicle.vendorName,
                    style: AppText.medium(12, AppColors.neutral400)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(vehicle.price,
                        style: AppText.bold(20, AppColors.text0)),
                    const SizedBox(width: 2),
                    Text(vehicle.priceUnit,
                        style: AppText.medium(12, AppColors.neutral400)),
                  ],
                ),
              ]),
            ]),
          ),
          // arrow
          Positioned(
            right: 16,
            bottom: 18,
            child: ArrowBtn(bg: Colors.white, onTap: onTap),
          ),
        ]),
      ),
    );
  }
}

class SideCard extends StatelessWidget {
  final Vehicle vehicle;
  final VoidCallback onTap;
  final bool imageOnLeft;

  const SideCard({
    super.key,
    required this.vehicle,
    required this.onTap,
    required this.imageOnLeft,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 192,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: AppColors.surfaceCard,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(children: [
          Positioned(
            left: imageOnLeft ? 0 : null,
            right: imageOnLeft ? null : 0,
            top: 0,
            bottom: 0,
            width: imageOnLeft ? 180 : 160,
            child: Image.asset(
              vehicle.imageAsset,
              fit: BoxFit.cover,
              alignment:
                  imageOnLeft ? Alignment.centerLeft : Alignment.centerRight,
              errorBuilder: (_, __, ___) => const Icon(Icons.two_wheeler,
                  size: 80, color: Colors.black26),
            ),
          ),
          Positioned(
            left: imageOnLeft ? null : 16,
            right: imageOnLeft ? 16 : null,
            top: 24,
            width: 180,
            child: Text(
              vehicle.name,
              textAlign: imageOnLeft ? TextAlign.right : TextAlign.left,
              style: AppText.extraBold(18, AppColors.text0),
            ),
          ),
          Positioned(
            left: imageOnLeft ? null : 16,
            right: imageOnLeft ? 16 : null,
            top: 54,
            width: 180,
            child: Text(
              vehicle.description,
              textAlign: imageOnLeft ? TextAlign.right : TextAlign.left,
              style: AppText.medium(12, AppColors.text200),
            ),
          ),
          Positioned(
            left: imageOnLeft ? null : 74,
            right: imageOnLeft ? 74 : null,
            bottom: 18,
            child: Column(
              crossAxisAlignment: imageOnLeft
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Text(vehicle.vendorName,
                    style: AppText.medium(12, AppColors.text400)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(vehicle.price,
                        style: AppText.bold(20, AppColors.text0)),
                    const SizedBox(width: 2),
                    Text(vehicle.priceUnit,
                        style: AppText.medium(12, AppColors.text200)),
                  ],
                ),
              ],
            ),
          ),
          // arrow
          Positioned(
            left: imageOnLeft ? null : 16,
            right: imageOnLeft ? 16 : null,
            bottom: 18,
            child: ArrowBtn(bg: AppColors.primary, onTap: onTap),
          ),
        ]),
      ),
    );
  }
}
