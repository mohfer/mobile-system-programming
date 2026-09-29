import 'package:flutter/material.dart';
import '../../widgets/texts/custom_text.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/buttons/secondary_button.dart';
import '../../widgets/inputs/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  text: 'Custom Component Demo',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(height: 8),
                const CustomText(
                  text: 'Selamat datang kembali, silakan login.',
                  fontSize: 14,
                  color: Colors.grey,
                ),
                const SizedBox(height: 32),

                CustomTextField(
                  label: 'Email',
                  hintText: 'Masukkan email kamu',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.email_outlined),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email tidak boleh kosong';
                    }
                    if (!value.contains('@')) {
                      return 'Format email tidak valid';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Password',
                  hintText: 'Masukkan password',
                  obscureText: true,
                  prefixIcon: const Icon(Icons.lock_outline),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password tidak boleh kosong';
                    }
                    if (value.length < 6) {
                      return 'Password minimal 6 karakter';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                PrimaryButton(
                  label: 'Login',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Login berhasil (demo)')),
                      );
                    }
                  },
                ),
                const SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(text: 'Belum punya akun?'),
                    TextLinkButton(
                      text: 'Daftar',
                      onTap: () => Navigator.pushNamed(context, '/register'),
                    ),
                  ],
                ),
                Center(
                  child: TextLinkButton(
                    text: 'Lupa password?',
                    onTap: () =>
                        Navigator.pushNamed(context, '/forgot-password'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
