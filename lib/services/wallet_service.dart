import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CurrencyPack {
  const CurrencyPack({
    required this.id,
    required this.coins,
    required this.priceLabel,
  });

  final String id;
  final int coins;
  final String priceLabel;
}

class WalletService extends ChangeNotifier {
  WalletService({int initialCoins = 0, bool initialPremiumAccess = false})
    : _coins = initialCoins,
      _hasPremiumAccess = initialPremiumAccess;

  static const _premiumAccessKey = 'premium_access';

  SharedPreferences? _prefs;

  static const int hintCost = 10;
  static const int premiumCost = 100;

  static const List<CurrencyPack> packs = [
    CurrencyPack(id: 'coins_50', coins: 50, priceLabel: 'Бесплатно'),
    CurrencyPack(id: 'coins_120', coins: 130, priceLabel: 'Бесплатно'),
  ];

  int _coins;
  bool _hasPremiumAccess;

  int get coins => _coins;

  bool get hasPremiumAccess => _hasPremiumAccess;

  bool get canBuyHint => _coins >= hintCost;

  bool get canBuyPremium => !hasPremiumAccess && _coins >= premiumCost;

  Future<void> init(SharedPreferences prefs) async {
    _prefs = prefs;
    _hasPremiumAccess = prefs.getBool(_premiumAccessKey) ?? false;
    notifyListeners();
  }

  bool spendForHint() {
    if (!canBuyHint) return false;

    _coins -= hintCost;
    notifyListeners();
    return true;
  }

  Future<bool> spendForPremium() async {
    if (!canBuyPremium) return false;

    _coins -= premiumCost;
    _hasPremiumAccess = true;
    await _prefs?.setBool(_premiumAccessKey, true);
    notifyListeners();
    return true;
  }

  void resetForTesting({int coins = 0, bool hasPremiumAccess = false}) {
    _coins = coins;
    _hasPremiumAccess = hasPremiumAccess;
    notifyListeners();
  }

  Future<void> buyPack(CurrencyPack pack) async {
    // This is a local purchase stub. Connect this method to the store billing
    // SDK before publishing real-money purchases.
    _coins += pack.coins;
    notifyListeners();
  }
}

final walletService = WalletService();
