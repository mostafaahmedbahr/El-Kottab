import 'package:el_kottab/features/sessions/presentation/views/widgets/reciter_info_and_main_data.dart';
import '../../../../../main_imports.dart';
import 'additional_actions_button_and_sound_icon.dart';
import 'control_bar.dart';

class SessionItem extends StatelessWidget {
  final bool isPlaying;
  final String reciterName;
  final String reciterImage;
  final Duration recordingDuration;
  final DateTime recordingDate;

  const SessionItem({
    super.key,
    this.isPlaying = false,
    required this.reciterName,
    required this.reciterImage,
    required this.recordingDuration,
    required this.recordingDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: AppColors.errorDark,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.darkOlive,
            AppColors.gold.withValues(alpha: 0.8),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 12.r,
            offset: Offset(0, 6.h),
          ),
        ],
      ),
      child: Column(
        children: [
          ReciterInfoAndMainData(reciterName: reciterName, reciterImage: reciterImage, recordingDuration: recordingDuration, recordingDate: recordingDate),
          Gap(16.h),
          ControlBar(isPlaying: isPlaying, recordingDuration: recordingDuration),
          Gap(12.h),
          AdditionalActionsButtonAndSoundIcon()
        ],
      ),
    );
  }







  // // دالة للمشاركة
  // void _shareSession(BuildContext context) {
  //   // كود المشاركة
  //   // يمكن استخدام حزمة مثل share_plus
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: Text('مشاركة الجلسة'),
  //       content: Text('هل تريد مشاركة هذه الجلسة؟'),
  //       actions: [
  //         TextButton(
  //           onPressed: () => Navigator.pop(context),
  //           child: Text('إلغاء'),
  //         ),
  //         TextButton(
  //           onPressed: () {
  //             Navigator.pop(context);
  //             // كود المشاركة الفعلي
  //           },
  //           child: Text('مشاركة'),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // دالة للحذف
  // void _deleteSession(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: Text('حذف الجلسة'),
  //       content: Text('هل أنت متأكد من حذف هذه الجلسة؟'),
  //       actions: [
  //         TextButton(
  //           onPressed: () => Navigator.pop(context),
  //           child: Text('إلغاء'),
  //         ),
  //         TextButton(
  //           onPressed: () {
  //             Navigator.pop(context);
  //             // كود الحذف الفعلي
  //           },
  //           child: Text(
  //             'حذف',
  //             style: TextStyle(color: Colors.red),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}