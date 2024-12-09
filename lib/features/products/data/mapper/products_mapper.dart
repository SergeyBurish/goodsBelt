import 'package:goods_belt/features/products/data/dto/products_dto.dart';
import 'package:goods_belt/features/products/domain/entity/product_entity.dart';

class ProductsMapper {
  static ProductEntity? fromProductDto(ProductDto productDto) {
    if (productDto.id != null &&
      productDto.title != null && 
      productDto.price != null) {
      return ProductEntity(
        id: productDto.id!,
        title: productDto.title!, 
        price: productDto.price!);
    }

    return null;
  }


  static List<ProductEntity> fromProductsListDto(ProductsListDto productsDto) {
    List<ProductEntity> products = [];
    for (var productDto in productsDto.products) {
      if (productDto.id != null &&
        productDto.title != null && 
        productDto.price != null) {
        products.add(ProductEntity(
          id: productDto.id!,
          title: productDto.title!, 
          price: productDto.price!));
      }
    }
    return products;
  }
}