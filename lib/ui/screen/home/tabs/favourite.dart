import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:shop_app/cubit/cubit_states.dart';
import 'package:shop_app/models/favorite/favorites_model.dart';

class FavouriteTab extends StatelessWidget {
  const FavouriteTab({super.key});


  @override
  Widget build(BuildContext context) {
    // Call getFavorites when the widget is built
    ShopCubit.get(context).getFavorites();

    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        if (state is ShopSuccessGetFavoriteState) {
          // Optionally handle success state
        } else if (state is ShopErrorGetFavoriteState) {
          // Optionally handle error state
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Failed to load favorites")),
          );
        }
      },
      builder: (context, state) {
        // Check if favoritesModel is loaded
        final favorites = ShopCubit.get(context).favoritesModel?.data?.data ?? [];

        return ListView.separated(
          itemBuilder: (context, index) {
            return buildFavItem(favorites[index].product!, context);
          },
          separatorBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(color: Colors.grey, thickness: 2),
            );
          },
          itemCount: favorites.length, // Use the length of the favorites list
        );
      },
    );
  }
  Widget buildFavItem(Product model, context)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: SizedBox(
      height: MediaQuery.of(context).size.height*0.14,
      child: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(image: NetworkImage(model.image!),
                width: 120.0, height: 120.0,fit: BoxFit.cover,),
              if(1 !=0)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  color: Colors.red.withOpacity(0.7),
                  child: Text(model.discount.toString(), style: const TextStyle(fontSize: 10.0,color: Colors.white),),
                )
            ],
          ),
          const SizedBox(width: 20.0,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(model.name!,overflow: TextOverflow.ellipsis,maxLines: 3,
                  style: const TextStyle(fontSize: 14,height: 1.3),),
                const Spacer(),
                Row(
                  children: [
                    Text(model.price.toString(), style: const TextStyle(color: Colors.blue,fontSize: 12.0),),
                    const SizedBox(width: 5.0,),
                    if(model.oldPrice !=0)
                      Text(model.oldPrice.toString(), style: const TextStyle(
                          color: Colors.grey,decoration: TextDecoration.lineThrough,fontSize: 12.0),),
                    const Spacer(),
                    IconButton(
                        onPressed: ()
                        {
                          ShopCubit.get(context).changeFavorite(model.id!);
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
    ),
  );
}
