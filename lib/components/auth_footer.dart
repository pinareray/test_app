import 'package:flutter/material.dart';
import '../core/constants/app_constants.dart';
import '../core/constants/app_text_styles.dart';

// Kayıt/ giriş gibi sayfalarda en altta görünen, yönlendirici bir satır için tasarladığım widget
class AuthFooter extends StatelessWidget {
  final String leadingText;
  final String actionText;
  final VoidCallback onActionPressed;

  const AuthFooter({
    super.key,
    required this.leadingText,
    required this.actionText,
    required this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppConstants.paddingL),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            leadingText,
            style: AppTextStyles.bodyMedium.copyWith(
              color: Colors.white.withValues(alpha: 0.8),
            ),
          ),
          GestureDetector(
            onTap: onActionPressed,
            child: Text(
              actionText,
              style: AppTextStyles.bodyMedium.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
