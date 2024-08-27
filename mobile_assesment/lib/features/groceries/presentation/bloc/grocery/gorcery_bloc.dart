import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_assesment/core/usecase/usecases.dart';
import 'package:mobile_assesment/features/groceries/domain/usecases/get_all_groceries.dart';
import 'package:mobile_assesment/features/groceries/domain/usecases/get_grocerie_by_id.dart';
import 'package:mobile_assesment/features/groceries/presentation/bloc/grocery/gorcery_event.dart';
import 'package:mobile_assesment/features/groceries/presentation/bloc/grocery/gorcery_state.dart';



class GorceryBloc extends Bloc<GorceryEvent, GorceryState> {
  final GetAllGroceries getAllGroceries;
  final GetGrocerieById getGrocerieById;
  GorceryBloc({required this.getAllGroceries,required this.getGrocerieById}) : super(GroceryLoadingState()) {
    on<GetAllGroceriesEvent>((event, emit) async {
      emit(GroceryLoadingState());

      var result = await getAllGroceries(NoParams());

      result.fold((l)=> emit(GroceryFetchFailedState(l.message)), (r) => emit(GroceryLoadedAllState(r)));
    });

  

  on<GetGroceryByIdEvent>((event, emit) async {
    emit(GroceryLoadingState());

    var result = await getGrocerieById(event.id);

    result.fold((l)=> emit(GroceryFetchFailedState(l.message)), (r) => emit(GroceryLoadedByIdState(r)));
  });
}

}
