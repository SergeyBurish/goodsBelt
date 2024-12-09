import 'package:goods_belt/core/data/data_sources/fakeapi_service.dart';
import 'package:goods_belt/features/products/data/dto/products_dto.dart';

class ProductsDataSource {
  final FakeapiService _fakeapiService = FakeapiService();

  Future<ProductsListDto?> getProductsList(String accessToken) async {
    try {
      final response = await _fakeapiService.getProductsList(accessToken);
      return ProductsListDto.fromApi(response.data);
    } on Exception catch (e) {
      print("error $e");
      return null;
    }
  }

  Future<ProductDto?> getProduct(int productId) async {
    try {
      final response = await _fakeapiService.getProduct(productId);
      return ProductDto.fromApi(response.data);
    } on Exception catch (e) {
      print("error $e");
      return null;
    }
  }
}