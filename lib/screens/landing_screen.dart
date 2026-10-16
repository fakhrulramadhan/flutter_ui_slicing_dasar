import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/primary_button.dart';
import '../widgets/section_card.dart';

// Halaman landing.
//
// Menyusun elemen vertikal pakai Column, dengan kartu hero bergradasi
// di bagian atas lalu diikuti kartu fitur dan statistik.
class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1. Landing')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppTheme.spaceMd),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---- HERO ----
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppTheme.spaceLg),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppTheme.primary, AppTheme.primaryDark],
                  ),
                  borderRadius: BorderRadius.circular(AppTheme.radiusLg),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.school_outlined,
                      color: Colors.white,
                      size: 32,
                    ),
                    const SizedBox(height: AppTheme.spaceMd),
                    const Text(
                      'Belajar Slicing UI\ndari Desain ke Kode',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        height: 1.3,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: AppTheme.spaceSm),
                    Text(
                      'Ubah mockup menjadi tampilan Flutter yang rapi, '
                      'responsif, dan mudah dirawat.',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.85),
                        fontSize: 14,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: AppTheme.spaceLg),
                    PrimaryButton(
                      label: 'Mulai Belajar',
                      icon: Icons.arrow_forward,
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Tombol berfungsi!'),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppTheme.spaceLg),

              // ---- FITUR ----
              const SectionCard(
                title: 'Yang Akan Dipelajari',
                child: Column(
                  children: [
                    _FeatureRow(
                      icon: Icons.view_agenda_outlined,
                      text: 'Menyusun layout dengan Column & Row',
                    ),
                    SizedBox(height: AppTheme.spaceMd),
                    _FeatureRow(
                      icon: Icons.aspect_ratio_outlined,
                      text: 'Mengatur ukuran & spacing secara konsisten',
                    ),
                    SizedBox(height: AppTheme.spaceMd),
                    _FeatureRow(
                      icon: Icons.color_lens_outlined,
                      text: 'Menggunakan design token warna & radius',
                    ),
                    SizedBox(height: AppTheme.spaceMd),
                    _FeatureRow(
                      icon: Icons.widgets_outlined,
                      text: 'Membuat widget yang reusable',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppTheme.spaceLg),

              // ---- STATISTIK (Row + Expanded) ----
              const SectionCard(
                title: 'Statistik',
                child: Row(
                  children: [
                    Expanded(child: _StatTile(label: 'Latihan', value: '4')),
                    Expanded(child: _StatTile(label: 'Widget', value: '12')),
                    Expanded(child: _StatTile(label: 'Jam', value: '6')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureRow extends StatelessWidget {
  const _FeatureRow({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: AppTheme.primary),
        const SizedBox(width: AppTheme.spaceSm),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              height: 1.4,
              color: AppTheme.textPrimary,
            ),
          ),
        ),
      ],
    );
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: AppTheme.primary,
          ),
        ),
        const SizedBox(height: AppTheme.spaceXs),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: AppTheme.textSecondary,
          ),
        ),
      ],
    );
  }
}
