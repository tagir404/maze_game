import 'package:flutter/widgets.dart';

class AppLocalizations {
  const AppLocalizations(this.locale);

  final Locale locale;

  static const supportedLocales = [Locale('en'), Locale('ru')];

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static Locale localeResolutionCallback(
    Locale? locale,
    Iterable<Locale> supportedLocales,
  ) {
    if (locale?.countryCode?.toUpperCase() == 'RU' ||
        locale?.languageCode.toLowerCase() == 'ru') {
      return const Locale('ru');
    }

    return const Locale('en');
  }

  bool get _isRu => locale.languageCode == 'ru';

  String get appTitle => _isRu ? 'Лабиринт' : 'Maze';
  String get play => _isRu ? 'Играть' : 'Play';
  String get levels => _isRu ? 'Уровни' : 'Levels';
  String get settings => _isRu ? 'Настройки' : 'Settings';
  String get controlsDescription => _isRu
      ? 'Управление в игре: кнопки влево и вправо переключают персонажа строго между дверями. Нажми действие, чтобы войти в выбранную дверь.'
      : 'Game controls: the left and right buttons move the character strictly between doors. Press action to enter the selected door.';
  String get privacyPolicy =>
      _isRu ? 'Политика конфиденциальности' : 'Privacy policy';
  String get language => _isRu ? 'Язык' : 'Language';
  String get languageAuto =>
      _isRu ? 'Авто по местоположению' : 'Auto by location';
  String get languageRussian => _isRu ? 'Русский' : 'Russian';
  String get languageEnglish => _isRu ? 'Английский' : 'English';
  String get theme => _isRu ? 'Тема' : 'Theme';
  String get themeSystem => _isRu ? 'Как в системе' : 'System';
  String get themeDark => _isRu ? 'Тёмная' : 'Dark';
  String get themeLight => _isRu ? 'Светлая' : 'Light';
  String level(int number) => _isRu ? 'Уровень $number' : 'Level $number';
  String get unlockPremiumLevels =>
      _isRu ? 'Открыть премиум уровни' : 'Unlock premium levels';
  String get premiumAccessActive =>
      _isRu ? 'Премиум-доступ активирован' : 'Premium access active';
  String get premiumLevel => _isRu ? 'Премиум уровень' : 'Premium level';
  String get premiumLevelDescription => _isRu
      ? 'Этот уровень станет доступен после покупки премиум-доступа'
      : 'This level becomes available after buying premium access';
  String get balance => _isRu ? 'Баланс: ' : 'Balance: ';
  String get premiumCost =>
      _isRu ? 'Стоимость премиум-доступа: ' : 'Premium access cost: ';
  String get notEnoughCoinsPack => _isRu
      ? 'Не хватает монет? Купи игровой набор:'
      : 'Not enough coins? Buy a game pack:';
  String boughtCoins(int coins) =>
      _isRu ? 'Куплено $coins монет' : 'Bought $coins coins';
  String get later => _isRu ? 'Позже' : 'Later';
  String get buyPremium => _isRu ? 'Купить премиум' : 'Buy premium';
  String get hint => _isRu ? 'Подсказка' : 'Hint';
  String get notEnoughCoinsForHint => _isRu
      ? 'Недостаточно монет для подсказки'
      : 'Not enough coins for a hint';
  String get hintCost =>
      _isRu ? 'Стоимость подсказки: ' : 'Hint cost: ';
  String get cancel => _isRu ? 'Отмена' : 'Cancel';
  String get takeHint => _isRu ? 'Взять подсказку' : 'Take hint';
  String get levelCompleted => _isRu ? 'Уровень пройден!' : 'Level complete!';
  String winMessage(int levelNumber, int roomsCount) => _isRu
      ? 'Ты нашёл выход из уровня $levelNumber. Комнат: $roomsCount.'
      : 'You found the exit from level $levelNumber. Rooms: $roomsCount.';
  String get toMenu => _isRu ? 'В меню' : 'Menu';
  String get nextLevel => _isRu ? 'Следующий уровень' : 'Next level';
  String get levelLocked => _isRu ? 'Уровень закрыт' : 'Level locked';
  String get levelLockedDescription => _isRu
      ? 'Этот уровень станет доступен после прохождения предыдущих уровней'
      : 'This level becomes available after completing previous levels';
  String get close => _isRu ? 'Закрыть' : 'Close';
  String get free => _isRu ? 'Бесплатно' : 'Free';
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'ru'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
