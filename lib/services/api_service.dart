import 'dart:convert';

import 'package:stacked_state_management/models/book.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'www.googleapis.com';
  static const String books = '/books/v1/volumes';

  Future<List<Book>> getBooks({String genreType = 'computers'}) async {
    final url = Uri.https(baseUrl, books, {'q': 'subject:$genreType'});
    final response = await http.get(url);
    final Iterable items = jsonDecode(response.body)['items'];
    return items.map((item) => Book.fromJson(item)).toList();
  }
}
