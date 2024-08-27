import 'package:dartz/dartz.dart';
import 'package:mobile_assesment/core/errors/failure/failures.dart';
import 'package:mobile_assesment/core/usecase/usecases.dart';
import 'package:mobile_assesment/features/groceries/data/models/grocery_model.dart';
import 'package:mobile_assesment/features/groceries/domain/entites/item_entity.dart';
import 'package:mobile_assesment/features/groceries/domain/repositories/grocery_repository.dart';

class GetAllGroceries implements UseCase<List<GroceryModel>, NoParams> {
  final GroceriesRepository repository;

  GetAllGroceries(this.repository);

  @override
  Future<Either<Failure, List<GroceryModel>>> call(NoParams params) async {
    return await repository.getAllGroceries();
  }
}