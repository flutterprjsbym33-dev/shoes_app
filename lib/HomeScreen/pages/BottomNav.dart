import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shoe/HomeScreen/pages/TestHomeScreen.dart';
import 'package:shoe/core/utils/appColor.dart';

import '_test_profile.dart';


class BottomNavInfo{
  IconData iconData;
  String name;
  BottomNavInfo({required this.iconData,required this.name});
}

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  
 late PageController _pageController;
  int selectedIndex = 0;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }



  List<BottomNavInfo> bottomNvaItems = [
    BottomNavInfo(iconData: Icons.home, name: 'Home'),
    BottomNavInfo(iconData: Icons.chat, name: 'Chat'),
    BottomNavInfo(iconData: Icons.shopping_cart_rounded, name: 'Cart'),
    BottomNavInfo(iconData: Icons.account_circle, name: 'Profile')
  ];

  void onTabTap(int index)
  {
    setState(() {
      selectedIndex = index;
      
    });
    _pageController.animateToPage(selectedIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut);
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){},
      child: Icon(Icons.map,size: 25,),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Stack(
        children: [
          Positioned.fill(
              child: PageView(
                controller: _pageController,
                children: [
                  Testhomescreen(),
                  ProfileScreen()
                ],
              )
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8,top: 4,bottom: 4),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8),
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(bottomNvaItems.length,
                          (index)=>GestureDetector(
                            onTap: (){
                              onTabTap(index);

                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Container(
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: selectedIndex == index ?  Colors.orange.withOpacity(0.2)
                                      :null
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(bottomNvaItems[index].iconData,
                                      color: selectedIndex == index ? Colors.orange.withOpacity(0.8):
                                      null,
                                    ),
                                    SizedBox(height: 2,),
                                    Text(bottomNvaItems[index].name,
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                        color: selectedIndex == index ? Colors.orange.withOpacity(0.9):
                                        null,
                                      )
                                    ),)
                                  ],
                                ),
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}


