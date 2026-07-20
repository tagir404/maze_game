import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  const AppColors({required this.coins});

  final Color coins;

  @override
  AppColors copyWith({Color? coins, Color? wall}) {
    return AppColors(coins: coins ?? this.coins);
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;

    return AppColors(coins: Color.lerp(coins, other.coins, t)!);
  }
}

extension ThemeDataX on ThemeData {
  AppColors get appColors => extension<AppColors>()!;
}
