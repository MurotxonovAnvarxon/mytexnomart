part of 'stores_bloc.dart';

class StoresState {
  final Status? status;
  final StoresModel? storesModel;

   StoresState({this.status, this.storesModel});

   StoresState copyWith({Status? status, StoresModel? storesModel}) => StoresState(status: status ?? this.status, storesModel: storesModel ?? this.storesModel);
}

class StoresInitial extends StoresState {}
