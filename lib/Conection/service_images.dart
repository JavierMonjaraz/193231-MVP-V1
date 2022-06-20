import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<String>> GetImagesCarousel() async {
  var response = await http.post(
    Uri.parse('http://desarrollovan-tis.dedyn.io:4030/GetImagesCarousel'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(<String, String>{"idChannel": "1"}),
  );

  List<String> imagenes = [];
  if (response.statusCode == 200) {
    var decodificado = jsonDecode(response.body);
    imagenes.add(decodificado["dtoImageCarousels"][0]["url"]);
    imagenes.add(decodificado["dtoImageCarousels"][1]["url"]);
    imagenes.add(decodificado["dtoImageCarousels"][2]["url"]);
    // print("esto es del servicio");
    // print(decodificado);
    // // print(imagenes);
    // print("esto termina del servicio");
    return imagenes;
  } else {
    return imagenes;
  }
}

Future<List<dynamic>> GetImagesCards() async {
  var response = await http.post(
    Uri.parse("http://desarrollovan-tis.dedyn.io:4030/GetProductsByIdSeller"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(<String, String>{"idSeller": "1"}),
  );

  List<dynamic> imagenes = [];
  if (response.statusCode == 200) {
    var decodificado = jsonDecode(response.body);
    imagenes = decodificado["getProducts"]["response"]["docs"];
    // print(lista);
    // print(decodificado);
    // print(imagenes);
    // print("esto termina del servicio");
    return imagenes;
  } else {
    return imagenes;
  }
}

Future<List<dynamic>> GetTitles() async {
  var response = await http.post(
    Uri.parse("http://desarrollovan-tis.dedyn.io:4030/GetPetTaxonomia"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(<String, String>{"idChannel": "1"}),
  );

  List<dynamic> imagenes = [];
  List<dynamic> imagenesreturn = [];
  if (response.statusCode == 200) {
    var decodificado = jsonDecode(response.body);
    imagenes = decodificado["dtoPetTaxonomies"];
    for (var element in imagenes) {
      var items = element["pet"][0]["detallePets"];
      for (var elemento2 in items) {
        imagenesreturn.add(elemento2["item"]);
      }
    }
    return imagenesreturn;
  } else {
    return imagenes;
  }
}
