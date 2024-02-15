import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class GetAllCategoriesService {
  Future<List<ProductModel>> GetAllCategories() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestorapi.com/products/categories');

    List<ProductModel> categoriesList = [];
    for (var i = 0; i < data.length; i++) {
      categoriesList.add(ProductModel.fromJson(data[i]));
    }
    return categoriesList;
  }
}
