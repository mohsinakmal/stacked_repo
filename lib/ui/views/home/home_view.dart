import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'home_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'searchTerms'),
]
)
class HomeView extends StackedView<HomeViewModel>{
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: viewModel.isBusy
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: viewModel.data?.length,
                  itemBuilder: (context, index) {
                    final book = viewModel.data?[index];
                    return Card(
                      child: ListTile(
                        title: Text(
                          book?.volumeInfo.title ?? '',
                        ),
                        onTap: () => viewModel.navigateToBook(book: book!),
                      ),
                    );
                  }),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
