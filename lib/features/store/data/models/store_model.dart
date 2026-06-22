import 'package:dawri/gen/locale_keys.g.dart';

class ProductModel {
  final String titleKey;
  final String categoryKey;
  final String imageUrl;
  final String price;
  final bool hasDiscount;

  const ProductModel({
    required this.titleKey,
    required this.categoryKey,
    required this.imageUrl,
    required this.price,
    this.hasDiscount = false,
  });
}

class StoreMockData {
  static const categoryKeys = [
    LocaleKeys.allKey,
    LocaleKeys.storeCategorySportswear,
    LocaleKeys.storeCategoryEquipment,
    LocaleKeys.storeCategoryTickets,
    LocaleKeys.storeCategoryEsports,
  ];

  static const products = [
    ProductModel(
      titleKey: LocaleKeys.storeProduct1Title,
      categoryKey: LocaleKeys.storeCategorySportswear,
      imageUrl: 'https://images.unsplash.com/photo-1581655353564-df123a1eb820?w=300&q=80',
      price: '140 ر.س',
      hasDiscount: true,
    ),
    ProductModel(
      titleKey: LocaleKeys.storeProduct2Title,
      categoryKey: LocaleKeys.storeCategoryEquipment,
      imageUrl: 'https://images.unsplash.com/photo-1622281549424-fd9aaea1fd43?w=300&q=80',
      price: '450 ر.س',
    ),
    ProductModel(
      titleKey: LocaleKeys.storeProduct3Title,
      categoryKey: LocaleKeys.storeCategoryEsports,
      imageUrl: 'https://images.unsplash.com/photo-1600003014755-ba31aa59c4b6?w=300&q=80',
      price: '280 ر.س',
    ),
    ProductModel(
      titleKey: LocaleKeys.storeProduct4Title,
      categoryKey: LocaleKeys.storeCategoryTickets,
      imageUrl: 'https://images.unsplash.com/photo-1614632537190-23e4146777db?w=300&q=80',
      price: '75 ر.س',
    ),
  ];
}