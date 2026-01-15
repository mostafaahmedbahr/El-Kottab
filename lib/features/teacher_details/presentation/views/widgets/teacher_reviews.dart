import 'package:easy_localization/easy_localization.dart';
import 'package:el_kottab/core/shared_widgets/custom_error_widget.dart';
import 'package:el_kottab/features/teacher_details/presentation/view_model/teacher_details_cubit.dart';
import 'package:el_kottab/features/teacher_details/presentation/view_model/teacher_details_states.dart';
import 'package:el_kottab/features/teacher_details/presentation/views/all_teacher_reviews_view.dart';
import 'package:el_kottab/main_imports.dart';
import 'comment_item.dart';

class TeacherReviews extends StatefulWidget {
  const TeacherReviews({super.key, required this.teacherId});

  final int teacherId;

  @override
  State<TeacherReviews> createState() => _TeacherReviewsState();
}

class _TeacherReviewsState extends State<TeacherReviews> {
  @override
  void initState() {
    context.read<TeacherDetailsCubit>().getTeacherReviews(
      teacherId: widget.teacherId,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeacherDetailsCubit, TeacherDetailsStates>(
      buildWhen: (previous, current) {
        return current is GetTeacherReviewsSuccessState ||
            current is GetTeacherReviewsErrorState ||
            current is GetTeacherReviewsLoadingState;
      },
      builder: (context, state) {
        var teacherDetailsCubit = context.read<TeacherDetailsCubit>();
        return state is GetTeacherReviewsLoadingState
            ? CustomLoading()
            : state is GetTeacherReviewsErrorState
            ? CustomErrorWidget(
                onTap: () {
                  teacherDetailsCubit.getTeacherReviews(
                    teacherId: widget.teacherId,
                  );
                },
                errorMsg: state.error.toString(),
              )
            : Container(
                padding: EdgeInsets.all(12.r),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.darkOlive.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: AppColors.darkOlive.withValues(alpha: 0.2),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              SvgImages.comment,
                              height: 20.h,
                              width: 20.w,
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                AppColors.darkOlive,
                                BlendMode.srcIn,
                              ),
                            ),
                            Gap(6.w),
                            Text(
                              "${LangKeys.comments.tr()} : ",
                              style: AppStyles.black16SemiBold,
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            AppNav.customNavigator(
                              context: context,
                              screen: AllTeacherReviewsView(reviews: teacherDetailsCubit.teacherReviewsModel?.data??[],),
                            );
                          },
                          child: Text(
                            LangKeys.viewAll.tr(),
                            style: AppStyles.black16Medium,
                          ),
                        ),
                      ],
                    ),
                    Gap(8.h),
                    teacherDetailsCubit.teacherReviewsModel!.data!.isEmpty && state is GetTeacherReviewsSuccessState ?
                        Text(LangKeys.noReviewsYet.tr()):
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CommentItem(
                          userName:
                              "${teacherDetailsCubit.teacherReviewsModel!.data![index].user!.name}",
                          userImage:
                              "${teacherDetailsCubit.teacherReviewsModel!.data![index].user!.image}",
                          commentText:
                              "${teacherDetailsCubit.teacherReviewsModel!.data![index].comment}",
                          rating:
                              "${teacherDetailsCubit.teacherReviewsModel!.data![index].rate}",
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Gap(8.h);
                      },
                      itemCount:teacherDetailsCubit.teacherReviewsModel!.data!.length >= 2 ? 2 : teacherDetailsCubit.teacherReviewsModel!.data!.length,
                    ),
                  ],
                ),
              );
      },
    );
  }
}
