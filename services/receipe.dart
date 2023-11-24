import 'dart:convert';
import 'package:recipe_app/models/hits.dart';
import 'package:http/http.dart' as http;

class Recipe {
  List<Hits> hits = [];

  Future<void> getReceipe() async {
    String url =
        "https://api.edamam.com/search?q=banana&app_id=0f21d949&app_key=c8daa8a855225d925157f8c7e093a014";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);
    jsonData["hits"].forEach((element) {
      // ignore: unused_local_variable
      Hits hits = Hits(
        recipeModel: element['recipe'],
      );
      // hits.recipeModel = add(Hits.fromMap(hits.recipeModel));
    });
  }
}
