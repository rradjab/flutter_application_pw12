import 'package:bloc/bloc.dart';
import 'package:clean_arch_data/clean_arch_data.dart';

part 'business_event.dart';
part 'business_state.dart';

class BusinessBloc extends Bloc<BusinessEvent, BusinessState> {
  final DataService dataService;

  BusinessBloc({required this.dataService})
      //'0000-00-00 00:00:00'
      : super(BusinessState(result: dataService.getData())) {
    on<BusinessLoadEvent>((event, emit) async {
      emit(BusinessLoadingState(result: ''));
      emit(BusinessLoadedState(result: await dataService.getInfo()));
    });
  }
}
