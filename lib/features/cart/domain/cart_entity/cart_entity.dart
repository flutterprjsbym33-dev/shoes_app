class Cart{
  final String id;
  final String title;
  final String description;
  final String brand;
  final List<int> sizes;
  final double rating;
  final double oldPrice;
  final double newPrice;
  final List<String> images;

  Cart({
    required this.id,
    required this.title,
    required this.description,
    required this.brand,
    required this.sizes,
    required this.rating,
    required this.oldPrice,
    required this.newPrice,
    required this.images,
});
}