import 'package:beloved_ver2/base/mapper/mapper_di.dart';
import 'package:beloved_ver2/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this._mapper);

  final MapperDi _mapper;
}
