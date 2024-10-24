import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:shop_app/cubit/cubit_states.dart';

import '../../../../models/category/categories_model.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state){

      },
      builder: (context, state){
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index)
            {
              return buildCatItem(ShopCubit.get(context).categoriesModel!.data!.data![index]);
            },
            separatorBuilder: (context, index){
              return const Padding(
                padding: EdgeInsets.all(20.0),
                child: Divider(color: Colors.grey,thickness: 2,),
              );
            },
            itemCount: ShopCubit.get(context).categoriesModel!.data!.data!.length);
      },
    );
  }
  Widget buildCatItem(Data1 data)=> Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Image(image: NetworkImage(data.image!),
          height: 100, width: 100,fit: BoxFit.cover,),
        const SizedBox(width: 20.0,),
        Text(data.name!, style: const TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
        const Spacer(),
        const Icon(Icons.arrow_forward_ios),
      ],
    ),
  );
}
