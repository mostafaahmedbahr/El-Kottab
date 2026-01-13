import 'dart:math';
import '../../../../../main_imports.dart';
import '../../view_model/teachers_cubit.dart';
import '../../view_model/teachers_states.dart';
import 'all_teachers_list.dart';
import 'fav_teachers_list.dart';

class TeachersListBody extends StatelessWidget {
  const TeachersListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeachersCubit , TeachersStates>(
      builder: (context,state){
         final teachersCubit = context.read<TeachersCubit>();
         return Expanded(
          child: PageView.builder(
            controller: teachersCubit.pageController,
            itemCount: 2,
            onPageChanged: (index) {
              teachersCubit.onPageChanged(index);
            },
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: teachersCubit.pageController,
                builder: (context, child) {
                  double value = 0;
                  if (teachersCubit.pageController.position.haveDimensions) {
                    value = teachersCubit.pageController.page! - index;
                  }

                  double rotation = value.clamp(-1, 1);

                  double scaleDown = 1 - (rotation.abs() * 0.3);
                  double scaleUp = 1 + (rotation.abs() * 0.2);

                  bool isCurrentPage = rotation == 0;
                  double appliedScale = isCurrentPage ? scaleUp : scaleDown;

                  double angle = -rotation * pi / 2;

                  return Transform(
                    alignment: rotation > 0
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(angle)
                      ..scaleByDouble(
                        appliedScale,
                        appliedScale,
                        1.0,
                        1.0,
                      ),
                    child: child,
                  );
                },
                child: index == 0
                    ? AllTeachersList()
                    : FavTeachersList(),
              );

            },
          ),
        );
      },

    );
  }
}
