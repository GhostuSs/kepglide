import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kepglide/ui/adverts.dart';
import 'package:kepglide/ui/chat.dart';
import 'package:kepglide/ui/drawer.dart';
import 'package:kepglide/ui/news.dart';
import 'package:kepglide/ui/shop.dart';
import 'package:kepglide/utils/color_palette.dart';

///Точка входа в приложение
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: (_, widget) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const MainPage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currIndex = 0;
  final List<Widget> pages = [
    NewsScreen(),
    AdvertsScreen(),
    ShopScreen(),
    ChatScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: RawDrawer(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border:
                Border(top: BorderSide(color: Colors.black.withOpacity(0.3)))),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.newspaper,
                  color: AppColors.gray,
                ),
                label: 'Новости'.toUpperCase(),
                activeIcon: Icon(
                  Icons.newspaper,
                  color: AppColors.mainBlue,
                )),
            BottomNavigationBarItem(
                label: 'Объявления',
                icon: Icon(
                  Icons.real_estate_agent_outlined,
                  color: AppColors.gray,
                ),
                activeIcon: Icon(
                  Icons.real_estate_agent,
                  color: AppColors.mainBlue,
                )),
            BottomNavigationBarItem(
                label: 'Барахолка',
                icon: Icon(
                  Icons.find_in_page_rounded,
                  color: AppColors.gray,
                ),
                activeIcon: Icon(
                  Icons.find_in_page_rounded,
                  color: AppColors.mainBlue,
                )),
            BottomNavigationBarItem(
                label: 'Чат',
                icon: Icon(
                  Icons.chat_bubble,
                  color: AppColors.gray,
                ),
                activeIcon: Icon(
                  Icons.chat_bubble,
                  color: AppColors.mainBlue,
                ),)
          ],
          backgroundColor: AppColors.gray,
          unselectedLabelStyle: TextStyle(
            fontFamily: 'MontBold',
            fontWeight: FontWeight.w400,
            color: AppColors.gray,
            fontSize: 12.h,
          ),
          showUnselectedLabels: true,
          showSelectedLabels: true,
          selectedLabelStyle: TextStyle(
            fontFamily: 'MontBold',
            fontWeight: FontWeight.w400,
            color: AppColors.mainBlue,
            fontSize: 12.h,
          ),
          currentIndex: currIndex,
          onTap: (index) {
            setState(() {
              currIndex = index;
            });
          },
        ),
      ),
      body: pages[currIndex],
      floatingActionButton: InkWell(
        onTap: ()=>print('+'),
        borderRadius: BorderRadius.circular(40.r),
        child: Container(
          width: 50.h,
          height: 50.h,
          decoration: BoxDecoration(
            color: AppColors.mainBlue,
            borderRadius: BorderRadius.circular(40.r)
          ),
          child: Center(
            child: Icon(Icons.add,color: AppColors.white,),
          ),
        ),
      ),
    );
  }
}
