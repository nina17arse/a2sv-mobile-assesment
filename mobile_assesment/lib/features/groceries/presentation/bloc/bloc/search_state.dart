import 'package:equatable/equatable.dart';
import 'package:mobile_assesment/features/groceries/data/models/grocery_model.dart';

sealed class SearchState extends Equatable {
  const SearchState();
  
  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}



final class LoadingState extends SearchState {

}

final class LoadedState extends SearchState {
  final List<GroceryModel> data;
  const LoadedState(this.data);

  @override
  List<Object> get props => [data];

}


final class FailedState extends SearchState {
  final String message;
  const FailedState(this.message);
}