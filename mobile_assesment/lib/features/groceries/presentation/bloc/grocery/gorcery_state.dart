

import 'package:equatable/equatable.dart';
import 'package:mobile_assesment/features/groceries/data/models/grocery_model.dart';

class GorceryState extends Equatable {
  const GorceryState();
  
  @override
  List<Object> get props => [];
}

class GroceryLoadingState extends GorceryState {}

class GroceryLoadedAllState extends GorceryState {
  final List<GroceryModel> groceries;

  GroceryLoadedAllState(this.groceries);

  @override
  List<Object> get props => [groceries];
}

class GroceryLoadedByIdState extends GorceryState {
  final GroceryModel grocery;

  GroceryLoadedByIdState(this.grocery);

  @override
  List<Object> get props => [grocery];
}

class GroceryFetchFailedState extends GorceryState {
  final String message;

  GroceryFetchFailedState(this.message);

  @override
  List<Object> get props => [message];
}
