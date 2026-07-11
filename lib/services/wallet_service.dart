import 'package:flutter/foundation.dart';

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
  WalletService({int initialCoins = 0}) : _coins = initialCoins;

  static const int hintCost = 10;
  static const int premiumCost = 100;

  static const List<CurrencyPack> packs = [
    CurrencyPack(id: 'coins_50', coins: 50, priceLabel: r'$0.99'),
    CurrencyPack(id: 'coins_120', coins: 130, priceLabel: r'$1.99'),
  ];

  int _coins;

  int get coins => _coins;

  bool get canBuyHint => _coins >= hintCost;

  bool get canBuyPremium => _coins >= premiumCost;

  bool spendForHint() {
    if (!canBuyHint) return false;

    _coins -= hintCost;
    notifyListeners();
    return true;
  }

  bool spendForPremium() {
    if (!canBuyPremium) return false;

    _coins -= premiumCost;
    notifyListeners();
    return true;
  }

  void resetForTesting({int coins = 0}) {
    _coins = coins;
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
