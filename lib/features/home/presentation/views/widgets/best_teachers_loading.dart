import 'package:shimmer/shimmer.dart';

import '../../../../../main_imports.dart';
import 'best_teacher_item.dart';

class BestTeachersLoading extends StatelessWidget {
  const BestTeachersLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: BestTeacherItem(
              teacherName: 'name',
              teacherRate: "5.0",
              teacherNumber: "01110690299"
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Gap(16.w);
      },
      itemCount: 4,
      padding: EdgeInsets.symmetric(vertical: 8.h),
    );
  }
}