import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/app_theme.dart';
import '../providers/theme_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: AppTheme.primaryColor.withOpacity(0.2),
                        child: const Icon(
                          Icons.person,
                          size: 40,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sarah Mitchell',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'sarah.mitchell@email.com',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Preferences Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Preferences',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 12),
                  Card(
                    child: Column(
                      children: [
                        _buildSettingsTile(
                          context,
                          'Theme',
                          'Light / Dark Mode',
                          Icons.palette,
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Choose Theme'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    RadioListTile(
                                      title: const Text('Light'),
                                      value: ThemeMode.light,
                                      groupValue: context.watch<ThemeProvider>().themeMode,
                                      onChanged: (value) {
                                        context.read<ThemeProvider>().setThemeMode(value!);
                                        Navigator.pop(context);
                                      },
                                    ),
                                    RadioListTile(
                                      title: const Text('Dark'),
                                      value: ThemeMode.dark,
                                      groupValue: context.watch<ThemeProvider>().themeMode,
                                      onChanged: (value) {
                                        context.read<ThemeProvider>().setThemeMode(value!);
                                        Navigator.pop(context);
                                      },
                                    ),
                                    RadioListTile(
                                      title: const Text('System'),
                                      value: ThemeMode.system,
                                      groupValue: context.watch<ThemeProvider>().themeMode,
                                      onChanged: (value) {
                                        context.read<ThemeProvider>().setThemeMode(value!);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        const Divider(height: 1),
                        _buildSettingsTile(
                          context,
                          'Language',
                          'English',
                          Icons.language,
                        ),
                        const Divider(height: 1),
                        _buildSettingsTile(
                          context,
                          'Notifications',
                          'Manage alerts',
                          Icons.notifications,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Health Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Health Information',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 12),
                  Card(
                    child: Column(
                      children: [
                        _buildSettingsTile(
                          context,
                          'Pregnancy Info',
                          'Edit pregnancy details',
                          Icons.pregnant_woman,
                        ),
                        const Divider(height: 1),
                        _buildSettingsTile(
                          context,
                          'Medical History',
                          'View your history',
                          Icons.history,
                        ),
                        const Divider(height: 1),
                        _buildSettingsTile(
                          context,
                          'Medications',
                          'Manage prescriptions',
                          Icons.medication,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Security Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Security & Privacy',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 12),
                  Card(
                    child: Column(
                      children: [
                        _buildSettingsTile(
                          context,
                          'Password',
                          'Change password',
                          Icons.lock,
                        ),
                        const Divider(height: 1),
                        _buildSettingsTile(
                          context,
                          'Privacy',
                          'Manage permissions',
                          Icons.security,
                        ),
                        const Divider(height: 1),
                        _buildSettingsTile(
                          context,
                          'Share Data',
                          'Partner access',
                          Icons.share,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Other Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Other',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 12),
                  Card(
                    child: Column(
                      children: [
                        _buildSettingsTile(
                          context,
                          'About',
                          'Version 1.0.0',
                          Icons.info,
                        ),
                        const Divider(height: 1),
                        _buildSettingsTile(
                          context,
                          'Help & Support',
                          'Contact us',
                          Icons.help,
                        ),
                        const Divider(height: 1),
                        _buildSettingsTile(
                          context,
                          'Logout',
                          '',
                          Icons.logout,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsTile(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon, {
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.primaryColor),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: subtitle.isNotEmpty
          ? Text(
              subtitle,
              style: Theme.of(context).textTheme.bodySmall,
            )
          : null,
      trailing: const Icon(Icons.chevron_right, color: AppTheme.textTertiary),
      onTap: onTap,
    );
  }
}
