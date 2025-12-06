import '../../../../../core/helpers/format_duration.dart';
import '../../../../../main_imports.dart';

class ControlBar extends StatelessWidget {
  const ControlBar({super.key, required this.isPlaying, required this.recordingDuration});
  final bool isPlaying;
  final Duration recordingDuration;
  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        Container(
          height: 6.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.r),
            color: Colors.white.withValues(alpha: 0.2),
          ),
          child: Stack(
            children: [
              FractionallySizedBox(
                widthFactor: 0.65,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.r),
                    gradient: LinearGradient(
                      colors: [
                        AppColors.darkOlive,
                        AppColors.darkOlive.withValues(alpha: 0.8),
                      ],
                    ),
                  ),
                ),
              ),

              Positioned(
                left: 30.w,
                top: -3.h,
                child: Container(
                  width: 12.w,
                  height: 12.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.3),
                        blurRadius: 4.r,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Gap(8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '0:00',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12.sp,
              ),
            ),

            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.replay_10,
                    color: Colors.white,
                    size: 22.r,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(
                    minWidth: 36.w,
                    minHeight: 36.h,
                  ),
                ),

                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_previous,
                    color: Colors.white,
                    size: 24.r,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(
                    minWidth: 36.w,
                    minHeight: 36.h,
                  ),
                ),

                Container(
                  width: 44.w,
                  height: 44.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isPlaying ? AppColors.darkOlive : Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: (isPlaying ? AppColors.darkOlive : Colors.white)
                            .withValues(alpha: 0.4),
                        blurRadius: 8.r,
                        offset: Offset(0, 3.h),
                      ),
                    ],
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      color: isPlaying ? Colors.white : AppColors.darkOlive,
                      size: 24.r,
                    ),
                    padding: EdgeInsets.zero,
                  ),
                ),


                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_next,
                    color: Colors.white,
                    size: 24.r,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(
                    minWidth: 36.w,
                    minHeight: 36.h,
                  ),
                ),


                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.forward_10,
                    color: Colors.white,
                    size: 22.r,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(
                    minWidth: 36.w,
                    minHeight: 36.h,
                  ),
                ),
              ],
            ),

            Text(
              formatDuration(recordingDuration),
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
