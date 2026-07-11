import 'package:flutter/material.dart';
import 'package:maze_game/services/wallet_service.dart';
import 'package:maze_game/widgets/app_dialog.dart';
import 'package:maze_game/widgets/coins_display.dart';

Future<bool?> showPremiumRequiredDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (_) => const _PremiumRequiredDialog(),
  );
}

class _PremiumRequiredDialog extends StatelessWidget {
  const _PremiumRequiredDialog();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: walletService,
      builder: (context, _) => AppDialog(
        icon: const Icon(Icons.workspace_premium),
        iconColor: const Color(0xFFF3BF45),
        title: "Премиум уровень",
        content: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Этот уровень станет доступен после покупки премиум-доступа",
              ),
              const SizedBox(height: 12),
              Row(
                spacing: 4,
                children: [
                  const Text('Баланс: '),
                  CoinsDisplay(quantity: walletService.coins),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                spacing: 4,
                children: [
                  const Text('Стоимость премиум-доступа: '),
                  CoinsDisplay(quantity: WalletService.premiumCost),
                ],
              ),
              if (!walletService.canBuyPremium) ...[
                const SizedBox(height: 16),
                const Text('Не хватает монет? Купи игровой набор:'),
                const SizedBox(height: 8),
                Row(
                  children: [
                    for (final pack in WalletService.packs)
                      Expanded(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              spacing: 8,
                              children: [
                                CoinsDisplay(quantity: pack.coins),
                                OutlinedButton(
                                  onPressed: () async {
                                    await walletService.buyPack(pack);

                                    if (!context.mounted) return;

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Куплено ${pack.coins} монет',
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text(pack.priceLabel),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text("Позже"),
          ),
          FilledButton.icon(
            onPressed: walletService.canBuyPremium
                ? () {
                    walletService.spendForPremium();
                    Navigator.pop(context, true);
                  }
                : null,
            icon: const Icon(Icons.workspace_premium),
            label: const Text("Купить премиум"),
          ),
        ],
      ),
    );
  }
}
