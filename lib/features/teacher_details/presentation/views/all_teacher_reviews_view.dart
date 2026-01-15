import 'package:el_kottab/features/teacher_details/presentation/view_model/teacher_details_states.dart';
import 'package:el_kottab/features/teacher_details/presentation/views/widgets/comment_item.dart';
 import '../../../../main_imports.dart';
import '../view_model/teacher_details_cubit.dart';

class AllTeacherReviewsView extends StatelessWidget {
  const AllTeacherReviewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeacherDetailsCubit, TeacherDetailsStates>(
      builder: (context, state) {
        var teacherDetailsCubit = context.read<TeacherDetailsCubit>();
        return ListView.separated(
          padding: EdgeInsets.all(16.r),
          itemBuilder: (context, index) {
            final review =
                teacherDetailsCubit.teacherReviewsModel!.data![index];
            return CommentItem(
              userName: review.user?.name ?? "",
              userImage: review.user?.image ?? "",
              rating: review.rate ?? 0.0,
              commentText: review.comment ?? "",
            );
          },
          separatorBuilder: (context, index) {
            return Gap(12.h);
          },
          itemCount: teacherDetailsCubit.teacherReviewsModel!.data!.length,
        );
      },
    );
  }
}
