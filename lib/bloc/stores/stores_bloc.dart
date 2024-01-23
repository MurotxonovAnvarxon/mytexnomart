import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/repository/app_repository.dart';
import '../../data/source/model/stores/stores_model.dart';
import '../../di/di.dart';
import '../../presenation/home/home_bloc.dart';

part 'stores_event.dart';
part 'stores_state.dart';

class StoresBloc extends Bloc<StoresEvent, StoresState> {
  final repository = getIt<AppRepository>();

  StoresBloc() : super(StoresState()) {
    on<StoresInitialEvent>((event, emit) async{
      emit(state.copyWith(status: Status.Loading));
      try{
        final resultStores= await repository.getStores();
        emit(state.copyWith(status: Status.Success, storesModel: resultStores,));
      }catch(e){
        emit(state.copyWith(status: Status.Error));
      }
    });
  }
}
