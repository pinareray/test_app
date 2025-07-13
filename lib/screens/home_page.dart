import 'package:flutter/material.dart';
import '../components/product_card.dart';
import '../components/home_category_button.dart';
import '../components/home_banner_card.dart';
import '../models/product.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_constants.dart';
import '../core/constants/app_text_styles.dart';
import '../core/utils/screen_utils.dart';
import 'product_detail_page.dart';
import 'auth/welcome_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Product> products = [
    Product(
      name: "Stone Pink Women",
      imageUrl: "assets/shoe1.png",
      marketPrice: 250000,
      currentPrice: 137500,
      startPrice: 100000,
      isActive: true,
      countdown: "08:13:48",
    ),
    Product(
      name: "Gucci Ace With Web",
      imageUrl: "assets/shoe2.png",
      marketPrice: 450000,
      currentPrice: 350000,
      startPrice: 300000,
      isActive: true,
      countdown: "01:52:12",
    ),
    Product(
      name: "Nike Air Force 1",
      imageUrl: "assets/nike.png",
      marketPrice: 200000,
      currentPrice: 150000,
      startPrice: 120000,
      isActive: true,
      countdown: "03:45:22",
    ),
    Product(
      name: "Adidas Ultra Boost",
      imageUrl: "assets/ayakkabi.png",
      marketPrice: 350000,
      currentPrice: 280000,
      startPrice: 250000,
      isActive: false,
      countdown: "00:00:00",
    ),
  ];

  final Set<int> favorites = {};
  String selectedCategory = 'all';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
        //arama çubuğu
          Container(
            color: Colors.white,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(AppConstants.paddingM),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: ScreenUtils.getSearchBarHeight(context),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceVariant,
                          borderRadius: BorderRadius.circular(
                            ScreenUtils.getSearchBarHeight(context) / 2,
                          ),
                        ),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 4),
                              child: Icon(
                                Icons.search,
                                color: AppColors.textSecondary,
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Ne arıyorsunuz?',
                                  hintStyle: AppTextStyles.bodyMedium.copyWith(
                                    color: AppColors.textSecondary,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.zero,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      width: ScreenUtils.getIconContainerSize(context),
                      height: ScreenUtils.getIconContainerSize(context),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceVariant,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        color: AppColors.textPrimary,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Stack(
                      children: [
                        Container(
                          width: ScreenUtils.getIconContainerSize(context),
                          height: ScreenUtils.getIconContainerSize(context),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceVariant,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.shopping_cart_outlined,
                            color: AppColors.textPrimary,
                            size: 24,
                          ),
                        ),
                        Positioned(
                          right: 6,
                          top: 6,
                          child: Container(
                            width: 18,
                            height: 18,
                            decoration: const BoxDecoration(
                              color: AppColors.error,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Text(
                                '2',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Scrollable Content
          Expanded(
            child: CustomScrollView(
              slivers: [
                // Banner
                SliverToBoxAdapter(
                  child: BannerCard(
                    title: 'Alışveriş yolculuğu!',
                    subtitle: 'Mükemmel olanı keşfet',
                    buttonText: 'Alışverişe Başla',
                    imagePath: 'assets/reklam.jpg',
                    onPressed: () {},
                  ),
                ),

                // Categories
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(AppConstants.paddingM),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Kategoriler',
                              style: AppTextStyles.titleSmall.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Tümünü Gör',
                                style: AppTextStyles.bodySmall.copyWith(
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppConstants.paddingM),
                        SizedBox(
                          height: ScreenUtils.getCategoryListHeight(context),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              CategoryIcon(
                                icon: Icons.grid_view_rounded,
                                label: 'Tümü',
                                isSelected: selectedCategory == 'all',
                                onTap: () {
                                  setState(() {
                                    selectedCategory = 'all';
                                  });
                                },
                              ),
                              const SizedBox(width: AppConstants.paddingL),
                              CategoryIcon(
                                icon: Icons.shopping_bag_outlined,
                                label: 'Çantalar',
                                isSelected: selectedCategory == 'bags',
                                onTap: () {
                                  setState(() {
                                    selectedCategory = 'bags';
                                  });
                                },
                              ),
                              const SizedBox(width: AppConstants.paddingL),
                              CategoryIcon(
                                icon: Icons.checkroom,
                                label: 'Ayakkabı',
                                isSelected: selectedCategory == 'shoes',
                                onTap: () {
                                  setState(() {
                                    selectedCategory = 'shoes';
                                  });
                                },
                              ),
                              const SizedBox(width: AppConstants.paddingL),
                              CategoryIcon(
                                icon: Icons.watch_outlined,
                                label: 'Güzellik',
                                isSelected: selectedCategory == 'beauty',
                                onTap: () {
                                  setState(() {
                                    selectedCategory = 'beauty';
                                  });
                                },
                              ),
                              const SizedBox(width: AppConstants.paddingL),
                              CategoryIcon(
                                icon: Icons.checkroom_outlined,
                                label: 'Giyim',
                                isSelected: selectedCategory == 'clothing',
                                onTap: () {
                                  setState(() {
                                    selectedCategory = 'clothing';
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Recommended Section
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(AppConstants.paddingM),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Önerilen',
                          style: AppTextStyles.titleSmall.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Daha fazla',
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Products Grid
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.paddingM,
                  ),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: ScreenUtils.getGridCrossAxisCount(context),
                      mainAxisSpacing: AppConstants.paddingM,
                      crossAxisSpacing: AppConstants.paddingM,
                      childAspectRatio: ScreenUtils.getGridChildAspectRatio(context),
                    ),
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final product = products[index];
                      return ProductCard(
                        product: product,
                        isFavorite: favorites.contains(index),
                        showBadge: index == 0 || index == 2,
                        badgeText: index == 0 ? 'Yeni' : 'İndirim',
                        onFavorite: () {
                          setState(() {
                            if (favorites.contains(index)) {
                              favorites.remove(index);
                            } else {
                              favorites.add(index);
                            }
                          });
                        },
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (_) => ProductDetailPage(product: product),
                            ),
                          );
                        },
                      );
                    }, childCount: products.length),
                  ),
                ),

                // Bottom padding
                const SliverToBoxAdapter(child: SizedBox(height: 80)),
              ],
            ),
          ),
        ],
      ),
      // Bottom Navigation
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.textSecondary,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          onTap: (index) {
            if (index == 3) {
              // Profil sekmesi
              _showLogoutDialog(context);
            }
            // Diğer sekmeler için henüz sayfa yok, ileride eklenebilir
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Ana Sayfa',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              activeIcon: Icon(Icons.favorite),
              label: 'Favoriler',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              activeIcon: Icon(Icons.shopping_bag),
              label: 'Sepet',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Row(
              children: [
                Icon(Icons.logout, color: AppColors.error, size: 24),
                const SizedBox(width: 8),
                Text(
                  'Çıkış Yap',
                  style: AppTextStyles.titleMedium.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            content: Text(
              'Hesabınızdan çıkış yapmak istediğinizden emin misiniz?',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'İptal',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.error,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Dialog'u kapat
                    // Welcome sayfasına git ve tüm önceki sayfaları temizle
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WelcomePage(),
                      ),
                      (route) => false,
                    );
                    // Başarı mesajı göster
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Başarıyla çıkış yapıldı'),
                        backgroundColor: AppColors.success,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  child: Text(
                    'Çıkış Yap',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
    );
  }
}
