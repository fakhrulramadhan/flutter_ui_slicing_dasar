import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

// Halaman list.
//
// ListView.builder dipakai supaya item dibangun saat terlihat saja,
// jadi tetap ringan walau datanya banyak.
class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(
      20,
      (i) => _Contact(
        name: 'Kontak ${i + 1}',
        role: i.isEven ? 'Mahasiswa' : 'Dosen',
        initial: String.fromCharCode(65 + (i % 26)),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('3. List')),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(AppTheme.spaceMd),
          itemCount: items.length,
          separatorBuilder: (_, _) =>
              const SizedBox(height: AppTheme.spaceSm),
          itemBuilder: (context, index) => _ContactTile(item: items[index]),
        ),
      ),
    );
  }
}

class _Contact {
  const _Contact({
    required this.name,
    required this.role,
    required this.initial,
  });

  final String name;
  final String role;
  final String initial;
}

class _ContactTile extends StatelessWidget {
  const _ContactTile({required this.item});

  final _Contact item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spaceMd),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        border: Border.all(color: AppTheme.border),
      ),
      child: Row(
        children: [
          // Avatar bulat. ClipOval dipakai supaya Container kotak
          // tetap tampil lingkaran.
          ClipOval(
            child: Container(
              width: 44,
              height: 44,
              color: AppTheme.primary.withValues(alpha: 0.12),
              alignment: Alignment.center,
              child: Text(
                item.initial,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.primary,
                ),
              ),
            ),
          ),
          const SizedBox(width: AppTheme.spaceMd),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.textPrimary,
                  ),
                ),
                const SizedBox(height: AppTheme.spaceXs),
                Text(
                  item.role,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppTheme.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Ketuk ${item.name}')),
              );
            },
            icon: const Icon(
              Icons.more_vert,
              color: AppTheme.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
