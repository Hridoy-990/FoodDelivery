import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/page/account/account_page.dart';
import 'package:food_delivery/page/cart/cart_history.dart';
import 'package:food_delivery/page/cart/cart_page.dart';
import 'package:food_delivery/page/home/main_food_page.dart';
import 'package:food_delivery/utils/colors.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  //late PersistentTabController _controller;

  List pages = [
    MainFoodPage(),
    Container(child: Center(child: Text("Next Page")),),
    CartHistory(),
    AccountPage(),
  ];

  void onTapNav(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
/*  @override
  void initState() {
    super.initState();
    _controller =  PersistentTabController(initialIndex: 0);
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
          unselectedItemColor: Colors.amberAccent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0.0,
          unselectedFontSize: 0.0,
          currentIndex: _selectedIndex,
          onTap: onTapNav,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "Home"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.archive_outlined),
                label: "Archive"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                label: "Cart"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: "Me"
            ),
          ],
      ),
    );
  }
 /* List<Widget> _buildScreens() {
    return [
      MainFoodPage(),
      Container(child: Center(child: Text("Next Page")),),
      CartPage(),
      Container(child: Center(child: Text("Next next next  next Page")),),
    ];
  }
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons. archivebox_fill),
        title: ("Archive"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.cart_fill),
        title: ("Cart"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person),
        title: ("Me"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      // Remove this line completely
      padding: const EdgeInsets.only(top: 8),
      backgroundColor: Colors.grey.shade900,
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: kBottomNavigationBarHeight,
      navBarStyle: NavBarStyle.style1,
    );
  }*/
}
