import 'package:shimmer/shimmer.dart';
import '../../../../../main_imports.dart';

class AllTeachersLoading extends StatelessWidget {
  const AllTeachersLoading({super.key,  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: 200.h,
            width: double.infinity,
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: AppColors.darkOlive,
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Gap(16.h);
      },
      itemCount: 4,
      padding: EdgeInsets.symmetric(vertical: 8.h),
    );
  }
}
