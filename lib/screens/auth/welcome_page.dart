import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import '../../components/gradient_button.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_text_styles.dart';
import 'login_page.dart';
import 'register_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // GEÇİŞLİ RENKLİ GRADİENT ARKA PLAN (Görseldeki gibi!)
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFFDE6B3), // Açık sarı-turuncu
                  Color(0xFF99D9D9), // Açık mavi-yeşil ton
                  Color(0xFFF5B4AC), // Yumuşak mercan/pembe
                ],
              ),
            ),
          ),
          // Üstte yumuşak beyaz dalga
          ClipPath(
            clipper: WaveClipperOne(reverse: true),
            child: Container(
              height: 110,
              color: Colors.white.withOpacity(0.13),
            ),
          ),
          // Altta yumuşak beyaz dalga
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: WaveClipperOne(),
              child: Container(
                height: 120,
                color: Colors.white.withOpacity(0.12),
              ),
            ),
          ),
          // İçerik
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppConstants.paddingL),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(flex: 2),
                  // Logo ve ikon
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.22),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.wb_sunny_outlined,
                      size: 40,
                      color: Color(0xFFE0816E), // Turuncu tonu, ister değiştir
                    ),
                  ),
                  const SizedBox(height: AppConstants.paddingL),
                  // Başlık
                  Text(
                    'Hoş Geldiniz',
                    style: AppTextStyles.titleMedium.copyWith(
                      color: Colors.black87,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Ayakkabı Dünyam',
                    style: AppTextStyles.titleLarge.copyWith(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppConstants.paddingM),
                  // Alt başlık
                  Text(
                    'Başlamak için bir hesap oluşturun.\nBir sonraki harika keşfiniz sizi bekliyor!',
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: Colors.black87.withOpacity(0.84),
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(flex: 3),
                  // Butonlar
                  GradientButton(
                    text: 'Kayıt Ol',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: AppConstants.paddingM),
                  GradientButton(
                    text: 'Giriş Yap',
                    isOutlined: true,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
