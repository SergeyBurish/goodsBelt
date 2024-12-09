class ProductEntity {
  final int id;
  final String title;
  final double price;

  ProductEntity({
    required this.id, 
    required this.title, 
    required this.price
    });

  ProductEntity.empty() :id = 0, title = '', price = 0;
}