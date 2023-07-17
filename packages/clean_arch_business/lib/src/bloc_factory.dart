import 'package:clean_arch_business/src/business_bloc.dart';
import 'package:clean_arch_data/clean_arch_data.dart';
import 'package:get_it/get_it.dart';

class BlocFactory {
  static final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt.get<T>();

  static final instance = BlocFactory();

  void initialize() {
    ServiceProvider.instance.initialize();

    _getIt.registerFactory<BusinessBloc>(() =>
        BusinessBloc(dataService: ServiceProvider.instance.get<DataService>()));
  }
}
