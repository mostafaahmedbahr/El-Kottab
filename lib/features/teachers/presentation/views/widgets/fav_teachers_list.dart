import 'package:el_kottab/features/teachers/presentation/views/widgets/teachers_list_item.dart';

import '../../../../../core/shared_widgets/empty_widget.dart';
import '../../../../../main_imports.dart';
import '../../view_model/teachers_cubit.dart';
import '../../view_model/teachers_states.dart';
import 'all_teachers_loading.dart';

class FavTeachersList extends StatelessWidget {
  const FavTeachersList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeachersCubit, TeachersStates>(
      buildWhen: (previous, current) {
        return current is GetAllFavTeachersSuccessState ||
            current is GetAllFavTeachersErrorState ||
            current is GetAllFavTeachersLoadingState;
      },
      builder: (context, state) {
        var teachersCubit = context.read<TeachersCubit>();
        return
          state is GetAllFavTeachersLoadingState || teachersCubit.favTeachersModel == null ? AllTeachersLoading():
          teachersCubit.favTeachersModel != null && teachersCubit.favTeachersModel!.data!.isEmpty ? EmptyWidget(msg: LangKeys.noTeachersFound,):
          ListView.separated(
            itemBuilder: (context, index) {
              return TeachersListItem(teacher: teachersCubit.favTeachersModel!.data![index]);
            },
            separatorBuilder: (context, index) {
              return Gap(12.h);
            },
            itemCount: teachersCubit.favTeachersModel!.data!.length,
          );
      },
    );
  }
}
