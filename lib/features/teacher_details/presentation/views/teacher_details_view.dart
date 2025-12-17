import 'package:easy_localization/easy_localization.dart';
import 'package:el_kottab/features/teacher_details/data/models/teacher_details_model.dart';
import 'package:el_kottab/features/teacher_details/data/repos/teacher_details_repo_imple.dart';
import 'package:el_kottab/features/teacher_details/presentation/view_model/teacher_details_cubit.dart';
import 'package:el_kottab/features/teacher_details/presentation/view_model/teacher_details_states.dart';
import 'package:el_kottab/features/teacher_details/presentation/views/widgets/main_teacher_info_container.dart';
import 'package:el_kottab/features/teacher_details/presentation/views/widgets/teacher_details_item.dart';
import 'package:el_kottab/features/teacher_details/presentation/views/widgets/teacher_reviews.dart';
import 'package:el_kottab/main_imports.dart';

import '../../../../core/app_services/remote_services/service_locator.dart';

class TeacherDetailsView extends StatelessWidget {
  const TeacherDetailsView({super.key, required this.teacherName, required this.teacherId});

  final String teacherName;
  final int teacherId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(teacherName)),
      body: BlocProvider(
        create: (context) =>
            TeacherDetailsCubit(getIt.get<TeacherDetailsRepoImpl>())..getTeachersDetails(teacherId: teacherId),
        child: BlocConsumer<TeacherDetailsCubit , TeacherDetailsStates>(
          listener: (context,state){} ,
          builder: (context,state){
            var teacherDetailsCubit = context.read<TeacherDetailsCubit>();
            Data? teacher;
            if(teacherDetailsCubit.teachersDetailsModel!=null){
                teacher = teacherDetailsCubit.teachersDetailsModel!.data;
            }
            return
              state is GetTeacherDetailsLoadingState || teacherDetailsCubit.teachersDetailsModel==null ? CustomLoading():
              Padding(
              padding: EdgeInsets.all(20.0.r),
              child: ListView(
                children: [
                  MainTeacherInfoContainer(name: teacher?.name ?? "", email: teacher?.email??""),
                  Gap(12.h),
                  /// summary
                  TeacherDetailsItem(
                    svgImage: SvgImages.summary,
                    title: LangKeys.summary.tr(),
                    des: teacher?.summary??"",
                  ),
                  Gap(12.h),
                  /// summary
                  TeacherDetailsItem(
                    svgImage: SvgImages.star,
                    title: LangKeys.compatibility.tr(),
                    des: "des"*10,
                  ),
                  Gap(12.h),
                  /// summary
                  TeacherDetailsItem(
                    svgImage: SvgImages.ejazat,
                    title: LangKeys.ejazat.tr(),
                    des: "des"*10,
                  ),
                  Gap(12.h),
                  /// summary
                  TeacherDetailsItem(
                    svgImage: SvgImages.lang,
                    title: LangKeys.languages.tr(),
                    des: "des"*10,
                  ),
                  Gap(12.h),
                  TeacherReviews()
                ],
              ),
            );
          } ,

        ),
      ),
    );
  }
}
