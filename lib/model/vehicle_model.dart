import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_theme.dart';

class Vehicle {
  final String name;
  final String vendorName;
  final String price;
  final String priceUnit;
  final String description;
  final String type;
  final List<VehicleTag> tags;
  final VehicleFeature speedF;
  final VehicleFeature recharge;
  final VehicleFeature capacity;
  final VehicleFeature gps;
  final String imageAsset;
  final CardStyle cardStyle;
  final Alignment imageAlignment;
  final double heightFactor;

  const Vehicle({
    required this.name,
    required this.vendorName,
    required this.price,
    required this.priceUnit,
    required this.description,
    required this.type,
    required this.tags,
    required this.speedF,
    required this.recharge,
    required this.capacity,
    required this.gps,
    required this.imageAsset,
    required this.cardStyle,
    this.imageAlignment = Alignment.center,
    this.heightFactor = 1.0,
  });

  int get priceInt => int.tryParse(price.replaceAll(RegExp(r'[^\d]'), '')) ?? 0;
}

enum CardStyle { highlighted, imageLeft, imageRight }

class VehicleTag {
  final String label;
  final String iconAsset;

  const VehicleTag(this.label, this.iconAsset);
}

class VehicleFeature {
  final String value;
  final String description;
  final String iconAsset;

  const VehicleFeature(this.value, this.description, this.iconAsset);
}

final List<Vehicle> vehicles = [
  const Vehicle(
    name: 'Chopper',
    vendorName: 'UrbanRider',
    price: 'R\$96',
    priceUnit: '/dia',
    description: '',
    type: 'electric',
    cardStyle: CardStyle.highlighted,
    imageAsset: AppAssets.bikeOne,
    imageAlignment: Alignment.center,
    tags: [
      VehicleTag('45 km/h', AppAssets.speed),
      VehicleTag('Elétrica', AppAssets.electric),
      VehicleTag('GPS on', AppAssets.box),
    ],
    speedF: VehicleFeature('45km/h', 'Velocidade máxima', AppAssets.speed),
    recharge: VehicleFeature('2 horas', 'Tempo de recarga', AppAssets.history),
    capacity: VehicleFeature(
        '1 pessoa', 'Capacidade de passageiros', AppAssets.profile),
    gps: VehicleFeature('GPS on', 'Integrado', AppAssets.box),
  ),
  const Vehicle(
    name: 'Patinete',
    vendorName: 'SwiftGo',
    price: 'R\$30',
    priceUnit: '/dia',
    description:
        'Mobilidade prática e sustentável para deslocamentos rápidos e seguros.',
    type: 'electric',
    cardStyle: CardStyle.imageLeft,
    imageAsset: AppAssets.bikeTwo,
    imageAlignment: Alignment.topCenter,
    heightFactor: 0.7,
    tags: [],
    speedF: VehicleFeature('25km/h', 'Velocidade máxima', AppAssets.speed),
    recharge: VehicleFeature('1 hora', 'Tempo de recarga', AppAssets.history),
    capacity: VehicleFeature(
        '1 pessoa', 'Capacidade de passageiros', AppAssets.profile),
    gps: VehicleFeature('GPS off', 'Não integrado', AppAssets.box),
  ),
  const Vehicle(
    name: 'Vespa',
    vendorName: 'Vespa 300',
    price: 'R\$96',
    priceUnit: '/dia',
    description:
        'Elegância retrô e mobilidade urbana com conforto e eficiência elétrica.',
    type: 'combustion',
    cardStyle: CardStyle.imageRight,
    imageAsset: AppAssets.bikeThree,
    imageAlignment: Alignment.center,
    tags: [],
    speedF: VehicleFeature('60km/h', 'Velocidade máxima', AppAssets.speed),
    recharge: VehicleFeature('3 horas', 'Tempo de recarga', AppAssets.history),
    capacity: VehicleFeature(
        '2 pessoas', 'Capacidade de passageiros', AppAssets.profile),
    gps: VehicleFeature('GPS on', 'Integrado', AppAssets.box),
  ),
];
