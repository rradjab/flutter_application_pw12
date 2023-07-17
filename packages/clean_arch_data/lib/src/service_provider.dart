import 'package:clean_arch_data/src/implementation/internals.dart';
import 'package:clean_arch_data/src/services/data_service.dart';
import 'package:clean_arch_data/clean_arch_data.dart';
import 'package:get_it/get_it.dart';

class ServiceProvider {
  static final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt.get<T>();
  static final instance = ServiceProvider();
  void initialize() {
    _getIt.registerLazySingleton<DataService>(() => InformationService());
  }
}
