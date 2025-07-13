import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_constants.dart';
import '../core/constants/app_text_styles.dart';

//Arama çubuğu widgetı
class CustomSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final VoidCallback? onFilterTap;
  final Function(String)? onChanged; // Kullanıcı yazdıkça çağrılır

  const CustomSearchBar({
    super.key,
    this.controller,
    this.hintText = 'Ne arıyorsunuz?',
    this.onFilterTap,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(AppConstants.radiusCircular),
      ),
      child: Row(
        children: [
          const SizedBox(width: AppConstants.paddingM),
          const Icon(
            Icons.search,
            color: AppColors.textSecondary,
            size: AppConstants.iconSizeM,
          ),
          const SizedBox(width: AppConstants.paddingS),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              style: AppTextStyles.bodyMedium,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textDisabled,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(AppConstants.radiusCircular),
            ),
            child: IconButton(
              onPressed: onFilterTap,
              icon: const Icon(
                Icons.tune,
                color: Colors.white,
                size: AppConstants.iconSizeM,
              ),
            ),
          ),
        ],
      ),
    );
  }
}