import 'package:flutter/material.dart';
import 'package:sushil_s_application/core/utils/image_constant.dart';
import 'package:sushil_s_application/widgets/custom_button.dart';
import 'package:sushil_s_application/theme/text_style_helper.dart';
import 'package:sushil_s_application/theme/theme_helper.dart';
import '../../widgets/custom_image_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTaskScreen extends StatefulWidget {
  AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();

  String? selectedPriority;
  int? selectedAssigneeIndex;

  List<String> priorities = ['High', 'Medium', 'Low'];
  List<String> assigneeAvatars = [
    ImageConstant.imgDepth3Frame0,
    ImageConstant.imgDepth3Frame0,
    ImageConstant.imgDepth3Frame0
  ];

  @override
  void dispose() {
    taskTitleController.dispose();
    taskDescriptionController.dispose();
    dueDateController.dispose();
    super.dispose();
  }

  void handleAddTask() {
    if (taskTitleController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a task title')),
      );
      return;
    }

    Map<String, dynamic> taskData = {
      'title': taskTitleController.text,
      'description': taskDescriptionController.text,
      'priority': selectedPriority,
      'assignee': selectedAssigneeIndex,
      'dueDate': dueDateController.text,
    };

    print('Adding task: $taskData');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.colorFFF7F9,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: ScreenUtil().setHeight(16)),
              _buildTaskTitleInput(),
              SizedBox(height: ScreenUtil().setHeight(16)),
              _buildTaskDescriptionInput(),
              SizedBox(height: ScreenUtil().setHeight(16)),
              _buildPrioritySection(),
              SizedBox(height: ScreenUtil().setHeight(12)),
              _buildPriorityOptions(),
              SizedBox(height: ScreenUtil().setHeight(16)),
              _buildAssigneeSection(),
              SizedBox(height: ScreenUtil().setHeight(12)),
              _buildAssigneeAvatars(),
              SizedBox(height: ScreenUtil().setHeight(16)),
              _buildDueDateInput(),
              SizedBox(height: ScreenUtil().setHeight(32)),
              _buildAddTaskButton(),
              SizedBox(height: ScreenUtil().setHeight(20)),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: appTheme.colorFFF7F9,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          padding: EdgeInsets.all(ScreenUtil().setWidth(12)),
          child: CustomImageView(
            imagePath: ImageConstant.imgDepth4Frame0,
            height: ScreenUtil().setHeight(24),
            width: ScreenUtil().setHeight(24),
            fit: BoxFit.contain,
          ),
        ),
      ),
      title: Text(
        'Add Task',
        style: TextStyleHelper.instance.title18Bold,
      ),
      centerTitle: true,
    );
  }

  Widget _buildTaskTitleInput() {
    return Container(
      height: ScreenUtil().setHeight(56),
      width: double.infinity,
      decoration: BoxDecoration(
        color: appTheme.colorFFE8ED,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: TextFormField(
        controller: taskTitleController,
        style: TextStyleHelper.instance.title16,
        decoration: InputDecoration(
          hintText: 'Task Title',
          hintStyle: TextStyleHelper.instance.title16,
          border: InputBorder.none,
          contentPadding:
              EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16), vertical: ScreenUtil().setHeight(16)),
        ),
      ),
    );
  }

  Widget _buildTaskDescriptionInput() {
    return Container(
      height: ScreenUtil().setHeight(144),
      width: double.infinity,
      decoration: BoxDecoration(
        color: appTheme.colorFFE8ED,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: TextFormField(
        controller: taskDescriptionController,
        maxLines: 8,
        style: TextStyleHelper.instance.title16,
        decoration: InputDecoration(
          hintText: 'Task description...',
          hintStyle: TextStyleHelper.instance.title16,
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(ScreenUtil().setWidth(16)),
        ),
      ),
    );
  }

  Widget _buildPrioritySection() {
    return Container(
      height: ScreenUtil().setHeight(56),
      width: double.infinity,
      decoration: BoxDecoration(
        color: appTheme.colorFFE8ED,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: ScreenUtil().setWidth(16), top: ScreenUtil().setHeight(16)),
        child: Text(
          'Priority',
          style: TextStyleHelper.instance.title16
              .copyWith(color: appTheme.colorFF0C14),
        ),
      ),
    );
  }

  Widget _buildPriorityOptions() {
    return Row(
      children: priorities.map((priority) {
        bool isSelected = selectedPriority == priority;
        return Padding(
          padding: EdgeInsets.only(right: ScreenUtil().setWidth(12)),
          child: CustomButton(
            text: priority,
            backgroundColor:
                isSelected ? Color(0xFF197FE5) : appTheme.colorFFE8ED,
            textColor: isSelected ? appTheme.whiteCustom : appTheme.colorFF0C14,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16), vertical: ScreenUtil().setHeight(8)),
            borderRadius: 8.r,
            onPressed: () {
              setState(() {
                selectedPriority = priority;
              });
            },
          ),
        );
      }).toList(),
    );
  }

  Widget _buildAssigneeSection() {
    return Container(
      height: ScreenUtil().setHeight(56),
      width: double.infinity,
      decoration: BoxDecoration(
        color: appTheme.colorFFE8ED,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: ScreenUtil().setWidth(16), top: ScreenUtil().setHeight(16)),
        child: Text(
          'Assignee',
          style: TextStyleHelper.instance.title16
              .copyWith(color: appTheme.colorFF0C14),
        ),
      ),
    );
  }

  Widget _buildAssigneeAvatars() {
    return Row(
      children: assigneeAvatars.asMap().entries.map((entry) {
        int index = entry.key;
        String avatarPath = entry.value;
        bool isSelected = selectedAssigneeIndex == index;

        return Padding(
          padding: EdgeInsets.only(right: ScreenUtil().setWidth(8)),
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedAssigneeIndex = index;
              });
            },
            child: Container(
              width: index == 2 ? ScreenUtil().setHeight(44) : ScreenUtil().setHeight(34),
              height: ScreenUtil().setHeight(44),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: isSelected
                    ? Border.all(color: appTheme.colorFF197F, width: ScreenUtil().setWidth(2))
                    : null,
              ),
              child: ClipOval(
                child: CustomImageView(
                  imagePath: avatarPath,
                  width: index == 2 ? ScreenUtil().setHeight(44) : ScreenUtil().setHeight(34),
                  height: ScreenUtil().setHeight(44),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildDueDateInput() {
    return Container(
      height: ScreenUtil().setHeight(56),
      width: double.infinity,
      decoration: BoxDecoration(
        color: appTheme.colorFFE8ED,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: TextFormField(
        controller: dueDateController,
        style: TextStyleHelper.instance.title16,
        decoration: InputDecoration(
          hintText: 'Due Date',
          hintStyle: TextStyleHelper.instance.title16,
          border: InputBorder.none,
          contentPadding:
              EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16), vertical: ScreenUtil().setHeight(16)),
        ),
        onTap: () async {
          FocusScope.of(context).requestFocus(FocusNode());
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2025),
          );
          if (pickedDate != null) {
            dueDateController.text =
                '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
          }
        },
      ),
    );
  }

  Widget _buildAddTaskButton() {
    return SizedBox(
      width: double.infinity,
      height: ScreenUtil().setHeight(48),
      child: ElevatedButton(
        onPressed: handleAddTask,
        style: ElevatedButton.styleFrom(
          backgroundColor: appTheme.colorFF197F,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          elevation: 0,
        ),
        child: Text(
          'Add Task',
          style: TextStyleHelper.instance.title16Bold,
        ),
      ),
    );
  }
}
