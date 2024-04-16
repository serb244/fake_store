import 'package:fake_store/core/di/di.dart';
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
        print("state.error ${state.error}");
        return Scaffold(
          appBar: AppBar(title: Text("category")),
          body: Center(
            child:
            state.isLoading ? CircularProgressIndicator() :
            Column(
              children: [
                IconButton(
                    onPressed: () {
                      injector<CategoryBloc>().add(CategoryGetEvent());
                    },
                    icon: Icon(Icons.abc)),
                if(state.error != null) Row(
                  children: [
                    Text("error"),
                    Text(state.error.toString()),
                  ],
                ),
                if(state.categoryModelList != null) Expanded(
                  child: ListView.builder(itemBuilder: (context, index) {
                    return Row(children: [
                      Text(state.categoryModelList![index].description.name),
                      Text(" "),
                      Text(state.categoryModelList![index].description.description),
                      Text(" "),
                      Text(state.categoryModelList![index].image.toString()),
                    ],);
                  },itemCount:  state.categoryModelList!.length,
                  itemExtent: 25,),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
