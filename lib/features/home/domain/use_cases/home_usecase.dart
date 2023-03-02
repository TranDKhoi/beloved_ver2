import '../repositories/home_repository.dart';

abstract class HomeUseCase {}

class HomeUseCaseImpl implements HomeUseCase {
  HomeUseCaseImpl(this._repo);

  final HomeRepository _repo;
}
