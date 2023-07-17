part of 'business_bloc.dart';

class BusinessState {
  String result;
  BusinessState({required this.result});
}

class BusinessInitState extends BusinessState {
  BusinessInitState({required super.result});
}

class BusinessLoadedState extends BusinessState {
  BusinessLoadedState({required super.result});
}

class BusinessLoadingState extends BusinessState {
  BusinessLoadingState({required super.result});
}
