import 'package:flutter/material.dart';
import 'package:maze_game/l10n/app_localizations.dart';
import 'package:maze_game/services/wallet_service.dart';
import 'package:maze_game/widgets/app_dialog.dart';
import 'package:maze_game/widgets/coins_display.dart';

Future<bool?> showPremiumRequiredDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (_) => const _PremiumPurchaseDialog(),
  );
}

class _PremiumPurchaseDialog extends StatelessWidget {
  const _PremiumPurchaseDialog();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: walletService,
      builder: (context, _) => AppDialog(
        iconData: Icons.workspace_premium,
        title: AppLocalizations.of(context).premiumLevel,
        content: Column(
          children: [
            Text(AppLocalizations.of(context).premiumLevelDescription),
            const SizedBox(height: 8),
            Row(
              spacing: 4,
              children: [
                Text(AppLocalizations.of(context).balance),
                CoinsDisplay(quantity: walletService.coins),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              spacing: 4,
              children: [
                Text(AppLocalizations.of(context).premiumCost),
                const CoinsDisplay(quantity: WalletService.premiumCost),
              ],
            ),
            if (!walletService.canBuyPremium) ...[
              const SizedBox(height: 12),
              Text(AppLocalizations.of(context).notEnoughCoinsPack),
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
                                        AppLocalizations.of(
                                          context,
                                        ).boughtCoins(pack.coins),
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  pack.priceLabel == 'Бесплатно'
                                      ? AppLocalizations.of(context).free
                                      : pack.priceLabel,
                                ),
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
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(AppLocalizations.of(context).later),
          ),
          FilledButton.icon(
            onPressed: walletService.canBuyPremium
                ? () async {
                    final premiumBought = await walletService.spendForPremium();
                    if (!context.mounted) return;

                    Navigator.pop(context, premiumBought);
                  }
                : null,
            icon: const Icon(Icons.workspace_premium),
            label: Text(AppLocalizations.of(context).buyPremium),
          ),
        ],
      ),
    );
  }
}
