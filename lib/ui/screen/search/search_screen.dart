import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/ui/screen/search/cubit/search_cubit.dart';
import 'package:shop_app/ui/screen/search/cubit/search_state.dart';
import 'package:shop_app/ui/uitlies/build-list_product.dart';
import 'package:shop_app/widgets/custom_text_form_field.dart';

import '../../../cubit/cubit.dart';
import '../../../models/favorite/favorites_model.dart';
import '../../../models/search/search_model.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var searchController = TextEditingController();
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, SearchState state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, color: Colors.black),
              ),
            ),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    CustomTextFormField(

                      controller: searchController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter text to search";
                        }
                        return null;
                      },
                      onFieldSubmitted: (String text) {
                        // Call the search method on the existing cubit instance
                        context.read<SearchCubit>().search(text);
                      },
                      labelText: "Search",
                      prefixIcon: Icons.search,
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 10.0),
                    if (state is SearchLoadingState)
                      const LinearProgressIndicator(),
                    Expanded(
                      child: state is SearchSuccessState &&
                          state.searchModel != null
                          ? ListView.separated(
                        itemBuilder: (context, index) {
                          return buildListProduct(
                            state.searchModel.data!.data![index],
                            context,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Divider(color: Colors.grey, thickness: 2),
                          );
                        },
                        itemCount: state.searchModel.data!.data!.length,
                      )
                          : const Center(child: Text("No results found", style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 22),)),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}

