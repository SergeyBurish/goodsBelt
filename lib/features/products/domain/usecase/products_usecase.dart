
abstract interface class ProductsManager {
  Future<void> getProductsList();
}

abstract interface class ProductsRepository {
  Future<({String? accessToken, String? refreshToken})> getTokens();
  Future<void> getProductsList(String accessToken);
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
  Future<void> getProductsList() async {
    final tokens = await repository.getTokens();
    if (tokens.accessToken == null) {
      // TODO: show error
      return;
    }
    await repository.getProductsList(tokens.accessToken!);
  }
} 