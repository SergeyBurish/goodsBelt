
import 'package:goods_belt/features/products/domain/entity/product_entity.dart';

abstract interface class ProductsManager {
  Future<List<ProductEntity>> getProductsList();
  Future<ProductEntity?> getProduct(int productId);
  Future<void> logout();
}

abstract interface class ProductsRepository {
  Future<({String? accessToken, String? refreshToken})> getTokens();
  Future<void> resetTokens();
  Future<List<ProductEntity>> getProductsList(String accessToken);
  Future<ProductEntity?> getProduct(int productId);
}

class ProductsUsecase {
  static late final _ProductsUsecaseImp _productsUsecaseImp;

  static init(ProductsRepository repository) {
    _productsUsecaseImp = _ProductsUsecaseImp(repository: repository);
  }

  static ProductsManager get productsManager => _productsUsecaseImp;
}

class _ProductsUsecaseImp implements ProductsManager {
  final ProductsRepository repository;

  _ProductsUsecaseImp({required this.repository});

  @override
  Future<List<ProductEntity>> getProductsList() async {
    final tokens = await repository.getTokens();
    if (tokens.accessToken == null) {
      // TODO: show error
      return [];
    }
    return await repository.getProductsList(tokens.accessToken!);
  }

  @override
  Future<ProductEntity?> getProduct(int productId) async => 
    await repository.getProduct(productId);
  
  @override
  Future<void> logout() async => await repository.resetTokens();
} 