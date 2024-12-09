class ProductDto {
  final int? id;
  final String? title;
  final double? price;
  final String? description;

  ProductDto.fromApi(dynamic record) 
    : id =          record['id'],
      title =       record['title'],
      price =       record['price'],
      description = record['description'];
}

class ProductsListDto {
  List<ProductDto> products = [];

  ProductsListDto.fromApi(List<dynamic> records) {
    for(var record in records) {
      products.add(ProductDto.fromApi(record));
    }
  }
}