import 'package:equatable/equatable.dart';
import '../../../domain/entities/comission_result.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<CommissionResult> results; 
  final double totalFee; 

  const HomeLoaded(this.results, this.totalFee);

  @override
  List<Object?> get props => [results, totalFee];
}

class HomeError extends HomeState {
  final String message;
  const HomeError(this.message);
  @override
  List<Object?> get props => [message];
}