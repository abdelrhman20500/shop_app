import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:shop_app/cubit/cubit_states.dart';
import 'package:shop_app/models/category/categories_model.dart';
import 'package:shop_app/models/home/home_model.dart';
import 'package:shop_app/widgets/flutter_toast.dart';

class ProductTab extends StatelessWidget {
  const ProductTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state)
      {
        if(state is ShopSuccessFavoritesState)
          {
            if(!state.changeFavoritesModel.status!){
              flutterToast(state.changeFavoritesModel.message!, Colors.red);
            }
          }
      },
      builder: (context, index){
        return ConditionalBuilder(
          condition: ShopCubit.get(context).homeModel !=null &&
              ShopCubit.get(context).categoriesModel !=null,
          builder: (context) =>productsBuilder(ShopCubit.get(context).homeModel!,
              ShopCubit.get(context).categoriesModel!, context),
          fallback: (context) =>  const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
  Widget productsBuilder(HomeModel model, CategoriesModel categoriesModel, context){
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            /// convert list to list of widget...
              items: model.data!.banners!.map((e) =>
                 Image(image: NetworkImage("${e.image}"),
                  width: double.infinity,
                  fit: BoxFit.cover,),
              ).toList(),
              options: CarouselOptions(
                height: 250.0,
                initialPage: 0,
                viewportFraction: 1.0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(seconds: 1),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
              )),
          const SizedBox(height: 20.0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Categories",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                const SizedBox(height: 10.0,),
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index)
                      {
                        return buildCategoryItem(categoriesModel.data!.data![index]);
                      },
                      separatorBuilder: (context, index)
                      {
                        return const SizedBox(width: 10.0,);
                      },
                      itemCount: categoriesModel.data!.data!.length),
                ),
                const SizedBox(height: 10.0,),
                const Text("New Products",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          const SizedBox(height: 10.0,),
          GridView.count(
            shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 2.0,
            crossAxisSpacing: 2.0,
            childAspectRatio: 1/2,
            children: List.generate(model.data!.products!.length,
                    (index) => buildGridProduct(model.data!.products![index], context)),
          ),
        ],
      ),
    );
  }
  Widget buildCategoryItem(Data1 data)=>Stack(
    alignment: AlignmentDirectional.bottomCenter,
    children: [
      Image(image: NetworkImage(data.image!),
        height: 100.0, width: 100.0,fit: BoxFit.cover,),
      Container(
          width: 100,
          color: Colors.black.withOpacity(0.9),
          child: Text(data.name!,textAlign: TextAlign.center,
            maxLines: 1,overflow: TextOverflow.ellipsis, style: const TextStyle(
                color: Colors.white),))
    ],
  );
  Widget buildGridProduct(Products model, context)
  {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(image: NetworkImage(model.images![0]),
              width: double.infinity, height: 200.0,),
              if(model.discount !=0)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                color: Colors.red.withOpacity(0.7),
                child: const Text("DISCOUNT", style: TextStyle(fontSize: 10.0,color: Colors.white),),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(model.name!,overflow: TextOverflow.ellipsis,maxLines: 3,
                  style: const TextStyle(fontSize: 14,height: 1.3),),
                Row(
                  children: [
                    Text(model.price!.round().toString(), style: const TextStyle(color: Colors.blue,fontSize: 12.0),),
                    const SizedBox(width: 5.0,),
                    if(model.discount !=0)
                    Text(model.oldPrice!.round().toString(), style: const TextStyle(
                        color: Colors.grey,decoration: TextDecoration.lineThrough,fontSize: 12.0),),
                    const Spacer(),
                    IconButton(
                        // padding: EdgeInsets.zero,
                        onPressed: ()
                        {
                          ShopCubit.get(context).changeFavorite(model.id!);
                          print(model.id!);
                          // print(model.inFavorites);
                        }, icon: CircleAvatar(
                        radius: 15,
                        backgroundColor: ShopCubit.get(context).favorites[model.id]!
                            ?Colors.blue :Colors.grey,
                        child: const Icon(Icons.favorite_border,color: Colors.white, size: 16.0,)))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
