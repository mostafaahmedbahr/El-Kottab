import '../../../../../core/helpers/format_date.dart';
import '../../../../../core/helpers/format_duration.dart';
import '../../../../../main_imports.dart';

class ReciterInfoAndMainData extends StatelessWidget {
  const ReciterInfoAndMainData({super.key, required this.reciterName, required this.reciterImage, required this.recordingDuration, required this.recordingDate});
  final String reciterName;
  final String reciterImage;
  final Duration recordingDuration;
  final DateTime recordingDate;
  @override
  Widget build(BuildContext context) {
    return   Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 60.w,
          height: 60.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.darkOlive,
              width: 2.w,
            ),
          ),
          child:  CustomNetWorkImage(
            raduis: 50,
            imageUrl: "https://ichef.bbci.co.uk/ace/standard/976/cpsprodpb/153FD/production/_126973078_whatsubject.jpg.webp",
            width: 60.w,
            height: 60.h,
            fit: BoxFit.cover,
          ),
        ),
        Gap(12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                reciterName,
                style: AppStyles.white16SemiBold,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Gap(4.w),
              Text(
                'جلسة القرآن الكريم',
                style: AppStyles.white12SemiBold,
              ),
              Gap(2.w),
              Text(
                'سورة البقرة - الجزء الأول',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12.sp,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Gap(6.h),
              Row(
                children: [

                  Row(
                    children: [
                      Icon(
                        Icons.timer,
                        size: 14.r,
                        color: Colors.white70,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        formatDuration(recordingDuration),
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 11.sp,
                        ),
                      ),
                    ],
                  ),
                  Gap(12.w),

                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 14.r,
                        color: Colors.white70,
                      ),
                      Gap(4.w),
                      Text(
                        formatDate(recordingDate),
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 11.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Column(
          children: [
            Container(
              padding: EdgeInsets.all(4.r),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                children: [
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        Icons.star,
                        size: 14.r,
                        color: index < 4 ? Colors.amber : Colors.grey.shade400,
                      );
                    }),
                  ),
                  Gap(2.h),
                  Text(
                    '4.0',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
            ),
            Gap(8.h),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    // _shareSession(context);
                  },
                  icon: Icon(
                    Icons.share,
                    color: Colors.white70,
                    size: 20.r,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(
                    minWidth: 32.w,
                    minHeight: 32.h,
                  ),
                ),
                
                IconButton(
                  onPressed: () {
                   // _deleteSession(context);
                  },
                  icon: SvgPicture.asset(SvgImages.trash),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(
                    minWidth: 32.w,
                    minHeight: 32.h,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }


}
