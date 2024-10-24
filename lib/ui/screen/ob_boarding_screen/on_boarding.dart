import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../models/boarding/boarding_model.dart';
import '../../../widgets/build_boarding_item.dart';
import '../login/login_screen.dart';

class OnBoarding extends StatefulWidget {
   const OnBoarding({super.key});

  static const String routeName= "OnBoarding";

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  /// to control foe moving between screens ;
  var boardController = PageController();
  bool isLast = false;

  List<BoardingModel> boarding =
  [
    BoardingModel(
        image: "assets/images/shop2.jpg",
        title: "On Board 1 title",
        body: "On Board 1 body"),
    BoardingModel(
        image: "assets/images/shop3.jpg",
        title: "On Board 2 title",
        body: "On Board 2 body"),
    BoardingModel(
        image: "assets/images/shop1.jpg",
        title: "On Board 3 title",
        body: "On Board 3 body"),
  ];
  void submit(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
    // CacheHelper().saveData(key: "onBoarding", value: true).then((value) {
    //   if(value) Navigator.pushNamed(context, LoginScreen.routeName);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: TextButton(onPressed:submit, child: const Text("Skip",
              style: TextStyle(fontSize: 24, color:Colors.orangeAccent ),)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                onPageChanged: (int index)
                {
                  if(index == boarding.length-1){
                    setState(() {
                      isLast= true;
                    });
                  }else{
                    setState(() {
                      isLast= false;
                    });
                  }
                },
                controller: boardController,
                itemCount: boarding.length,
                  itemBuilder: (context, index)=>buildBoardingItem(boarding[index])
              ),
            ),
            const SizedBox(height: 40,),
            Row(
              children: [
                SmoothPageIndicator(controller: boardController,count: boarding.length,
                effect: const ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  activeDotColor: Colors.deepOrange,
                  dotHeight: 10,
                  dotWidth: 10,
                  spacing: 5.0,
                  expansionFactor: 4
                )),
                const Spacer(),
                FloatingActionButton(onPressed: ()
                {
                  if(isLast){
                    submit();
                  }else{
                    boardController.nextPage(duration: const Duration(milliseconds: 750),
                        curve: Curves.fastLinearToSlowEaseIn);
                  }
                },
                  backgroundColor: Colors.orange,
                  child: const Icon(Icons.arrow_forward_ios),)
              ],
            ),
            const SizedBox(height: 40,),

          ],
        ),
      ),
    );
  }
}
