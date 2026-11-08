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

    // A cancellable Timer (not Future.delayed) so leaving the screen cannot
    // touch disposed state 1.5s later.
    final resetTimer = useRef<Timer?>(null);
    useEffect(
      () =>
          () => resetTimer.value?.cancel(),
      const [],
    );

    Future<void> add() async {
      isAdding.value = true;
      final result = await ref.read(addToCartProvider)(product.id, quantity);
      if (!context.mounted) return;
      isAdding.value = false;
      if (!result.isOk) return;
      justAdded.value = true;
      resetTimer.value?.cancel();
      resetTimer.value = Timer(
        _addedFeedbackDuration,
        () => justAdded.value = false,
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
