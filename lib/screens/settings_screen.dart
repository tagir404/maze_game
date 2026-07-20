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
                child: RadioGroup<Locale>(
                  groupValue: settingsService.locale ?? const Locale('auto'),
                  onChanged: (value) => value?.languageCode == 'auto'
                      ? settingsService.setLocale(null)
                      : settingsService.setLocale(value),
                  child: Column(
                    children: [
                      RadioListTile(
                        title: Text(l10n.languageAuto),
                        secondary: const Icon(Icons.language),
                        value: const Locale('auto'),
                      ),
                      RadioListTile(
                        title: Text(l10n.languageRussian),
                        value: const Locale('ru'),
                      ),
                      RadioListTile(
                        title: Text(l10n.languageEnglish),
                        value: const Locale('en'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Card(
                child: RadioGroup<ThemeMode>(
                  groupValue: settingsService.themeMode,
                  onChanged: (value) {
                    if (value != null) settingsService.setThemeMode(value);
                  },
                  child: Column(
                    children: [
                      RadioListTile(
                        title: Text(l10n.themeSystem),
                        secondary: const Icon(Icons.contrast),
                        value: ThemeMode.system,
                      ),
                      RadioListTile(
                        title: Text(l10n.themeDark),
                        value: ThemeMode.dark,
                      ),
                      RadioListTile(
                        title: Text(l10n.themeLight),
                        value: ThemeMode.light,
                      ),
                    ],
                  ),
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
