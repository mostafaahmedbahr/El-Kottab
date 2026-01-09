import 'package:el_kottab/features/teachers/data/models/all_teachers_model.dart';
import 'package:el_kottab/features/teachers/presentation/views/widgets/teacher_main_info_data.dart';
import 'package:el_kottab/main_imports.dart';
import '../../../../teacher_details/presentation/views/teacher_details_view.dart';
import 'about_the_teacher.dart';
import 'calls_buttons.dart';

class TeachersListItem extends StatelessWidget {
  const TeachersListItem({super.key, required this.teacher});

  final dynamic teacher;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppNav.customNavigator(
          context: context,
          screen: TeacherDetailsView(
            teacherName: teacher.name.toString(),
            teacherId: teacher.id!,
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.darkOlive),
        ),
        child: Column(
          children: [
            TeacherMainInfoData(
              name: teacher.name ?? "",
              rate: teacher.rate ?? 0,
              languages: teacher.languages ?? [],
              image: teacher.image.toString(),
              isFav: teacher.isFav??false,
              teacherId: teacher.id??0,
            ),
            Gap(6.h),
            AboutTheTeacher(des: teacher.category.toString()),
            Gap(6.h),
            CallsButtons(
                teacherName:  teacher.name ?? "",
                teacherImage: teacher.image ?? "",
                teacherId: teacher.id??0,
            ),
          ],
        ),
      ),
    );
  }
}
