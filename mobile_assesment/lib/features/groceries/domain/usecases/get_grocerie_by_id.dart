import 'package:dartz/dartz.dart';
import 'package:mobile_assesment/core/errors/failure/failures.dart';
import 'package:mobile_assesment/core/usecase/usecases.dart';
import 'package:mobile_assesment/features/groceries/data/models/grocery_model.dart';
import 'package:mobile_assesment/features/groceries/domain/entites/item_entity.dart';
import 'package:mobile_assesment/features/groceries/domain/repositories/grocery_repository.dart';

class GetGrocerieById implements UseCase<GroceryModel, String> {
  final GroceriesRepository repository;

  GetGrocerieById(this.repository);

  @override
  Future<Either<Failure,GroceryModel>> call(String params) async {
    return await repository.getGrocerieById(params);
  }
}