import 'package:easy_localization/easy_localization.dart';
import 'package:el_kottab/features/teacher_details/data/repos/teacher_details_repo_imple.dart';
import 'package:el_kottab/features/teacher_details/presentation/view_model/teacher_details_cubit.dart';
import 'package:el_kottab/features/teacher_details/presentation/views/widgets/main_teacher_info_container.dart';
import 'package:el_kottab/features/teacher_details/presentation/views/widgets/teacher_details_item.dart';
import 'package:el_kottab/features/teacher_details/presentation/views/widgets/teacher_reviews.dart';
import 'package:el_kottab/main_imports.dart';

import '../../../../core/app_services/remote_services/service_locator.dart';

class TeacherDetailsView extends StatelessWidget {
  const TeacherDetailsView({super.key, required this.teacherName});

  final String teacherName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(teacherName)),
      body: BlocProvider(
        create: (context) =>
            TeacherDetailsCubit(getIt.get<TeacherDetailsRepoImpl>()),
        child: Padding(
          padding: EdgeInsets.all(20.0.r),
          child: ListView(
            children: [
              MainTeacherInfoContainer(),
              Gap(12.h),
              /// summary
              TeacherDetailsItem(
                svgImage: SvgImages.summary,
                title: LangKeys.summary.tr(),
                des: "des"*10,
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
        ),
      ),
    );
  }
}
