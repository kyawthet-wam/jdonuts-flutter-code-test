part of '../product_detail_screen.dart';

const Duration _addedFeedbackDuration = Duration(milliseconds: 1500);

/// "ADD TO CART | 3,200 MMK" with the live total (quantity x price).
/// After adding it briefly confirms, then returns to normal.
class _AddToCartButton extends HookConsumerWidget {
  const _AddToCartButton({required this.product, required this.quantity});

  final Product product;
  final int quantity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final isAdding = useState(false);
    final justAdded = useState(false);
    final total = formatThousands(context, product.priceMmk * quantity);

    Future<void> add() async {
      isAdding.value = true;
      final result = await ref.read(addToCartProvider)(product.id, quantity);
      isAdding.value = false;
      if (!result.isOk || !context.mounted) return;
      justAdded.value = true;
      unawaited(
        Future<void>.delayed(
          _addedFeedbackDuration,
          () => justAdded.value = false,
        ),
      );
    }

    return PrimaryButton(
      label: justAdded.value
          ? l10n.addedToCart
          : '${l10n.addToCart}  |  ${l10n.priceMmk(total)}',
      isLoading: isAdding.value,
      onPressed: add,
    );
  }
}
