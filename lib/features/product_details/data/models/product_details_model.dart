// lib/features/product_details/data/product_details_model.dart
class ProductDetailsModel {
  final String categoryKey;
  final String titleKey;
  final String descriptionKey;
  final double price;
  final String imageUrl;
  final List<String> sizes;

  const ProductDetailsModel({
    required this.categoryKey,
    required this.titleKey,
    required this.descriptionKey,
    required this.price,
    required this.imageUrl,
    required this.sizes,
  });
}

class ProductDetailsMockData {
  static const product = ProductDetailsModel(
    categoryKey: 'productDetailsCategory',
    titleKey: 'productDetailsTitle',
    descriptionKey: 'productDetailsDescription',
    price: 140,
    imageUrl: 'https://images.unsplash.com/photo-1581655353564-df123a1eb820?w=600&q=80',
    sizes: ['S', 'M', 'L', 'XL'],
  );

  static const defaultSizeIndex = 1; // 'M'
}