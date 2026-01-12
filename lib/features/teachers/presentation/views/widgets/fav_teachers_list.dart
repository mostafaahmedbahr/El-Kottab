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
      builder: (context, state) {
        final cubit = context.read<TeachersCubit>();
        final teachers = cubit.displayedFavTeachers;

        if (state is GetAllFavTeachersLoadingState ||
            cubit.favTeachersModel == null) {
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

