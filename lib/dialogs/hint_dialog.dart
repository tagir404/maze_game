import 'package:flutter/material.dart';
import 'package:maze_game/l10n/app_localizations.dart';
import 'package:maze_game/services/wallet_service.dart';
import 'package:maze_game/widgets/app_dialog.dart';
import 'package:maze_game/widgets/coins_display.dart';

Future<bool?> showHintDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) => const _HintDialog(),
  );
}

class _HintDialog extends StatefulWidget {
  const _HintDialog();

  @override
  State<_HintDialog> createState() => _HintDialogState();
}

class _HintDialogState extends State<_HintDialog> {
  Future<void> _buyPack(CurrencyPack pack) async {
    await walletService.buyPack(pack);
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context).boughtCoins(pack.coins)),
      ),
    );
  }

  void _useHint() {
    if (!walletService.spendForHint()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context).notEnoughCoinsForHint),
        ),
      );
      return;
    }

    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: walletService,
      builder: (context, _) => AppDialog(
        iconData: Icons.lightbulb,
        title: AppLocalizations.of(context).hint,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
                Text(AppLocalizations.of(context).hintCost),
                const CoinsDisplay(quantity: WalletService.hintCost),
              ],
            ),
            if (!walletService.canBuyHint) ...[
              const SizedBox(height: 12),
              Text(AppLocalizations.of(context).notEnoughCoinsPack),
              const SizedBox(height: 8),
              Row(
                children: [
                  for (final pack in WalletService.packs)
                    Expanded(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsetsGeometry.all(8),
                          child: Column(
                            spacing: 8,
                            children: [
                              CoinsDisplay(quantity: pack.coins),
                              OutlinedButton(
                                onPressed: () => _buyPack(pack),
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
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(AppLocalizations.of(context).cancel),
          ),
          FilledButton.icon(
            onPressed: walletService.canBuyHint ? _useHint : null,
            icon: const Icon(Icons.lightbulb),
            label: Text(AppLocalizations.of(context).takeHint),
          ),
        ],
      ),
    );
  }
}
