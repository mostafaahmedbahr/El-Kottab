import 'package:easy_localization/easy_localization.dart';
import 'package:el_kottab/main_imports.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({
    super.key,
    required this.userName,
    required this.userImage,
    required this.commentText,
    required this.rating,
  });

  final String userName;
  final String userImage;
  final String commentText;
  final dynamic rating;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade200, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomNetWorkImage(imageUrl: userImage, raduis: 50,height: 40.h,width: 40.w,fit: BoxFit.cover,),
              Gap(12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Gap(4.h),
                    Row(
                      children: [
                        // Text(
                        //   _formatTime(createdAt),
                        //   style: TextStyle(
                        //     fontSize: 11.sp,
                        //     color: Colors.grey.shade600,
                        //   ),
                        // ),
                        // Gap(8.w),

                        Row(
                          children: List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              size: 14.r,
                              color: index < rating.floor()
                                  ? Colors.amber
                                  : Colors.grey.shade300,
                            );
                          }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          // Comment Text
          Text(
            commentText,
            style: TextStyle(
              fontSize: 13.sp,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inMinutes < 1) {
      return 'الآن';
    } else if (difference.inHours < 1) {
      return 'منذ ${difference.inMinutes} دقيقة';
    } else if (difference.inHours < 24) {
      return 'منذ ${difference.inHours} ساعة';
    } else if (difference.inDays < 7) {
      return 'منذ ${difference.inDays} يوم';
    } else {
      return DateFormat('yyyy/MM/dd').format(date);
    }
  }
}