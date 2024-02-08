part of 'health_bloc.dart';

@immutable
sealed class HealthEvent {}

class FetchHealthDataEvent extends HealthEvent {}
