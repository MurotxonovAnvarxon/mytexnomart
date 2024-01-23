import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'all_branchess_map_event.dart';
part 'all_branchess_map_state.dart';

class AllBranchessMapBloc extends Bloc<AllBranchessMapEvent, AllBranchessMapState> {
  AllBranchessMapBloc() : super(AllBranchessMapInitial()) {
    on<AllBranchessMapEvent>((event, emit) {

    });
  }
}
