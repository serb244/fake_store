import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/blocs/category/category_bloc.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryBloc, CategoryState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text("category")),
          body: Center(
            child: state is CategoryLoadingState
                ? const CircularProgressIndicator()
                : Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            // injector<CategoryBloc>().add(CategoryGetEvent());
                          },
                          icon: const Icon(Icons.abc)),
                      if (state is CategoryErrorState)
                        Row(
                          children: [
                            const Text("error"),
                            Text(state.error.toString()),
                          ],
                        ),
                      if (state is CategorySuccessState)
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Text(state.allCategories[index].description[1].name),
                                  const Text(" "),
                                  Text(state.allCategories[index].description[1].description),
                                  const Text(" "),
                                  Text(state.allCategories[index].image.toString()),
                                ],
                              );
                            },
                            itemCount: state.allCategories.length,
                            itemExtent: 25,
                          ),
                        ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
