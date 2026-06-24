class CartItemModel {
  final String id;
  final String titleKey;
  final String imageUrl;
  final double unitPrice;
  final int quantity;

  const CartItemModel({
    required this.id,
    required this.titleKey,
    required this.imageUrl,
    required this.unitPrice,
    this.quantity = 1,
  });

  CartItemModel copyWith({int? quantity}) {
    return CartItemModel(
      id: id,
      titleKey: titleKey,
      imageUrl: imageUrl,
      unitPrice: unitPrice,
      quantity: quantity ?? this.quantity,
    );
  }

  double get totalPrice => unitPrice * quantity;
}

class CartMockData {
  static const taxRate = 0.15;

  static const initialItems = [
    CartItemModel(
      id: 'item1',
      titleKey: 'cartProduct1Title',
      imageUrl: 'https://images.unsplash.com/photo-1581655353564-df123a1eb820?w=150&q=80',
      unitPrice: 140,
    ),
    CartItemModel(
      id: 'item2',
      titleKey: 'cartProduct2Title',
      imageUrl: 'https://images.unsplash.com/photo-1622281549424-fd9aaea1fd43?w=150&q=80',
      unitPrice: 450,
    ),
  ];
}