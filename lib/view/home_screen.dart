import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_theme.dart';
import 'package:flutter_task/model/vehicle_model.dart';
import 'package:flutter_task/view/detail_screen.dart';
import 'package:flutter_task/widget/bottom_nav_bar.dart';
import 'package:flutter_task/widget/vehicle_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedNav = 0;
  int selectedFilter = 0;
  final filters = ['Todos', 'Elétricos', 'Combustão'];

  List<Vehicle> get _filtered {
    if (selectedFilter == 0) return vehicles;
    if (selectedFilter == 1) {
      return vehicles.where((v) => v.type == 'electric').toList();
    }
    return vehicles.where((v) => v.type == 'combustion').toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfacePrimary,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                buildHeader(),
                const SizedBox(height: 16),
                buildSearchBar(),
                const SizedBox(height: 12),
                buildFilterRow(),
                const SizedBox(height: 12),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 100),
                    itemCount: _filtered.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 16),
                    itemBuilder: (ctx, i) {
                      final v = _filtered[i];
                      return VehicleCard(
                        vehicle: v,
                        onTap: () => Navigator.push(
                          ctx,
                          MaterialPageRoute(
                              builder: (_) => DetailScreen(vehicle: v)),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: BottomNavBar(
                selectedIndex: selectedNav,
                onTap: (i) => setState(() => selectedNav = i),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 16, 25, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Olá,', style: AppText.extraBold(16, AppColors.text0)),
              const SizedBox(height: 4),
              Text('Bruna', style: AppText.medium(16, AppColors.text200)),
            ],
          ),
          Stack(clipBehavior: Clip.none, children: [
            Container(
              width: 42,
              height: 42,
              decoration: const BoxDecoration(
                  color: AppColors.surfaceCard, shape: BoxShape.circle),
              child: Center(
                child: Image.asset(
                  AppAssets.notifications,
                  width: 22,
                  height: 22,
                  color: AppColors.neutral100,
                  errorBuilder: (_, __, ___) =>
                      const Icon(Icons.notifications_outlined, size: 22),
                ),
              ),
            ),
            Positioned(
              top: 1,
              right: 2,
              child: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                    color: AppColors.primary, shape: BoxShape.circle),
              ),
            ),
          ]),
        ],
      ),
    );
  }

  Widget buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(children: [
        Expanded(
          child: Container(
            height: 36,
            decoration: BoxDecoration(
                color: AppColors.surfaceActions,
                borderRadius: BorderRadius.circular(48)),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(children: [
              Image.asset(AppAssets.search,
                  width: 18,
                  height: 18,
                  color: AppColors.neutral400,
                  errorBuilder: (_, __, ___) => const Icon(Icons.search,
                      size: 18, color: AppColors.neutral400)),
              const SizedBox(width: 8),
              Text('Search', style: AppText.medium(14, AppColors.neutral400)),
            ]),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
              color: AppColors.surfaceActions,
              borderRadius: BorderRadius.circular(81)),
          child: Center(
            child: Image.asset(AppAssets.iconsFilter,
                width: 18,
                height: 18,
                color: AppColors.neutral100,
                errorBuilder: (_, __, ___) => const Icon(Icons.tune, size: 18)),
          ),
        ),
      ]),
    );
  }

  Widget buildFilterRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: List.generate(filters.length, (i) {
          final active = selectedFilter == i;
          return Padding(
            padding: EdgeInsets.only(right: i < filters.length - 1 ? 8 : 0),
            child: GestureDetector(
              onTap: () => setState(() => selectedFilter = i),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 32,
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: active ? AppColors.primary : AppColors.surfaceActions,
                  borderRadius: BorderRadius.circular(36),
                ),
                child: Text(filters[i],
                    style: AppText.medium(
                        14, active ? AppColors.neutral100 : AppColors.text400)),
              ),
            ),
          );
        }),
      ),
    );
  }
}
