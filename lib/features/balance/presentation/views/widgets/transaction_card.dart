import '../../../../../main_imports.dart';
import '../../../../profile/data/models/profile_model.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({super.key,   required this.plan});

  final Plan plan;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12.r),
      color: AppColors.white,
      elevation: 1,
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: Theme.of(context).dividerColor.withValues(alpha: 0.1),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    plan.name.toString(),
                    style: AppStyles.primary16SemiBold,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: _getStatusColor(plan.isSubscribed.toString()).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    plan.isSubscribed.toString(),
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                      color: _getStatusColor(plan.isSubscribed.toString()),
                    ),
                  ),
                ),
              ],
            ),
            Gap(12.h),

          ],
        ),
      ),
    );
  }
}

Color _getStatusColor(String status) {
  switch (status) {
    case 'نشط':
      return Colors.green;
    case 'منتهي':
      return Colors.red;
    case 'مكتمل':
      return Colors.blue;
    default:
      return Colors.grey;
  }
}