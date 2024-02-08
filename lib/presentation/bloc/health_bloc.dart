import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:kliky_assignment/domain/entity/health_entity.dart';
import 'package:kliky_assignment/domain/usecase/health_usecase.dart';

part 'health_event.dart';
part 'health_state.dart';

class HealthBloc extends Bloc<HealthEvent, HealthState> {
  final HealthUseCase healthUseCase;

  HealthBloc(this.healthUseCase) : super(HealthInitial()) {
    on<FetchHealthDataEvent>(_onFetchHealthData);
  }

  _onFetchHealthData(FetchHealthDataEvent event, Emitter emit) async {
    emit(HealthLoadingState());
    try {
      final health = await healthUseCase.loadHealthData();
      emit(HealthSucessState(health));
    } catch (e) {
      emit(HealthErrorState("Error: ${e.toString()}"));
    }
  }
}
