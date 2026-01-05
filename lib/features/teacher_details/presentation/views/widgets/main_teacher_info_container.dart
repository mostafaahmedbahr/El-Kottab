import 'package:el_kottab/features/teachers/presentation/view_model/teachers_states.dart';
import 'package:el_kottab/features/teachers/presentation/views/widgets/calls_buttons.dart';
import 'package:el_kottab/main_imports.dart';
import '../../../../teachers/presentation/view_model/teachers_cubit.dart';
import '../../../../teachers/presentation/views/widgets/profile_image.dart';
import '../../view_model/teacher_details_cubit.dart';

class MainTeacherInfoContainer extends StatelessWidget {
  const MainTeacherInfoContainer({
    super.key,
    required this.name,
    required this.email,
    required this.teacherId,
    required this.isFav,
  });

  final String name;
  final String email;
  final int teacherId;
  final bool isFav;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(12.r),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.darkOlive.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        BlocConsumer<TeachersCubit, TeachersStates>(
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
                              await   context.read<TeachersCubit>().getAllTeachers();
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
                        ),
                      ],
                    ),
                    Gap(8.h),
                    Text(
                      name,
                      style: AppStyles.black16SemiBold,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Gap(8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SvgPicture.asset(
                        //   SvgImages.star,
                        //   colorFilter: ColorFilter.mode(
                        //     AppColors.warningDark,
                        //     BlendMode.srcIn,
                        //   ),
                        // ),
                        // Gap(4.w),
                        Text(email),
                      ],
                    ),
                    Gap(12.h),
                    CallsButtons(),
                  ],
                ),
              ),
            ],
          ),
          ProfileImage(),
        ],
      ),
    );
  }
}
