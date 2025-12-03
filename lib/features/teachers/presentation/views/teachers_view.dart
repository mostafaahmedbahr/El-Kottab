import 'package:el_kottab/features/teachers/data/repos/teachers_repo_imple.dart';
import 'package:el_kottab/features/teachers/presentation/view_model/teachers_cubit.dart';
import 'package:el_kottab/features/teachers/presentation/views/widgets/all_teachers_and_fav_toggle_buttons.dart';
import 'package:el_kottab/features/teachers/presentation/views/widgets/search_and_filter.dart';
import 'package:el_kottab/features/teachers/presentation/views/widgets/teachers_list_body.dart';
import 'package:el_kottab/main_imports.dart';
import '../../../../core/app_services/remote_services/service_locator.dart';

class TeachersView extends StatelessWidget {
  const TeachersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context)=>TeachersCubit(getIt.get<TeachersRepoImpl>()),
        child: Padding(
          padding:   EdgeInsets.symmetric(horizontal: 12.w,vertical: 20.h),
          child: Column(
            children: [
              AllTeachersAndFavToggleButtons(),
              Gap(18.h),
              SearchAndFilter(),
              Gap(18.h),
              TeachersListBody(),
            ],
          ),
        ),
      ),
    );
  }
}
