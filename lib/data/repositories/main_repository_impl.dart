import 'package:itgrow_flutter_test_project/data/network/base_api_service.dart';
import 'package:itgrow_flutter_test_project/domain/repositories/main_repository.dart';

class MainRepositoryImpl implements MainRepository{
  final BaseApiService _apiService;
  MainRepositoryImpl(this._apiService);
}