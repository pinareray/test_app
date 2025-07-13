import 'package:flutter/material.dart';
import '../models/product.dart';
import '../components/custom_button.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_constants.dart';
import '../core/constants/app_text_styles.dart';
import '../core/utils/screen_utils.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Custom Header
          SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingM,
                vertical: AppConstants.paddingS,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceVariant,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        product.name,
                        style: AppTextStyles.titleMedium.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.orange,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceVariant,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.favorite_border,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Product Image Section
                  Container(
                    height: ScreenUtils.getProductImageHeight(context),
                    margin: ScreenUtils.getResponsiveHorizontalPadding(context),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceVariant,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child:
                              product.imageUrl.startsWith('http')
                                  ? Image.network(
                                    product.imageUrl,
                                    width: 250,
                                    height: 250,
                                    fit: BoxFit.contain,
                                    errorBuilder: (context, error, stackTrace) {
                                      return _buildImageError();
                                    },
                                  )
                                  : Image.asset(
                                    product.imageUrl,
                                    width: 250,
                                    height: 250,
                                    fit: BoxFit.contain,
                                    errorBuilder: (context, error, stackTrace) {
                                      return _buildImageError();
                                    },
                                  ),
                        ),
                        // Countdown indicator
                        if (product.isActive)
                          Positioned(
                            bottom: 20,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.access_time,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      product.countdown,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),

                  const SizedBox(height: AppConstants.paddingL),

                  // Product Title
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.paddingL,
                    ),
                    child: Text(
                      product.name,
                      style: AppTextStyles.titleLarge.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: AppConstants.paddingL),

                  // Description Section
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.paddingL,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Açıklama',
                          style: AppTextStyles.titleMedium.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: AppConstants.paddingS),
                        Text(
                          'Bu yüksek kaliteli ayakkabı hem rahat hem de şık tasarımı ile dikkat çekiyor. Premium malzemeler kullanılarak üretilmiş olup, günlük kullanım için idealdir.',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.textSecondary,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Daha Fazla',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: Colors.orange,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: AppConstants.paddingL),

                  // Color Section
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.paddingL,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Renk',
                          style: AppTextStyles.titleMedium.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: AppConstants.paddingM),
                        Row(
                          children: [
                            _ColorOption(Colors.black, isSelected: true),
                            const SizedBox(width: 12),
                            _ColorOption(Colors.grey[700]!),
                            const SizedBox(width: 12),
                            _ColorOption(Colors.brown),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: AppConstants.paddingL),

                  // Size Section
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.paddingL,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Beden',
                          style: AppTextStyles.titleMedium.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: AppConstants.paddingM),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            for (int size in [
                              35,
                              36,
                              37,
                              38,
                              39,
                              40,
                              41,
                              42,
                              43,
                            ])
                              _SizeOption(
                                size.toString(),
                                isSelected: size == 40,
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: AppConstants.paddingL),

                  // Price Information Section
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.paddingL,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fiyat Bilgileri',
                          style: AppTextStyles.titleMedium.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: AppConstants.paddingM),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.surfaceVariant,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(
                              AppConstants.paddingM,
                            ),
                            child: Column(
                              children: [
                                _PriceRow(
                                  title: 'Başlangıç Fiyatı',
                                  price:
                                      '₺${product.startPrice.toStringAsFixed(0)}',
                                  color: AppColors.textSecondary,
                                ),
                                const Divider(height: 20),
                                _PriceRow(
                                  title: 'Güncel Fiyat',
                                  price:
                                      '₺${product.currentPrice.toStringAsFixed(0)}',
                                  color: Colors.green,
                                  isLarge: true,
                                ),
                                const Divider(height: 20),
                                _PriceRow(
                                  title: 'Piyasa Fiyatı',
                                  price:
                                      '₺${product.marketPrice.toStringAsFixed(0)}',
                                  color: AppColors.textDisabled,
                                  isStrikethrough: true,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: AppConstants.paddingL),

                  // Auction Status and Time
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.paddingL,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color:
                            product.isActive
                                ? Colors.green.withValues(alpha: 0.1)
                                : Colors.red.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: product.isActive ? Colors.green : Colors.red,
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(AppConstants.paddingM),
                        child: Row(
                          children: [
                            Icon(
                              product.isActive ? Icons.timer : Icons.timer_off,
                              color:
                                  product.isActive ? Colors.green : Colors.red,
                              size: 24,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.isActive
                                        ? 'Açık Arttırma Aktif'
                                        : 'Açık Arttırma Sona Erdi',
                                    style: AppTextStyles.bodyMedium.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          product.isActive
                                              ? Colors.green
                                              : Colors.red,
                                    ),
                                  ),
                                  if (product.isActive)
                                    Text(
                                      'Kalan Süre: ${product.countdown}',
                                      style: AppTextStyles.bodySmall.copyWith(
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: AppConstants.paddingL),

                  // Bid Button
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.paddingL,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: ScreenUtils.getButtonHeight(context),
                      decoration: BoxDecoration(
                        color:
                            product.isActive
                                ? Colors.orange
                                : AppColors.textDisabled,
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(28),
                          onTap:
                              product.isActive
                                  ? () => _showBidDialog(context)
                                  : null,
                          child: Center(
                            child: Text(
                              product.isActive
                                  ? 'Teklif Ver'
                                  : 'Açık Arttırma Sona Erdi',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: AppConstants.paddingL),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showBidDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Teklif Ver', style: AppTextStyles.titleMedium),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Güncel fiyat: ${product.currentPrice}₺',
                  style: AppTextStyles.bodyMedium,
                ),
                const SizedBox(height: AppConstants.paddingM),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Teklifiniz',
                    hintText: 'Minimum: ${product.currentPrice + 100}₺',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppConstants.radiusM),
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'İptal',
                  style: TextStyle(color: AppColors.textSecondary),
                ),
              ),
              CustomButton(
                text: 'Teklif Ver',
                width: 120,
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Teklifiniz alındı!'),
                      backgroundColor: AppColors.success,
                    ),
                  );
                },
              ),
            ],
          ),
    );
  }

  Widget _buildImageError() {
    return Container(
      color: AppColors.surfaceVariant,
      child: const Icon(
        Icons.image_not_supported,
        size: 64,
        color: AppColors.textDisabled,
      ),
    );
  }
}

class _ColorOption extends StatelessWidget {
  final Color color;
  final bool isSelected;

  const _ColorOption(this.color, {this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? Colors.orange : Colors.grey[300]!,
          width: isSelected ? 3 : 1,
        ),
      ),
    );
  }
}

class _SizeOption extends StatelessWidget {
  final String size;
  final bool isSelected;

  const _SizeOption(this.size, {this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: isSelected ? Colors.orange : AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          size,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.textPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _PriceRow extends StatelessWidget {
  final String title;
  final String price;
  final Color color;
  final bool isLarge;
  final bool isStrikethrough;

  const _PriceRow({
    required this.title,
    required this.price,
    required this.color,
    this.isLarge = false,
    this.isStrikethrough = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          price,
          style: (isLarge
                  ? AppTextStyles.titleMedium
                  : AppTextStyles.bodyMedium)
              .copyWith(
                color: color,
                fontWeight: FontWeight.bold,
                decoration: isStrikethrough ? TextDecoration.lineThrough : null,
              ),
        ),
      ],
    );
  }
}
