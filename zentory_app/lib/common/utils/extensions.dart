import 'package:intl/intl.dart';

extension CurrencyFormatting on num {
  /// Formats the number as a currency string (e.g., $1,234.56)
  String toCurrency({String symbol = '\$', int decimalDigits = 2}) {
    return NumberFormat.currency(
      symbol: symbol,
      decimalDigits: decimalDigits,
      locale: 'en_US', // Standard currency format
    ).format(this);
  }

  /// Formats the number with a compact representation (e.g., 1.2K, 1M)
  String toCompactCurrency({String symbol = '\$'}) {
    return NumberFormat.compactCurrency(
      symbol: symbol,
      locale: 'en_US',
    ).format(this);
  }
}

extension DateFormatting on DateTime {
  /// Formats the date as a human-readable string (e.g., Oct 12, 2023)
  String toShortDate() {
    return DateFormat.yMMMd().format(this);
  }

  /// Formats the date and time (e.g., Oct 12, 2023, 2:30 PM)
  String toDateTimeString() {
    return DateFormat.yMMMd().add_jm().format(this);
  }

  /// Returns a "time ago" string or similar if needed (future implementation)
}
