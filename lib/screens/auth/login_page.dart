import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import '../../components/modern_card.dart';
import '../../components/text_field.dart';
import '../../components/gradient_button.dart';
import '../../components/social_login_button.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../home_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) return 'E-posta zorunludur';
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    if (!emailRegex.hasMatch(value)) return 'Geçerli bir e-posta giriniz';
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) return 'Şifre zorunludur';
    if (value.length < 6) return 'En az 6 karakter olmalı';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Geçişli pastel gradient arka plan
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFFDE6B3),
                  Color(0xFFB7DED6),
                  Color(0xFFF5B4AC),
                ],
              ),
            ),
          ),
          // Üstte hafif dalga efekti
          ClipPath(
            clipper: WaveClipperOne(reverse: true),
            child: Container(
              height: 120,
              color: Colors.white.withOpacity(0.10),
            ),
          ),
          // Altta hafif dalga efekti
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: WaveClipperOne(),
              child: Container(
                height: 130,
                color: Colors.white.withOpacity(0.15),
              ),
            ),
          ),
          
          SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                height:
                    MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(AppConstants.paddingL),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    ModernCard(
                      margin: const EdgeInsets.symmetric(
                        horizontal: AppConstants.paddingL,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Giriş Yap',
                              style: AppTextStyles.titleLarge.copyWith(
                                color: AppColors.textPrimary,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: AppConstants.paddingL),
                            ModernTextField(
                              controller: _emailController,
                              labelText: 'E-posta Adresi',
                              hintText: 'E-posta adresinizi girin',
                              keyboardType: TextInputType.emailAddress,
                              validator: _emailValidator,
                              textInputAction: TextInputAction.next,
                            ),
                            const SizedBox(height: AppConstants.paddingL),
                            ModernTextField(
                              controller: _passwordController,
                              labelText: 'Şifre',
                              hintText: 'Şifrenizi girin',
                              obscureText: !_isPasswordVisible,
                              validator: _passwordValidator,
                              textInputAction: TextInputAction.done,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: AppColors.textSecondary,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(height: AppConstants.paddingM),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  // Şifremi unuttum işlemi
                                },
                                child: Text(
                                  'Şifremi Unuttum',
                                  style: AppTextStyles.bodyMedium.copyWith(
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: AppConstants.paddingL),
                            GradientButton(
                              text: 'Giriş Yap',
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: const Text('Giriş başarılı!'),
                                      backgroundColor: AppColors.success,
                                    ),
                                  );
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomePage(),
                                    ),
                                    (route) => false,
                                  );
                                }
                              },
                            ),
                            const SizedBox(height: AppConstants.paddingL),
                            Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    color: AppColors.surfaceVariant,
                                    thickness: 1,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: AppConstants.paddingM,
                                  ),
                                  child: Text(
                                    'veya',
                                    style: AppTextStyles.bodySmall,
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    color: AppColors.surfaceVariant,
                                    thickness: 1,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: AppConstants.paddingL),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SocialLoginButton(
                                  icon: Icons.apple,
                                  onTap: () {},
                                ),
                                const SizedBox(width: AppConstants.paddingM),
                                SocialLoginButton(
                                  icon: Icons.facebook,
                                  onTap: () {},
                                ),
                                const SizedBox(width: AppConstants.paddingM),
                                SocialLoginButton(
                                  icon: Icons.g_mobiledata,
                                  onTap: () {},
                                ),
                              ],
                            ),
                            const SizedBox(height: AppConstants.paddingM),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Hesabınız yok mu? ",
                                  style: AppTextStyles.bodySmall.copyWith(
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) => const RegisterPage(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Kayıt Ol',
                                    style: AppTextStyles.bodySmall.copyWith(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
