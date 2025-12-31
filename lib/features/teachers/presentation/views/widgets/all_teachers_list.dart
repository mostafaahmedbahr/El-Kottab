import 'package:el_kottab/features/teachers/presentation/view_model/teachers_cubit.dart';
import 'package:el_kottab/features/teachers/presentation/view_model/teachers_states.dart';
import 'package:el_kottab/features/teachers/presentation/views/widgets/teachers_list_item.dart';
import 'package:el_kottab/main_imports.dart';

import '../../../../../core/shared_widgets/empty_widget.dart';
import 'all_teachers_loading.dart';

class AllTeachersList extends StatelessWidget {
  const AllTeachersList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeachersCubit, TeachersStates>(
      buildWhen: (previous, current) {
        return current is GetAllTeachersSuccessState ||
            current is GetAllTeachersErrorState ||
            current is GetAllTeachersLoadingState;
      },
      builder: (context, state) {
        var teachersCubit = context.read<TeachersCubit>();
        return
          state is GetAllTeachersLoadingState || teachersCubit.allTeachersModel == null ? AllTeachersLoading():
          teachersCubit.allTeachersModel != null && teachersCubit.allTeachersModel!.data!.isEmpty ? EmptyWidget(msg: LangKeys.noTeachersFound,):
          ListView.separated(
          itemBuilder: (context, index) {
            return TeachersListItem(teacher: teachersCubit.allTeachersModel!.data![index]);
          },
          separatorBuilder: (context, index) {
            return Gap(12.h);
          },
          itemCount: teachersCubit.allTeachersModel!.data!.length,
        );
      },
    );
  }
}
