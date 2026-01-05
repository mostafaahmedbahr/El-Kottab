import '../../features/teacher_details/presentation/view_model/teacher_details_cubit.dart';
import '../../features/teachers/presentation/view_model/teachers_cubit.dart';
import '../../features/teachers/presentation/view_model/teachers_states.dart';
import '../../main_imports.dart';

class GeneralFavIcon extends StatelessWidget {
  const GeneralFavIcon({super.key, required this.isFav, required this.teacherId});
  final bool isFav;
  final int teacherId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TeachersCubit, TeachersStates>(
      listener: (context, state) async {
        if (state is AddTeachersFavSuccessState) {
          Toast.showSuccessToast(
            msg: state.addToFavModel.message.toString(),
            context: context,
          );
          context
              .read<TeacherDetailsCubit>()
              .getTeachersDetails(
            teacherId: teacherId,
            loading: false,
          );
          await   context.read<TeachersCubit>().getAllTeachers(loading: false);
          if(context.mounted){
            await    context.read<TeachersCubit>().getFavTeachers();
          }
        } else if (state is AddTeachersFavErrorState) {
          Toast.showErrorToast(
            msg: state.error.toString(),
            context: context,
          );
        }
      },
      builder: (context, state) {
        var teachersCubit = context.read<TeachersCubit>();
        return InkWell(
          borderRadius: BorderRadius.circular(20.r),
          onTap: () {
            isFav == true ?  teachersCubit.removeTeacherFromFav(teacherId: teacherId):
            teachersCubit.addToFav(teacherId: teacherId);
          },
          child: Container(
            padding: EdgeInsets.all(4.r),
            height: 30.h,
            width: 30.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white,
            ),
            child: Icon(
              isFav == true
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: isFav == true
                  ? AppColors.errorDark
                  : AppColors.gray,
            ),
          ),
        );
      },
    );
  }
}
