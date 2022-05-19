import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kepglide/utils/color_palette.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        color: AppColors.mainBlue,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30.h, right: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.menu,
                        size: 30.r,
                      ),
                      color: AppColors.white,
                      onPressed: () => print('123'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 10.w,
                ),
                child: Text(
                  'Чат',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 24.w,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding:
                EdgeInsets.only(right: 10.w, top: 5.h, bottom: 10.h),
                child: Container(
                  height: 30.h,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColors.white.withOpacity(0.3),
                      ),
                      hintStyle: TextStyle(
                          color: AppColors.white.withOpacity(0.3)),
                      hintText: 'Поиск',
                      contentPadding: EdgeInsets.only(top: 10.h),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 90.h,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.chat,
            color: AppColors.gray,
            size: 150.h,
          ),
          Text(
            'Нет сообщений',
            style: TextStyle(color: AppColors.gray, fontSize: 25.h),
          )
        ],
      )
    ],
  );
}

class SegmentedChecks extends StatelessWidget {
  const SegmentedChecks(
      {Key? key, required this.onChanged, required this.segmentedControlValue})
      : super(key: key);
  final int segmentedControlValue;
  final void Function(int?) onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w, top: 15.h, bottom: 10.h),
      child: Container(
        padding: EdgeInsets.all(1.r),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColors.mainBlue, width: 1.h),
        ),
        child: CupertinoSlidingSegmentedControl(
            padding: EdgeInsets.zero,
            groupValue: segmentedControlValue,
            backgroundColor: Colors.black.withOpacity(0.2),
            thumbColor: AppColors.mainBlue,
            children: <int, Widget>{
              0: Tab(
                label: 'Все',
                index: 0,
                isSelectedIndex: segmentedControlValue,
              ),
              1: Tab(
                label: 'Избранное',
                index: 1,
                isSelectedIndex: segmentedControlValue,
              ),
            },
            onValueChanged: onChanged),
      ),
    );
  }
}

class Tab extends StatelessWidget {
  const Tab({
    Key? key,
    required this.label,
    required this.index,
    required this.isSelectedIndex,
  }) : super(key: key);

  final String label;
  final int index;
  final int isSelectedIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 25.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
                color: index != isSelectedIndex
                    ? AppColors.white.withOpacity(0.5)
                    : AppColors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15.h),
          ),
        ));
  }
}
