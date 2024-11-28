import 'package:stacked/stacked.dart';
import 'package:stacked_state_management/app/app.locator.dart';
import 'package:stacked_state_management/models/book.dart';
import 'package:stacked_state_management/services/api_service.dart';

class HomeViewModel extends FutureViewModel<List<Book>> {
  final _apiService = locator<ApiService>();
  @override
  Future<List<Book>> futureToRun() => _apiService.getBooks();
}
