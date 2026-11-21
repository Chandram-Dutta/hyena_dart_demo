class CartItem {
  CartItem(this.name, this.priceCents, this.quantity);

  final String name;
  final int priceCents;
  final int quantity;

  int get totalCents => priceCents * quantity;
}

int cartTotalCents(List<CartItem> items) =>
    items.fold(0, (sum, item) => sum + item.totalCents);
