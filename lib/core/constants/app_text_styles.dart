import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_constants.dart';

class AppTextStyles {
  // Başlıklar
  static const TextStyle titleLarge = TextStyle(
    fontSize: AppConstants.fontSizeTitle,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: AppConstants.fontSizeXXL,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle titleSmall = TextStyle(
    fontSize: AppConstants.fontSizeXL,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // Body metinler
  static const TextStyle bodyLarge = TextStyle(
    fontSize: AppConstants.fontSizeL,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: AppConstants.fontSizeM,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: AppConstants.fontSizeS,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );

  // Özel stiller
  static const TextStyle price = TextStyle(
    fontSize: AppConstants.fontSizeXL,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static const TextStyle priceOld = TextStyle(
    fontSize: AppConstants.fontSizeM,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    decoration: TextDecoration.lineThrough,
  );

  static const TextStyle label = TextStyle(
    fontSize: AppConstants.fontSizeXS,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  static const TextStyle button = TextStyle(
    fontSize: AppConstants.fontSizeM,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
