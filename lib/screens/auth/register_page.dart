import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import '../../components/modern_card.dart';
import '../../components/text_field.dart';
import '../../components/gradient_button.dart';
import '../../components/social_login_button.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../home_page.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  bool _agreed = false;
  bool _isPasswordVisible = false;
  bool _isRepeatPasswordVisible = false;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
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
    if (value.length < 8) return 'Şifre en az 8 karakter olmalı';
    final name = _nameController.text.toLowerCase().replaceAll(' ', '');
    if (name.isNotEmpty && value.toLowerCase().contains(name)) {
      return 'Şifre isminizi içeremez';
    }
    if (!value.contains(RegExp(r'[a-zA-Z]'))) {
      return 'Şifre en az bir harf içermelidir';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Şifre en az bir rakam içermelidir';
    }
    if (!value.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
      return 'Şifre en az bir özel karakter içermelidir (!@#%^&*()...)';
    }
    if (_repeatPasswordController.text.isNotEmpty &&
        _passwordController.text != _repeatPasswordController.text) {
      return 'Şifreler eşleşmiyor';
    }
    return null;
  }

  String? _repeatPasswordValidator(String? value) {
    if (value == null || value.isEmpty) return 'Şifre tekrarı zorunludur';
    if (value != _passwordController.text) return 'Şifreler eşleşmiyor';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Pastel gradient arka plan
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
          // Üstte yumuşak dalga efekti
          ClipPath(
            clipper: WaveClipperOne(reverse: true),
            child: Container(
              height: 120,
              color: Colors.white.withOpacity(0.10),
            ),
          ),
          // Altta yumuşak dalga efekti
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
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.paddingL,
                    ),
                    child: ModernCard(
                      margin: EdgeInsets.zero,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Kayıt Ol',
                              style: AppTextStyles.titleMedium.copyWith(
                                color: AppColors.textPrimary,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: AppConstants.paddingS),
                            ModernTextField(
                              controller: _nameController,
                              labelText: 'İsim',
                              hintText: 'Lütfen isminizi girin',
                              validator:
                                  (v) =>
                                      v == null || v.isEmpty
                                          ? 'Ad soyad zorunludur'
                                          : null,
                              textInputAction: TextInputAction.next,
                              onChanged: (value) {
                                setState(() {});
                                if (_passwordController.text.isNotEmpty) {
                                  _formKey.currentState?.validate();
                                }
                              },
                            ),
                            const SizedBox(height: AppConstants.paddingS),
                            ModernTextField(
                              controller: _emailController,
                              labelText: 'Email adres',
                              hintText: 'example@gmail.com',
                              keyboardType: TextInputType.emailAddress,
                              validator: _emailValidator,
                              textInputAction: TextInputAction.next,
                            ),
                            const SizedBox(height: AppConstants.paddingS),
                            ModernTextField(
                              controller: _phoneController,
                              labelText: 'Telefon Numarası',
                              hintText: '5XX XXX XX XX',
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(10),
                              ],
                              validator: (v) {
                                if (v == null || v.isEmpty) {
                                  return 'Telefon numarası zorunludur';
                                }
                                if (v.length < 10) {
                                  return 'Geçerli bir telefon numarası girin';
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.next,
                            ),
                            const SizedBox(height: AppConstants.paddingS),
                            ModernTextField(
                              controller: _passwordController,
                              labelText: 'Şifre',
                              hintText: 'Şifrenizi girin',
                              obscureText: !_isPasswordVisible,
                              validator: _passwordValidator,
                              textInputAction: TextInputAction.next,
                              onChanged: (value) {
                                setState(() {});
                                if (_repeatPasswordController.text.isNotEmpty) {
                                  _formKey.currentState?.validate();
                                }
                              },
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
                            const SizedBox(height: AppConstants.paddingXS),
                            _buildPasswordHints(),
                            const SizedBox(height: AppConstants.paddingS),
                            ModernTextField(
                              controller: _repeatPasswordController,
                              labelText: 'Şifre Tekrar',
                              hintText: 'Lütfen şifrenizi tekrar girin',
                              obscureText: !_isRepeatPasswordVisible,
                              validator: _repeatPasswordValidator,
                              textInputAction: TextInputAction.done,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isRepeatPasswordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: AppColors.textSecondary,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isRepeatPasswordVisible =
                                        !_isRepeatPasswordVisible;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(height: AppConstants.paddingS),
                            Row(
                              children: [
                                SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Checkbox(
                                    value: _agreed,
                                    onChanged:
                                        (v) => setState(
                                          () => _agreed = v ?? false,
                                        ),
                                    activeColor: AppColors.primary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: AppConstants.paddingS),
                                Expanded(
                                  child: Text(
                                    'Şartlar ve Koşulları kabul ediyorum',
                                    style: AppTextStyles.bodySmall.copyWith(
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: AppConstants.paddingS),
                            GradientButton(
                              text: 'Kayıt Ol',
                              onPressed: () {
                                if (_formKey.currentState!.validate() &&
                                    _agreed) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: const Text('Kayıt başarılı!'),
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
                                } else if (!_agreed) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: const Text(
                                        'Lütfen sözleşmeyi onaylayın',
                                      ),
                                      backgroundColor: AppColors.error,
                                    ),
                                  );
                                }
                              },
                            ),
                            const SizedBox(height: AppConstants.paddingS),
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
                            const SizedBox(height: AppConstants.paddingS),
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
                                  "Zaten hesabınız var mı? ",
                                  style: AppTextStyles.bodySmall.copyWith(
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const LoginPage(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Giriş Yap',
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
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordHints() {
    final password = _passwordController.text;
    final name = _nameController.text.toLowerCase().replaceAll(' ', '');
    return Container(
      padding: const EdgeInsets.all(AppConstants.paddingS),
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(AppConstants.radiusM),
        border: Border.all(color: AppColors.surfaceVariant, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Şifre Gereksinimleri:',
            style: AppTextStyles.bodySmall.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppConstants.paddingXS),
          _buildPasswordRequirement('En az 8 karakter', password.length >= 8),
          _buildPasswordRequirement(
            'En az bir harf (a-z, A-Z)',
            password.contains(RegExp(r'[a-zA-Z]')),
          ),
          _buildPasswordRequirement(
            'En az bir rakam (0-9)',
            password.contains(RegExp(r'[0-9]')),
          ),
          _buildPasswordRequirement(
            'En az bir özel karakter (!@#%^&*...)',
            password.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]')),
          ),
          _buildPasswordRequirement(
            'İsminizi içermemeli',
            name.isEmpty || !password.toLowerCase().contains(name),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordRequirement(String text, bool isValid) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Row(
        children: [
          Icon(
            isValid ? Icons.check_circle : Icons.radio_button_unchecked,
            size: 16,
            color: isValid ? AppColors.success : AppColors.textDisabled,
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: AppTextStyles.bodySmall.copyWith(
              color: isValid ? AppColors.success : AppColors.textSecondary,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
