import 'package:goods_belt/core/data/data_sources/fakeapi_service.dart';

class ProductsDataSource {
  final FakeapiService _fakeapiService = FakeapiService();

  Future<void> getProductsList(String accessToken) async {
    try {
      _fakeapiService.getProductsList(accessToken);
    } on Exception catch (e) {
      print("error $e");
    }
  }
}