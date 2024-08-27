import 'dart:convert';

import 'package:mobile_assesment/core/errors/exceptions/exception.dart';
import 'package:mobile_assesment/core/errors/failure/failures.dart';
import 'package:mobile_assesment/features/groceries/domain/entites/item_entity.dart';
import 'package:mobile_assesment/features/groceries/data/models/grocery_model.dart';
import 'package:http/http.dart' as http;


abstract class RemoteDataSource {
  Future<List<GroceryModel>> getAllGroceries();
  Future<GroceryModel> getGrocerieById(String id);
}

class RemoteDataSourceImpl extends RemoteDataSource{
  final http.Client client;
  RemoteDataSourceImpl({required this.client});
  @override
  Future<List<GroceryModel>> getAllGroceries() async{
    var url = 'https://g5-flutter-learning-path-be.onrender.com/api/v1/groceries';
    var response = await client.get(Uri.parse(url));
    var result = [];
    if (response.statusCode==200){
      var items = jsonDecode(response.body);
      for (var it in items['data']){
        result.add(it as GroceryModel);
      }
      return result as List<GroceryModel>;
    }
    else if (response.statusCode == 404){
      return [];
    }
    throw ServerException(message: 'Internal Server Error');
  }
  @override
  Future<GroceryModel> getGrocerieById(String id) async{
    var url = 'https://g5-flutter-learning-path-be.onrender.com/api/v1/groceries/$id';
    try{
      var response = await client.get(Uri.parse(url));
      if (response.statusCode == 200){
        var result = jsonDecode(response.body);
        var groceries = GroceryModel.fromJson(result);
        return groceries;
      } else {
        throw ServerException();
      }
    } catch (e){
      throw ServerException();
    }
  }
    
}