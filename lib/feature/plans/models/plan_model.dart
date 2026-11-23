import 'package:fankosh/core/style/color_manager.dart';
import 'package:flutter/material.dart';

class PlanModel {
  final String id;
  final String title;
  final String? badge;
  final String? topBadge;
  final int price;
  final int attempts;
  final String durationText;
  final String perkText;
  final bool isCurrentPlan;
  final bool isPopular;
  final Color? borderColor;
  final Color? priceColor;

  String get featureDescription => perkText;

  const PlanModel({
    required this.id,
    required this.title,
    this.badge,
    this.topBadge,
    required this.price,
    required this.attempts,
    required this.durationText,
    required this.perkText,
    this.isCurrentPlan = false,
    this.isPopular = false,
    this.borderColor,
    this.priceColor,
  });

  static const List<PlanModel> defaultPlans = [
    PlanModel(
      id: 'lite',
      title: 'فانكوش لايت',
      badge: 'الأوفر',
      price: 290,
      attempts: 20,
      durationText: '20 محاولة • صالحة لمدة 30 يوم',
      perkText: '⚡ بحث أسرع وضحك اكتر',
      borderColor: ColorManager.borderColor,
    ),
    PlanModel(
      id: 'plus',
      title: 'فانكوش بلس',
      topBadge: '★ الأكثر اختيارًا',
      price: 350,
      attempts: 40,
      durationText: '40 محاولة • صالحة لمدة 30 يوم',
      perkText: '👑 بحث أسرع و افيهات اكتر',
      isPopular: true,
      borderColor: ColorManager.primaryColor,
      priceColor: ColorManager.goldAmber,
    ),
    PlanModel(
      id: 'pro',
      title: 'فانكوش برو',
      price: 599,
      attempts: 100,
      durationText: '100 محاولة • صالحة لمدة 30 يوم',
      perkText: '⚡ بحث أسرع',
      borderColor: ColorManager.borderColor,
    ),
  ];

  static const List<PlanModel> samplePlans = defaultPlans;
}
