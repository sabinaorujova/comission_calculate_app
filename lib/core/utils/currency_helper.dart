import 'dart:math';

class CurrencyHelper {
  static const Map<String, double> _rates = {
    'EUR': 1.0,
    'USD': 1.1497,
    'JPY': 129.53,
  };

  static double getRate(String currency) {
    if (!_rates.containsKey(currency)) {
      throw Exception("Unsupported currency: $currency");
    }
    return _rates[currency]!;
  }

  static int getPrecision(String currency) {
    return currency == 'JPY' ? 0 : 2;
  }

  static double convertToEur(double amount, String currency) {
    return amount / getRate(currency);
  }

  static double convertFromEur(double amountInEur, String targetCurrency) {
    return amountInEur * getRate(targetCurrency);
  }

  static double roundUp(double amount, String currency) {
    int precision = getPrecision(currency);
    num factor = pow(10, precision);
    return (amount * factor).ceil() / factor.toDouble();
  }
}