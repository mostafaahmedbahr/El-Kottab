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
      builder: (context, state) {
        final cubit = context.read<TeachersCubit>();
        final teachers = cubit.displayedAllTeachers;

        if (state is GetAllTeachersLoadingState ||
            cubit.allTeachersModel == null) {
          return const AllTeachersLoading();
        }

        if (teachers.isEmpty) {
          return EmptyWidget(msg: LangKeys.noTeachersFound);
        }

        return ListView.separated(
          itemCount: teachers.length,
          separatorBuilder: (_, __) => Gap(12.h),
          itemBuilder: (context, index) {
            return TeachersListItem(teacher: teachers[index]);
          },
        );
      },
    );
  }
}

