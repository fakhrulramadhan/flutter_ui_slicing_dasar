import 'package:flutter/material.dart';

import 'screens/form_screen.dart';
import 'screens/landing_screen.dart';
import 'screens/list_screen.dart';
import 'screens/profile_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const UiSlicingApp());
}

class UiSlicingApp extends StatelessWidget {
  const UiSlicingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dasar Slicing UI Flutter',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const HomeMenu(),
    );
  }
}

/// Menu utama berisi daftar latihan slicing.
class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final lessons = <_Lesson>[
      _Lesson(
        title: '1. Halaman Landing',
        subtitle: 'Column, spacing, kartu hero, tombol',
        icon: Icons.rocket_launch_outlined,
        builder: (_) => const LandingScreen(),
      ),
      _Lesson(
        title: '2. Halaman Form',
        subtitle: 'TextField, validasi, keyboard handling',
        icon: Icons.edit_note_outlined,
        builder: (_) => const FormScreen(),
      ),
      _Lesson(
        title: '3. Halaman List',
        subtitle: 'ListView.builder, item card, divider',
        icon: Icons.list_alt_outlined,
        builder: (_) => const ListScreen(),
      ),
      _Lesson(
        title: '4. Halaman Profil',
        subtitle: 'Stack, ClipOval, header gradient',
        icon: Icons.person_outline,
        builder: (_) => const ProfileScreen(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dasar Slicing UI Flutter'),
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(AppTheme.spaceMd),
          itemCount: lessons.length,
          separatorBuilder: (_, _) =>
              const SizedBox(height: AppTheme.spaceSm),
          itemBuilder: (context, index) {
            final lesson = lessons[index];
            return _LessonTile(
              lesson: lesson,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: lesson.builder),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _Lesson {
  const _Lesson({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.builder,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final WidgetBuilder builder;
}

class _LessonTile extends StatelessWidget {
  const _LessonTile({required this.lesson, required this.onTap});

  final _Lesson lesson;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.surface,
      borderRadius: BorderRadius.circular(AppTheme.radiusMd),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        child: Container(
          padding: const EdgeInsets.all(AppTheme.spaceMd),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppTheme.radiusMd),
            border: Border.all(color: AppTheme.border),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppTheme.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                ),
                child: Icon(lesson.icon, color: AppTheme.primary),
              ),
              const SizedBox(width: AppTheme.spaceMd),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lesson.title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    const SizedBox(height: AppTheme.spaceXs),
                    Text(
                      lesson.subtitle,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: AppTheme.textSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
