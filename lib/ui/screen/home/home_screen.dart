import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:shop_app/cubit/cubit_states.dart';
import 'package:shop_app/ui/screen/search/search_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state){},
      builder: (context, index) {
        var cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text("Shop App", style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),),
            actions: [
              IconButton(onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const SearchScreen()));
              }, icon: const Icon(Icons.search, color: Colors.black, size: 32,)),
            ],
          ),
          body: cubit.bottomScreen[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            onTap: (index)
            {
              cubit.changeBottom(index);
              setState(() {});
            },
            currentIndex:cubit.currentIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.apps),label: "Categories"),
              BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "Favourite"),
              BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Settings"),
            ],
          ),
        );
      },
    );
  }
}
