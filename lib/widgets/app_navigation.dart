import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class AppNavigation extends StatelessWidget implements PreferredSizeWidget {
  final Map<String, GlobalKey> sectionKeys;
  final Function(String) onNavigate;

  const AppNavigation({
    super.key,
    required this.sectionKeys,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Md Nazmus Sakib',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryText,
              ),
            ),
            Row(
              children: [
                ...sectionKeys.keys.map((key) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextButton(
                        onPressed: () => onNavigate(key),
                        style: TextButton.styleFrom(
                          foregroundColor: AppTheme.secondaryText,
                        ),
                        child: Text(key, style: const TextStyle(fontWeight: FontWeight.w600)),
                      ),
                    )),
                const SizedBox(width: 16),
                OutlinedButton(
                  onPressed: () => _downloadCV(context),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  ),
                  child: const Text('Download CV'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);

  void _downloadCV(BuildContext context) async {
    // PDF file is currently unavailable
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('CV PDF is currently unavailable. Please check back later.')),
    );
  }
}

class MobileDrawer extends StatelessWidget {
  final Map<String, GlobalKey> sectionKeys;
  final Function(String) onNavigate;

  const MobileDrawer({
    super.key,
    required this.sectionKeys,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(24.0),
              child: Text(
                'Md Nazmus Sakib',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(),
            ...sectionKeys.keys.map((key) => ListTile(
                  title: Text(key, style: const TextStyle(fontWeight: FontWeight.w600)),
                  onTap: () {
                    Navigator.pop(context);
                    onNavigate(key);
                  },
                )),
            const Spacer(),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('CV PDF is currently unavailable. Please check back later.')),
                  );
                }, // Download CV logic
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Download CV'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
