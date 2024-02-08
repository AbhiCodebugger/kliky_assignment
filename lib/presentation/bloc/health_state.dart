part of 'health_bloc.dart';

@immutable
sealed class HealthState {}

final class HealthInitial extends HealthState {}

class HealthSucessState extends HealthState {
  final HealthEntity entity;
  HealthSucessState(this.entity);
}

class HealthErrorState extends HealthState {
  final String error;
  HealthErrorState(this.error);
}

class HealthLoadingState extends HealthState {}
