import 'package:flutter/material.dart';
import 'package:frontend/features/hero/domain/entity/hero.dart';

extension TierUi on Tier {
  Color get color {
    return switch (this) {
      Tier.S => const Color(0xFFFFD700),
      Tier.A => const Color(0xFFE2E2E2),
      Tier.B => const Color(0xFFCD7F32),
      Tier.C => const Color(0xFF4FC3F7),
    };
  }
}