import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(47.h),
        child: Container(
          padding: EdgeInsets.only(
            top: 50.h,
            right: 16.w,
            bottom: 8.h,
            left: 16.w,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.arrow_back, size: 24),
              Expanded(
                child: Container(
                  height: 23.h,
                  alignment: Alignment.center,
                  color: Colors.blueAccent.withOpacity(0.1), // 🟦 AppBar title background
                  child: const Text(
                    'Tasks',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      height: 23 / 18,
                      letterSpacing: 0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 24.w),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: 390.w,
            height: 102.h,
            padding: EdgeInsets.all(16.r),
            color: Colors.redAccent.withOpacity(0.2), // 🟥 Outer body container
            child: Container(
              width: 358.w,
              height: 70.h,
              decoration: BoxDecoration(
                color: Colors.yellowAccent.withOpacity(0.5), // 🟨 Inner task container
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // First child (task title + description)
                  Container(
                    width: 228.w,
                    height: 70.h,
                    color: Colors.greenAccent.withOpacity(0.3), // 🟩 Task text section
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Task Title',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Task description',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Second child (e.g., icon or checkbox)
                  Container(
                    width: 24.w,
                    height: 24.h,
                    color: Colors.purpleAccent.withOpacity(0.4), // 🟪 Action/Status box
                    child: const Icon(Icons.check, size: 20),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
