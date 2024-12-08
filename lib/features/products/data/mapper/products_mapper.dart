import 'package:goods_belt/features/products/data/dto/products_dto.dart';
import 'package:goods_belt/features/products/domain/entity/product_entity.dart';

class ProductsMapper {
  static List<ProductEntity> fromDto(ProductsListDto productsDto) {
    List<ProductEntity> products = [];
    for (var productDto in productsDto.products) {
      if (productDto.title != null && 
        productDto.price != null) {
        products.add(ProductEntity(title: productDto.title!, price: productDto.price!));
      }
    }
    return products;
  }
}