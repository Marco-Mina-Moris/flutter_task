import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_theme.dart';
import 'package:flutter_task/model/vehicle_model.dart';
import 'package:flutter_task/widget/feature_card.dart';
import 'package:flutter_task/widget/bottom_nav_bar.dart';

class DetailScreen extends StatefulWidget {
  final Vehicle vehicle;

  const DetailScreen({super.key, required this.vehicle});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int days = 12;

  int get total => widget.vehicle.priceInt * days;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceSecondary,
      body: SafeArea(
        child: Column(
          children: [
            buildAppBar(context),
            Expanded(
              child: Stack(children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  height: 240,
                  child: ClipRect(
                    child: Align(
                      alignment: widget.vehicle.imageAlignment,
                      heightFactor: widget.vehicle.heightFactor,
                      child: Image.asset(
                        widget.vehicle.imageAsset,
                        width: double.infinity,
                        height: 260,
                        fit: BoxFit.contain,
                        alignment: widget.vehicle.imageAlignment,
                        errorBuilder: (_, __, ___) => Container(
                          color: AppColors.surfaceCard,
                          child: const Icon(Icons.two_wheeler,
                              size: 100, color: Colors.black26),
                        ),
                      ),
                    ),
                  ),
                ),
                // Scrollable content
                SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 200, 24, 40),
                  child: Column(children: [
                    buildProductCard(),
                    const SizedBox(height: 16),
                    buildDaysCard(),
                    const SizedBox(height: 12),
                    buildPriceCard(),
                  ]),
                ),
              ]),
            ),
            const ColoredBox(
              color: AppColors.surfaceSecondary,
              child: BottomNavBar(selectedIndex: 1),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Row(children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: 42,
            height: 42,
            decoration: const BoxDecoration(
                color: AppColors.surfaceCard, shape: BoxShape.circle),
            child: const ImageIcon(
              AssetImage(AppAssets.arrowBack),
              color: AppColors.neutral100,
            ),
          ),
        ),
        const Spacer(),
        Text('Detalhes', style: AppText.medium(16, AppColors.text0)),
        const Spacer(),
        Container(
          width: 42,
          height: 42,
          decoration: const BoxDecoration(
              color: AppColors.surfaceCard, shape: BoxShape.circle),
          child: const ImageIcon(
            AssetImage(AppAssets.share),
            color: AppColors.neutral100,
          ),
        ),
      ]),
    );
  }

  Widget buildProductCard() {
    final features = [
      widget.vehicle.speedF,
      widget.vehicle.recharge,
      widget.vehicle.capacity,
      widget.vehicle.gps,
    ];
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.surfaceCard,
          borderRadius: BorderRadius.circular(16)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
                color: AppColors.surfaceSecondary, shape: BoxShape.circle),
            child: Center(
              child: Image.asset(
                AppAssets.dolar,
                width: 20,
                height: 20,
                color: AppColors.neutral100,
                errorBuilder: (_, __, ___) => const ImageIcon(
                  AssetImage(AppAssets.dolar),
                  color: AppColors.neutral100,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              '${widget.vehicle.name} ${widget.vehicle.vendorName}',
              style: AppText.bold(18, AppColors.text0),
            ),
            const SizedBox(height: 2),
            Text('${widget.vehicle.price} / dia',
                style: AppText.medium(14, AppColors.text200)),
          ]),
        ]),
        const SizedBox(height: 16),
        Container(height: 1, color: const Color(0xFFDDDDDD)),
        const SizedBox(height: 16),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 144 / 72,
          children: features.map((f) => FeatureCard(feature: f)).toList(),
        ),
      ]),
    );
  }

  Widget buildDaysCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 19),
      decoration: BoxDecoration(
          color: AppColors.surfaceCard,
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              if (days > 1) setState(() => days--);
            },
            child: Container(
              width: 42,
              height: 42,
              decoration: const BoxDecoration(
                  color: AppColors.primary, shape: BoxShape.circle),
              child: const Icon(Icons.remove,
                  color: AppColors.neutral100, size: 20),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text('$days', style: AppText.extraBold(24, AppColors.text0)),
              const SizedBox(width: 8),
              Text('dias', style: AppText.extraBold(18, AppColors.text0)),
            ],
          ),
          GestureDetector(
            onTap: () => setState(() => days++),
            child: Container(
              width: 42,
              height: 42,
              decoration: const BoxDecoration(
                  color: AppColors.primary, shape: BoxShape.circle),
              child:
                  const Icon(Icons.add, color: AppColors.neutral100, size: 20),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPriceCard() {
    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
          color: AppColors.primary, borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Preço total',
                  style: AppText.regular(14, AppColors.neutral400)),
              const SizedBox(height: 2),
              Text('R\$ $total',
                  style: AppText.extraBold(18, AppColors.neutral100)),
            ],
          ),
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: const Text('Reserva confirmada! 🎉'),
                backgroundColor: Colors.black87,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(420)),
              child: Row(children: [
                Text('Alugar', style: AppText.medium(14, AppColors.neutral100)),
                const SizedBox(width: 4),
                const Icon(Icons.arrow_forward_rounded,
                    size: 18, color: AppColors.neutral100),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
