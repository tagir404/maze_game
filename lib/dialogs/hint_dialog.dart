import 'package:flutter/material.dart';
import 'package:maze_game/services/wallet_service.dart';
import 'package:maze_game/widgets/coins_display.dart';

Future<bool?> showHintDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    // builder: (context) => AlertDialog(
    //   title: const Text('Подсказка'),
    //   content: const Text('Показать подсказку для комнаты?'),
    //   actions: [
    //     TextButton(
    //       onPressed: () => Navigator.of(context).pop(false),
    //       child: const Text('Нет'),
    //     ),
    //     FilledButton(
    //       onPressed: () => Navigator.of(context).pop(true),
    //       child: const Text('Да'),
    //     ),
    //   ],
    // ),
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

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Куплено ${pack.coins} монет')));
  }

  void _useHint() {
    if (!walletService.spendForHint()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Недостаточно монет для подсказки')),
      );
      return;
    }

    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: walletService,
      builder: (context, _) => AlertDialog(
        title: const Text('Подсказка'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                spacing: 4,
                children: [
                  Text('Баланс: '),
                  CoinsDisplay(quantity: walletService.coins),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Text('Стоимость подсказки: '),
                  CoinsDisplay(quantity: WalletService.hintCost),
                ],
              ),
              if (!walletService.canBuyHint) ...[
                const SizedBox(height: 16),
                const Text('Не хватает монет? Купи игровой набор:'),
                const SizedBox(height: 8),
                Row(
                  children: [
                    for (final pack in WalletService.packs)
                      Card(
                        child: Padding(
                          padding: EdgeInsetsGeometry.all(8),
                          child: Column(
                            spacing: 8,
                            children: [
                              CoinsDisplay(quantity: pack.coins),
                              OutlinedButton(
                                onPressed: () => _buyPack(pack),
                                child: Column(
                                  spacing: 8,
                                  children: [Text(pack.priceLabel)],
                                ),
                              ),
                            ],
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
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Отмена'),
          ),
          FilledButton.icon(
            onPressed: walletService.canBuyHint ? _useHint : null,
            icon: const Icon(Icons.lightbulb),
            label: const Text('Взять подсказку'),
          ),
        ],
      ),
    );
  }
}
