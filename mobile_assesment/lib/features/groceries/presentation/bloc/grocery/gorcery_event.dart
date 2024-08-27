import 'package:equatable/equatable.dart';


class GorceryEvent extends Equatable {
  const GorceryEvent();

  @override
  List<Object> get props => [];
}

class GetAllGroceriesEvent extends GorceryEvent {}

class GetGroceryByIdEvent extends GorceryEvent {
  final String id;

  GetGroceryByIdEvent(this.id);

  @override
  List<Object> get props => [id];
}
