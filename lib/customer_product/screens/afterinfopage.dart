import 'package:flutter/material.dart';
import 'package:guido/constants/colors.dart';
import 'package:guido/customer_product/navscreens/bookingsPage.dart';
import 'package:guido/customer_product/navscreens/customerProfile.dart';
import 'package:guido/customer_product/navscreens/explore.dart';
import 'package:guido/customer_product/navscreens/inbox.dart';
import 'package:guido/customer_product/navscreens/wishlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guido/client_product/screens/clientProfile.dart';
import 'package:guido/client_product/screens/signuppage.dart';
import 'package:guido/constants/colors.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';



class AfterInfoPage extends StatefulWidget {
  const AfterInfoPage({super.key});

  @override
  State<AfterInfoPage> createState() => _AfterInfoPageState();
}

class _AfterInfoPageState extends State<AfterInfoPage> {
  

  @override
  Widget build(BuildContext context) { 
          PersistentTabController _controller;
          _controller = PersistentTabController(initialIndex: 0);
           List<Widget> _buildScreens() {
        return [
           const ExplorePage(),
           const WishlistPage(),
           const BookingsPage(),
           const InboxPage(),
           const CustomerProfile(),
         
        ];
    }
     List<PersistentBottomNavBarItem> _navBarsItems() {
        return [
            PersistentBottomNavBarItem(
              inactiveIcon: const Icon(LineIcons.search,color: Color(0xB0000000),size: 25,),
                icon: ShaderMask(
              shaderCallback: ( bounds) {
                return LinearGradient(
                 begin: Alignment.topLeft,
                 end: Alignment.bottomRight,
                  colors: <Color>[
                     orange,
                    yellow,
                    
                  ],
                  tileMode: TileMode.mirror,
                ).createShader(bounds);
              },
              child: const Icon(LineIcons.search,color: Colors.white,size: 25,),
            ),
                
                title: ("Explore"),
                activeColorPrimary: yellow,
                activeColorSecondary: orange,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
              inactiveIcon: const Icon(LineIcons.heart,color: Color(0xB0000000),size: 25,),
                icon: ShaderMask(
              shaderCallback: ( bounds) {
                return LinearGradient(
                 begin: Alignment.topLeft,
                 end: Alignment.bottomRight,
                  colors: <Color>[
                     orange,
                    yellow,
                  ],
                  tileMode: TileMode.mirror,
                ).createShader(bounds);
              },
              child: const Icon(LineIcons.heart,color: Colors.white,size: 25,),
            ),
                title: ("Wishlist"),
                activeColorPrimary: CupertinoColors.systemYellow,
                activeColorSecondary: orange,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            // PersistentBottomNavBarItem(
            //     icon: ShaderMask(
            //   shaderCallback: ( bounds) {
            //     return LinearGradient(
            //      begin: Alignment.topLeft,
            //      end: Alignment.bottomRight,
            //       colors: <Color>[
            //         yellow,
            //         orange
            //       ],
            //       tileMode: TileMode.mirror,
            //     ).createShader(bounds);
            //   },
            //   child: const Icon(LineIcons.plus,color: Colors.white,),
            // ),
            //     title: ("Guido"),
            //     activeColorPrimary: CupertinoColors.systemYellow,
            //     activeColorSecondary: orange,
            //     inactiveColorPrimary: CupertinoColors.systemGrey,
            // ),
            PersistentBottomNavBarItem(
              inactiveIcon: const Icon(LineIcons.shoppingBag,color: Color(0xB0000000),size: 25,),
                icon: ShaderMask(
              shaderCallback: ( bounds) {
                return LinearGradient(
                 begin: Alignment.topLeft,
                 end: Alignment.bottomRight,
                  colors: <Color>[
                     orange,
                    yellow,
                  ],
                  tileMode: TileMode.mirror,
                ).createShader(bounds);
              },
              child: const Icon(LineIcons.shoppingBag,color: Colors.white,size: 25,),
            ),
                
                title: ("Bookings"),
                activeColorPrimary: CupertinoColors.systemYellow,
                activeColorSecondary: orange,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
              inactiveIcon: const Icon(LineIcons.box,color: Color(0xB0000000),size: 25,),
                icon: ShaderMask(
              shaderCallback: ( bounds) {
                return LinearGradient(
                 begin: Alignment.topLeft,
                 end: Alignment.bottomRight,
                  colors: <Color>[
                     orange,
                    yellow,
                  ],
                  tileMode: TileMode.mirror,
                ).createShader(bounds);
              },
              child: const Icon(LineIcons.box,color: Colors.white,size: 25,),
            ),
                
                title: ("Inbox"),
                activeColorPrimary: CupertinoColors.systemYellow,
                activeColorSecondary: orange,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
              inactiveIcon: const Icon(LineIcons.user,color: Color(0xB0000000),size: 25,),
                icon: ShaderMask(
              shaderCallback: ( bounds) {
                return LinearGradient(
                 begin: Alignment.topLeft,
                 end: Alignment.bottomRight,
                  colors: <Color>[
                     orange,
                    yellow,
                  ],
                  tileMode: TileMode.mirror,
                ).createShader(bounds);
              },
              child: const Icon(LineIcons.user,color: Colors.white,size: 25,),
            ),
                title: ("Profile"),
                activeColorPrimary: CupertinoColors.systemYellow,
                activeColorSecondary: orange,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            
        ];
    }
    return PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation:const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style12, // Choose the nav bar style with this property.
        navBarHeight: MediaQuery.of(context).size.width*0.1,
    );
  }
}
