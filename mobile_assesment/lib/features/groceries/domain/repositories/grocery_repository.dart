import 'package:dartz/dartz.dart';
import 'package:mobile_assesment/core/errors/failure/failures.dart';
import 'package:mobile_assesment/features/groceries/data/models/grocery_model.dart';
import 'package:mobile_assesment/features/groceries/domain/entites/item_entity.dart';


abstract class GroceriesRepository {
  Future<Either<Failure, List<GroceryModel>>> getAllGroceries();
  Future<Either<Failure, GroceryModel>> getGrocerieById(String id);
} 