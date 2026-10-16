import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/section_card.dart';

// Halaman profil.
//
// Bagian yang agak tricky: avatar harus menimpa batas header gradient,
// makanya dipakai Stack + Positioned.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('4. Profil')),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 180,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    // Latar gradient header.
                    Container(
                      height: 140,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [AppTheme.primary, AppTheme.primaryDark],
                        ),
                      ),
                      padding: const EdgeInsets.all(AppTheme.spaceMd),
                      alignment: Alignment.topLeft,
                      child: SafeArea(
                        child: const Text(
                          'Profil Saya',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                    // Avatar overlap ke bawah.
                    Positioned(
                      top: 96,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: AppTheme.surface,
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: Container(
                            width: 88,
                            height: 88,
                            color: AppTheme.primary.withValues(alpha: 0.15),
                            alignment: Alignment.center,
                            child: const Text(
                              'BS',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w800,
                                color: AppTheme.primary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppTheme.spaceSm),
              const Text(
                'Budi Santoso',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.textPrimary,
                ),
              ),
              const SizedBox(height: AppTheme.spaceXs),
              const Text(
                'Mahasiswa Teknik Informatika',
                style: TextStyle(
                  fontSize: 13,
                  color: AppTheme.textSecondary,
                ),
              ),

              const SizedBox(height: AppTheme.spaceLg),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.spaceMd,
                ),
                child: Column(
                  children: [
                    // ---- STATISTIK ----
                    SectionCard(
                      child: Row(
                        children: const [
                          Expanded(child: _ProfileStat(label: 'Proyek', value: '12')),
                          _VerticalDivider(),
                          Expanded(child: _ProfileStat(label: 'Selesai', value: '9')),
                          _VerticalDivider(),
                          Expanded(child: _ProfileStat(label: 'Poin', value: '480')),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppTheme.spaceMd),

                  // Menu pengaturan.
                    SectionCard(
                      padding: EdgeInsets.zero,
                      child: Column(
                        children: const [
                          _MenuItem(
                            icon: Icons.person_outline,
                            label: 'Edit Profil',
                          ),
                          Divider(height: 1),
                          _MenuItem(
                            icon: Icons.bookmark_outline,
                            label: 'Materi Tersimpan',
                          ),
                          Divider(height: 1),
                          _MenuItem(
                            icon: Icons.settings_outlined,
                            label: 'Pengaturan',
                          ),
                          Divider(height: 1),
                          _MenuItem(
                            icon: Icons.logout,
                            label: 'Keluar',
                            isDanger: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppTheme.spaceXl),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileStat extends StatelessWidget {
  const _ProfileStat({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: AppTheme.textPrimary,
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

class _VerticalDivider extends StatelessWidget {
  const _VerticalDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 32,
      color: AppTheme.border,
    );
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem({
    required this.icon,
    required this.label,
    this.isDanger = false,
  });

  final IconData icon;
  final String label;
  final bool isDanger;

  @override
  Widget build(BuildContext context) {
    final color = isDanger ? AppTheme.danger : AppTheme.textPrimary;

    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppTheme.spaceMd,
          vertical: AppTheme.spaceMd,
        ),
        child: Row(
          children: [
            Icon(icon, size: 20, color: color),
            const SizedBox(width: AppTheme.spaceMd),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right,
              size: 20,
              color: AppTheme.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}
