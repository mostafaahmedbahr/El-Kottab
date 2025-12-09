import '../../../../../main_imports.dart';

class BalanceSummaryCard extends StatelessWidget {
  const BalanceSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 12.r,
            offset: Offset(0, 6.h),
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.darkOlive,
            AppColors.gold.withValues(alpha: 0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Text(
            'الرصيد الإجمالي',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white.withValues(alpha: 0.9),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            '1500 دقيقة',
            style: TextStyle(
              fontSize: 32.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cairo',
            ),
          ),
          Gap(16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatItem(
                context,
                title: 'الباقات النشطة',
                value: '3',
              ),
              _buildStatItem(
                context,
                title: 'الدقائق المتبقية',
                value: '750',
              ),
              _buildStatItem(
                context,
                title: 'تاريخ التجديد',
                value: '15/12',
              ),
            ],
          ),
        ],
      ),
    );
  }
}



Widget _buildStatItem(BuildContext context, {required String title, required String value}) {
  return Column(
    children: [
      Text(
        value,
        style: TextStyle(
          fontSize: 16.sp,
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
      Gap(4.h),
      Text(
        title,
        style: TextStyle(
          fontSize: 10.sp,
          color: Colors.white.withValues(alpha: 0.8),
        ),
      ),
    ],
  );
}