import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kepglide/utils/color_palette.dart';

class RawDrawer extends StatelessWidget {
  const RawDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
    width: 250.w,
        child: Column(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: AppColors.mainBlue
                ),
                child: SizedBox(
                  width:250.w,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h,),
                        Icon(
                          Icons.account_circle_outlined,
                          size: 70.r,
                          color: AppColors.white.withOpacity(0.2),
                        ),
                        SizedBox(height: 5.h,),
                        Text('test@gmail.com',style: TextStyle(
                          color: AppColors.white.withOpacity(0.4)
                        ),)

                      ],
                    ),
                  ),
                )),
            ListTile(
              leading: Icon(Icons.phone_callback,color: Colors.black,),
              title: Text('Мои заявки'),
            ),
            ListTile(
              leading: Icon(Icons.perm_device_info,color: Colors.black,),
              title: Text('Информация о ЖК'),
            ),
            ListTile(
              leading: Icon(Icons.map,color: Colors.black,),
              title: Text('Карта'),
            ),
            ListTile(
              leading: Icon(Icons.share,color: Colors.black,),
              title: Text('О программе'),
            ),
            ListTile(
              leading: Icon(Icons.logout,color: Colors.black,),
              title: Text('Выход'),
            )
          ],
        ),
      );
}
