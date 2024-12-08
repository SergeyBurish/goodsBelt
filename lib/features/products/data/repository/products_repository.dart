import 'package:goods_belt/core/data/data_sources/local_data_source.dart';
import 'package:goods_belt/features/products/data/data_sources/products_data_source.dart';
import 'package:goods_belt/features/products/domain/usecase/products_usecase.dart';

class ProductsRepositoryImp implements ProductsRepository {
  final ProductsDataSource _productsDataSource = ProductsDataSource();

  @override
  Future<void> getProductsList(String accessToken) async {
    _productsDataSource.getProductsList(accessToken);
  }

  @override
  Future<({String? accessToken, String? refreshToken})> getTokens() async => 
    await LocalDataSource().getTokens();
  
}