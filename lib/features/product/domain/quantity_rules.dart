/// Smallest quantity that can be ordered.
const int minProductQuantity = 1;

/// Upper bound that keeps totals sane and prevents runaway taps.
const int maxProductQuantity = 99;

/// Clamps [value] into the allowed range.
int clampQuantity(int value) =>
    value.clamp(minProductQuantity, maxProductQuantity);
