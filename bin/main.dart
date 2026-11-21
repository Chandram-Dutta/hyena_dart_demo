import 'package:hyena_dart_demo/hyena_dart_demo.dart';

void main() {
  final items = [CartItem('Coffee', 450, 2), CartItem('Bagel', 300, 1)];
  for (final item in items) {
    print('${item.name} x${item.quantity}: ${item.totalCents} cents');
  }
  print('Total: ${cartTotalCents(items)} cents');
}
