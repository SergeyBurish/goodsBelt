class ProductDto {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final List<String> images;

  ProductDto.fromApi(dynamic record) 
    : id =          record['id'],
      title =       record['title'],
      price =       record['price'],
      description = record['description'],
      images = imagesFromApi(record['images']);
  
  static List<String> imagesFromApi(List<dynamic>? records) {
    List<String> images = [];
    if(records != null && records.isNotEmpty) {
      for(var record in records) {
        images.add(record);
      }
    }
    return images;
  }
}

class ProductsListDto {
  List<ProductDto> products = [];

  ProductsListDto.fromApi(List<dynamic> records) {
    for(var record in records) {
      products.add(ProductDto.fromApi(record));
    }
  }
}