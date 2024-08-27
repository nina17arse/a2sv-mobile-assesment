import 'package:bloc/bloc.dart';
import 'package:mobile_assesment/core/usecase/usecases.dart';
import 'package:mobile_assesment/features/groceries/domain/usecases/get_all_groceries.dart';
import 'package:mobile_assesment/features/groceries/presentation/bloc/bloc/search_event.dart';
import 'package:mobile_assesment/features/groceries/presentation/bloc/bloc/search_state.dart';
import 'package:mobile_assesment/features/groceries/presentation/bloc/grocery/gorcery_event.dart';
import 'package:mobile_assesment/features/groceries/presentation/bloc/grocery/gorcery_state.dart';




class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetAllGroceries getAllGroceries;

  SearchBloc({required this.getAllGroceries}) : super(SearchInitial()) {
    
    on<SearchProductEvent>(_onSearchProducts);
    
    on<LoadAllProductEvent>((event, emit) async {
      emit(SearchInitial());

      var result = await getAllGroceries(NoParams());

      result.fold((l)=> emit(FailedState(l.message)), (r) => emit(LoadedState(r)));
    });
  }

   

  void _onSearchProducts(SearchProductEvent event, Emitter<SearchState> emit) {
    if (state is LoadedState) {
      final currentState = state as LoadedState;
      final filteredProducts = currentState.data.where((product) =>
          product.title.toLowerCase().contains(event.query.toLowerCase())).toList();
      emit(LoadedState(filteredProducts));
    }
  }
}