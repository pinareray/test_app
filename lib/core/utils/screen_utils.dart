import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

/// Responsive tasarım için ekran boyutu yardımcı sınıfı
class ScreenUtils {
  // Screen size categorileri
  static bool isSmallPhone(BuildContext context) =>
      MediaQuery.of(context).size.width < 350;
      
  static bool isPhone(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;
      
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 && 
      MediaQuery.of(context).size.width < 1024;
      
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;
      
  static bool isLandscape(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.landscape;
      
  // Screen dimensions
  static double getScreenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
      
  static double getScreenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
      
  // Grid responsive values
  static int getGridCrossAxisCount(BuildContext context) {
    final width = getScreenWidth(context);
    if (width > 900) return 4;      // Desktop
    if (width > 600) return 3;      // Tablet
    if (width > 400) return 2;      // Büyük telefon
    return 1;                       // Küçük telefon
  }

  static double getGridChildAspectRatio(BuildContext context) {
    final width = getScreenWidth(context);
    if (width > 900) return 0.85;   // Desktop
    if (width > 600) return 0.8;    // Tablet
    if (width > 400) return 0.75;   // Büyük telefon
    return 1.2;                     // Küçük telefon
  }
  
  // Responsive paddings
  static EdgeInsets getResponsivePadding(BuildContext context) {
    if (isDesktop(context)) return const EdgeInsets.all(32);
    if (isTablet(context)) return const EdgeInsets.all(24);
    if (isSmallPhone(context)) return const EdgeInsets.all(12);
    return const EdgeInsets.all(16);
  }

  static EdgeInsets getResponsiveHorizontalPadding(BuildContext context) {
    if (isDesktop(context)) return const EdgeInsets.symmetric(horizontal: 48);
    if (isTablet(context)) return const EdgeInsets.symmetric(horizontal: 32);
    if (isSmallPhone(context)) return const EdgeInsets.symmetric(horizontal: 12);
    return const EdgeInsets.symmetric(horizontal: AppConstants.paddingL);
  }
  
  // Responsive font sizes
  static double getResponsiveFontSize(BuildContext context, double baseSize) {
    if (isDesktop(context)) return baseSize * 1.3;
    if (isTablet(context)) return baseSize * 1.1;
    if (isSmallPhone(context)) return baseSize * 0.9;
    return baseSize;
  }
  
  // Responsive heights
  static double getSearchBarHeight(BuildContext context) {
    return isTablet(context) || isDesktop(context) ? 56 : 48;
  }
  
  static double getButtonHeight(BuildContext context) {
    if (isDesktop(context)) return 64;
    if (isTablet(context)) return 60;
    if (isSmallPhone(context)) return 48;
    return 56;
  }
  
  static double getIconContainerSize(BuildContext context) {
    return isTablet(context) || isDesktop(context) ? 56 : 48;
  }
  
  static double getCategoryListHeight(BuildContext context) {
    final height = getScreenHeight(context);
    return height * 0.09; // Ekranın %9'u
  }
  
  // Product detail specific
  static double getProductImageHeight(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isLandscapeMode = isLandscape(context);
    
    if (isLandscapeMode) {
      return screenSize.height * 0.6; 
    } else if (isTablet(context)) {
      return screenSize.height * 0.4; // Tablet'te büyük
    } else {
      return screenSize.height * 0.35; // Telefonda orta
    }
  }
  
  // Auth pages specific
  static double getAuthCardMaxWidth(BuildContext context) {
    final screenWidth = getScreenWidth(context);
    if (screenWidth > 800) {
      return 400; // Desktop: Sabit genişlik
    } else if (screenWidth > 600) {
      return screenWidth * 0.7; // Tablet: %70
    } else {
      return double.infinity; // Telefon: Full width
    }
  }
  
  // Icon sizes
  static double getIconSize(BuildContext context, {double baseSize = 24}) {
    if (isDesktop(context)) return baseSize * 1.3;
    if (isTablet(context)) return baseSize * 1.1;
    if (isSmallPhone(context)) return baseSize * 0.9;
    return baseSize;
  }
  
  // Card radius
  static double getCardRadius(BuildContext context) {
    if (isTablet(context) || isDesktop(context)) return 20;
    return 16;
  }
  

  static bool shouldUseHorizontalLayout(BuildContext context) {
    return isTablet(context) && isLandscape(context);
  }
  
  static double getModalWidth(BuildContext context) {
    final screenWidth = getScreenWidth(context);
    if (isDesktop(context)) {
      return 500; // Desktop: Sabit modal genişliği
    } else if (isTablet(context)) {
      return screenWidth * 0.8; // Tablet: %80
    } else {
      return screenWidth - 32; // Telefon: 16px margin her yandan
    }
  }
}