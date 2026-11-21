import 'cart.dart';

int shippingCents(List<CartItem> items, String country, bool express) {
  final total = cartTotalCents(items);
  var cents = 0;
  if (country == 'US') {
    if (total >= 5000) {
      cents = express ? 999 : 0;
    } else if (total >= 2500) {
      cents = express ? 1299 : 399;
    } else {
      cents = express ? 1599 : 599;
    }
  } else if (country == 'CA' || country == 'MX') {
    if (total >= 7500) {
      cents = express ? 1499 : 0;
    } else if (items.length > 3 && !express) {
      cents = 899;
    } else {
      cents = express ? 2499 : 1199;
    }
  } else if (country == 'GB' || country == 'DE' || country == 'FR') {
    for (final item in items) {
      if (item.quantity > 5 && item.priceCents > 1000) {
        cents += express ? 500 : 250;
      } else if (item.quantity > 2 || item.priceCents > 5000) {
        cents += express ? 300 : 150;
      }
    }
    cents += express ? 2999 : 1499;
  } else {
    cents = express ? 4999 : 2999;
  }
  return cents;
}

int legacyHandlingFeeCents(List<CartItem> items) => items.length * 50;
