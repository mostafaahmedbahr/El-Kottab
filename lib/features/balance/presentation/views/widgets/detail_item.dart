import '../../../../../main_imports.dart';

class DetailItem extends StatelessWidget {
  const DetailItem({super.key,   this.title,   this.value});
  final String? title;
  final String? value;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            title.toString(),
            style: TextStyle(
              fontSize: 11.sp,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            value.toString(),
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
