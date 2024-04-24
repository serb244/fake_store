import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/category_bloc.dart';

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
                                  Text(state.categoryList[index].description.name),
                                  const Text(" "),
                                  Text(state.categoryList[index].description.description),
                                  const Text(" "),
                                  Text(state.categoryList[index].image.toString()),
                                ],
                              );
                            },
                            itemCount: state.categoryList.length,
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
