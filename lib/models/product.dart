
//
class Product {
  final String name;
  final String imageUrl;
  final double marketPrice;
  final double currentPrice;
  final double startPrice;
  final bool isActive;
  final String countdown;

  Product({
    required this.name,
    required this.imageUrl,
    required this.marketPrice,
    required this.currentPrice,
    required this.startPrice,
    required this.isActive,
    required this.countdown,
  });
}