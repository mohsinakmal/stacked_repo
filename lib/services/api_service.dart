import 'dart:convert';

import 'package:stacked_state_management/models/book.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'www.googleapis.com';
  static const String books = '/books/v1/volumes';

  // Future<List<Book>> getBooks({String genreType = 'computers'}) async {
  //   final url = Uri.https(baseUrl, books, {'q': 'subject:$genreType'});
  //   final response = await http.get(url);
  //   final Iterable items = jsonDecode(response.body)['items'];
  //   return items.map((item) => Book.fromJson(item)).toList();
  // }

  Future<List<Book>> getBooks({String genreType = 'computers'}) async {
    final url = Uri.https(baseUrl, books, {'q': 'subject:$genreType'});

    late http.Response response;
    try {
      response = await http.get(url).timeout(Duration(seconds: 1));
    } catch (e) {
      throw Exception('Network error: $e');
    }

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch books: ${response.statusCode}');
    }

    late Map<String, dynamic> decodedResponse;
    try {
      decodedResponse = jsonDecode(response.body);
    } catch (e) {
      throw Exception('Failed to decode JSON: $e');
    }

    if (!decodedResponse.containsKey('items') ||
        decodedResponse['items'] == null) {
      throw Exception('Invalid response: "items" key is missing or null');
    }

    final items = decodedResponse['items'];
    if (items is! List) {
      throw Exception('Invalid response: "items" is not a list');
    }

    try {
      return items.map((item) => Book.fromJson(item)).toList();
    } catch (e) {
      throw Exception('Failed to parse book data: $e');
    }
  }
}
