import 'package:el_kottab/core/utils/app_nav.dart';
import 'package:el_kottab/features/teachers/presentation/views/widgets/teacher_main_info_data.dart';
import 'package:el_kottab/main_imports.dart';

import '../../../../teacher_details/presentation/views/teacher_details_view.dart';
import 'about_the_teacher.dart';
import 'calls_buttons.dart';

class TeachersListItem extends StatelessWidget {
  const TeachersListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        AppNav.customNavigator(context: context, screen: TeacherDetailsView(teacherName: "Mostafa Bahr",
        ));
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: AppColors.darkOlive,
          ),
        ),
        child: Column(
          children: [
            TeacherMainInfoData(),
            Gap(6.h),
            AboutTheTeacher(),
            Gap(6.h),
            CallsButtons(),

          ],
        ),
      ),
    );
  }
}
