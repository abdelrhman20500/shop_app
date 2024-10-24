import 'package:flutter/material.dart';

import '../../cubit/cubit.dart';
import '../../models/search/search_model.dart';

Widget buildListProduct(Product1 model, context,{bool isOldPrice = true})=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: SizedBox(
    height: MediaQuery.of(context).size.height*0.14,
    child: Row(
      children: [
        Image(image: NetworkImage(model.image!),
          width: 120.0, height: 120.0,fit: BoxFit.cover,),
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
                    // padding: EdgeInsets.zero,
                      onPressed: ()
                      {
                        ShopCubit.get(context).changeFavorite(model.id!);
                        // print(model.id!);
                        // print(model.inFavorites);
                      }, icon: CircleAvatar(
                      radius: 15,
                      backgroundColor:ShopCubit.get(context).favorites[model.id]!
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
