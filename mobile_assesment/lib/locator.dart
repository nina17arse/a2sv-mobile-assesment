import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:http/http.dart' as http;
import 'package:mobile_assesment/core/network/network_info.dart';
import 'package:mobile_assesment/features/groceries/data/data_sources/remote_data_sources/remote_data_source.dart';
import 'package:mobile_assesment/features/groceries/data/repository/grocery_repository_impl.dart';
import 'package:mobile_assesment/features/groceries/domain/repositories/grocery_repository.dart';
import 'package:mobile_assesment/features/groceries/domain/usecases/get_all_groceries.dart';
import 'package:mobile_assesment/features/groceries/domain/usecases/get_grocerie_by_id.dart';
import 'package:mobile_assesment/features/groceries/presentation/bloc/bloc/search_bloc.dart';
import 'package:mobile_assesment/features/groceries/presentation/bloc/grocery/gorcery_bloc.dart';
import 'package:mobile_assesment/features/groceries/presentation/bloc/grocery/gorcery_event.dart';

final sl = GetIt.instance;


Future<void> init() async {
  
  
  //! Externals
  sl.registerLazySingleton<http.Client>(()=> http.Client());
  sl.registerLazySingleton<InternetConnectionChecker>(()=> InternetConnectionChecker());
  sl.registerLazySingleton<NetworkInfo>(()=> NetworkInfoImpl(sl()));

  // Data Sources
  sl.registerLazySingleton<RemoteDataSource>(()=> RemoteDataSourceImpl(client: sl()));
  // sl.registerLazySingleton<ProductLocalDataSource>(()=> ProductLocalDataSourceImpl(sharedPreferences: sl()));
  

  //! Features
  // Repositories

  sl.registerLazySingleton<GroceriesRepository>(()=> GroceryRepositoryImpl(RemoteDataSourceImpl(client: sl()), NetworkInfoImpl(sl())));
  


  // Use Cases
  sl.registerLazySingleton<GetAllGroceries>(()=> GetAllGroceries(sl()));
  sl.registerLazySingleton<GetGrocerieById>(()=> GetGrocerieById(sl()));
 

  

    //BLoc
  sl.registerFactory(()=> GorceryBloc(
    getAllGroceries: sl(),
    getGrocerieById: sl()
  ));
  sl.registerFactory(()=> SearchBloc(getAllGroceries: sl()));
  
  //!COre

}