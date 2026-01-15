import 'package:easy_localization/easy_localization.dart';
import 'package:el_kottab/features/teacher_details/presentation/view_model/teacher_details_states.dart';
import 'package:el_kottab/features/teacher_details/presentation/views/widgets/comment_item.dart';
 import '../../../../main_imports.dart';
import '../../data/models/teacher_reviews_model.dart';
import '../view_model/teacher_details_cubit.dart';

class AllTeacherReviewsView extends StatelessWidget {
  const AllTeacherReviewsView({super.key, required this.reviews});
  final List<Data>? reviews;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeacherDetailsCubit, TeacherDetailsStates>(
      builder: (context, state) {
        var teacherDetailsCubit = context.read<TeacherDetailsCubit>();
        return Scaffold(
          appBar: AppBar(
            title: Text(LangKeys.allReviews.tr()),
          ),
          body:
          reviews!.isEmpty ? Center(child: Text(LangKeys.noReviewsYet.tr())):
          ListView.separated(
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
            itemCount:reviews?.length ?? 0,
          ),
        );
      },
    );
  }
}
