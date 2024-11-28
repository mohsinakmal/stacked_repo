import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'book_details_viewmodel.dart';

class BookDetailsView extends StackedView<BookDetailsViewModel> {
  const BookDetailsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BookDetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  BookDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BookDetailsViewModel();
}
