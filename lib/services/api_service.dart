import 'package:ap2/models/dog_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();
  final String baseUrl = 'https://dog.ceo/api/breeds/image/random/10';

  Future<List<Dog>> fetchRandomDogs() async {
    try {
      final response = await _dio.get(baseUrl);
      final List<String> imageUrls =
          List<String>.from(response.data['message']);

      return imageUrls.map((url) {
        final name = url.split('/')[4];
        return Dog(name: name, imageUrl: url);
      }).toList();
    } catch (e) {
      throw Exception('Falha ao carregar Dogs: $e');
    }
  }
}
