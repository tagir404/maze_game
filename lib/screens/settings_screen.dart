import 'package:flutter/material.dart';
import 'package:maze_game/core/app_dependencies.dart';
import 'package:maze_game/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final settingsService = AppDependencies.of(context).settingsService;

    return AnimatedBuilder(
      animation: settingsService,
      builder: (context, _) => Scaffold(
        appBar: AppBar(title: Text(l10n.settings)),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Text(l10n.controlsDescription),
                ),
              ),
              const SizedBox(height: 12),
              Card(
                child: Column(
                  children: [
                    RadioListTile<String>(
                      title: Text(l10n.languageAuto),
                      secondary: const Icon(Icons.language),
                      value: 'auto',
                      groupValue:
                          settingsService.locale?.languageCode ?? 'auto',
                      onChanged: (_) => settingsService.setLocale(null),
                    ),
                    RadioListTile<String>(
                      title: Text(l10n.languageRussian),
                      value: 'ru',
                      groupValue:
                          settingsService.locale?.languageCode ?? 'auto',
                      onChanged: (_) =>
                          settingsService.setLocale(const Locale('ru')),
                    ),
                    RadioListTile<String>(
                      title: Text(l10n.languageEnglish),
                      value: 'en',
                      groupValue:
                          settingsService.locale?.languageCode ?? 'auto',
                      onChanged: (_) =>
                          settingsService.setLocale(const Locale('en')),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Card(
                child: Column(
                  children: [
                    RadioListTile<ThemeMode>(
                      title: Text(l10n.themeSystem),
                      secondary: const Icon(Icons.contrast),
                      value: ThemeMode.system,
                      groupValue: settingsService.themeMode,
                      onChanged: (value) {
                        if (value != null) settingsService.setThemeMode(value);
                      },
                    ),
                    RadioListTile<ThemeMode>(
                      title: Text(l10n.themeDark),
                      value: ThemeMode.dark,
                      groupValue: settingsService.themeMode,
                      onChanged: (value) {
                        if (value != null) settingsService.setThemeMode(value);
                      },
                    ),
                    RadioListTile<ThemeMode>(
                      title: Text(l10n.themeLight),
                      value: ThemeMode.light,
                      groupValue: settingsService.themeMode,
                      onChanged: (value) {
                        if (value != null) settingsService.setThemeMode(value);
                      },
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Text(l10n.privacyPolicy),
                onTap: () => launchUrl(
                  Uri.parse(
                    'https://sites.google.com/view/tagirsulaev-mazegame/policy',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
