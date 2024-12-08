import 'package:goods_belt/core/data/data_sources/local_data_source.dart';
import 'package:goods_belt/features/products/data/data_sources/products_data_source.dart';
import 'package:goods_belt/features/products/data/mapper/products_mapper.dart';
import 'package:goods_belt/features/products/domain/entity/product_entity.dart';
import 'package:goods_belt/features/products/domain/usecase/products_usecase.dart';

class ProductsRepositoryImp implements ProductsRepository {
  final ProductsDataSource _productsDataSource = ProductsDataSource();

  @override
  Future<List<ProductEntity>> getProductsList(String accessToken) async {
    final productsDto = await _productsDataSource.getProductsList(accessToken);
    if (productsDto != null) {
      return ProductsMapper.fromDto(productsDto);
    }
    return [];
  }

  @override
  Future<({String? accessToken, String? refreshToken})> getTokens() async => 
    await LocalDataSource().getTokens();
  
}