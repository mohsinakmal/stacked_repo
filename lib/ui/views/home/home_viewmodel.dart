import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_state_management/app/app.locator.dart';
import 'package:stacked_state_management/app/app.router.dart';
import 'package:stacked_state_management/models/book.dart';
import 'package:stacked_state_management/services/api_service.dart';
import 'home_view.form.dart';

class HomeViewModel extends FutureViewModel<List<Book>> with FormStateHelper {
  final _apiService = locator<ApiService>();
  final _navigationService = locator<NavigationService>();

  @override
  Future<List<Book>> futureToRun() => _apiService.getBooks(
      // The search term is provided by home view form here u need to import it
      genreType: searchTermsValue ?? 'computers');

  Future<void> fetchNewCategory() async {
    // the initialise function is being provided by view model and it reinitializes whole future view model 
    // u can also directly call future to run but by callling initialise it clears all the data before and the errors as well
    await initialise(); 
  }

  Future<void> navigateToBook({required Book book}) async {
    await _navigationService.navigateToBookDetailsView(book: book);
  }
}
