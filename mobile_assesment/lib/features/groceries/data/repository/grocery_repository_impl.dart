import 'package:dartz/dartz.dart';
import 'package:mobile_assesment/core/errors/exceptions/exception.dart';
import 'package:mobile_assesment/core/errors/failure/failures.dart';
import 'package:mobile_assesment/core/network/network_info.dart';
import 'package:mobile_assesment/features/groceries/data/data_sources/remote_data_sources/remote_data_source.dart';
import 'package:mobile_assesment/features/groceries/data/models/grocery_model.dart';
import 'package:mobile_assesment/features/groceries/domain/entites/item_entity.dart';
import 'package:mobile_assesment/features/groceries/domain/repositories/grocery_repository.dart';

class GroceryRepositoryImpl extends GroceriesRepository{
  final RemoteDataSource remoteDataSource;
  final NetworkInfoImpl networkInfo;
  GroceryRepositoryImpl(this.remoteDataSource,this.networkInfo);
  @override
  Future<Either<Failure, List<GroceryModel>>> getAllGroceries() async{
    if (await networkInfo.isConnected){
      try{
        final groceries = await remoteDataSource.getAllGroceries();
        return Right(groceries);
      } on ServerException{
        return Left(ServerFailure('No Data Found'));
      }
    } else {
      return Left(ServerFailure('Please Check Your Internet Connection'));

    }

  }
  @override
  Future<Either<Failure, GroceryModel>> getGrocerieById(String id) async {
    if (await networkInfo.isConnected){
      try{
        final groceries = await remoteDataSource.getGrocerieById(id);
        return Right(groceries);
      } on ServerException{
        return Left(ServerFailure('No Grocerie With That ID'));
      }
    } else {
      return Left(ServerFailure('Please Check Your Internet Connection'));

    }
  }
  
    

    
}