import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mongo_authentication/Constants/constants.dart';

import 'BottomBar/Account.dart';
import 'BottomBar/Cart.dart';
import 'BottomBar/Explore.dart';
import 'BottomBar/Favourite.dart';
import 'BottomBar/Shop.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeIndex = 0;
  var myGroup = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getFooter() {
    List<IconData> icons = [
      Icons.home,
      Icons.search,
      Icons.shopping_cart_checkout_sharp,
      Icons.favorite,
      Icons.person,
    ];
    List<String> names = ["Shop", "Explore", "Cart", "Favorites", "Account"];
    return AnimatedBottomNavigationBar.builder(
      backgroundColor: Colors.white,
      splashColor: Colors.yellowAccent,
      notchSmoothness: NotchSmoothness.softEdge,
      itemCount: icons.length,
      activeIndex: activeIndex,
      gapWidth: 10,
      onTap: (index) {
        selectedTab(index);
      },
      //other params
      tabBuilder: (int index, bool isActive) {
        final color = isActive ? primaryColor : Colors.grey;
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icons[index],
              size: 24,
              color: color,
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: AutoSizeText(
                names[index],
                maxLines: 1,
                style: TextStyle(color: color, fontWeight: FontWeight.w500),
                group: myGroup,
              ),
            )
          ],
        );
      },
    );
  }

  selectedTab(index) {
    setState(() {
      activeIndex = index;
    });
  }

  Widget getBody() {
    List<Widget> pages = [
      const Shop(),
      const Explore(),
      const Cart(),
      const Favourite(),
      const Account(),
    ];
    return IndexedStack(
      index: activeIndex,
      children: pages,
    );
  }
}
