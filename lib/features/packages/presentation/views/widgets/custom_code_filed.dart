import 'package:easy_localization/easy_localization.dart';
import 'package:el_kottab/main_imports.dart';

class CustomCodeFormField extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onAdd;
  final String? hintText;

  const CustomCodeFormField({
    super.key,
    required this.controller,
    required this.onAdd,
    this.hintText,
  });

  @override
  State<CustomCodeFormField> createState() => _CustomCodeFormFieldState();
}

class _CustomCodeFormFieldState extends State<CustomCodeFormField> {
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: LangKeys.writePackageCode.tr(),
      suffixIcon: Container(
        height: 54.h,
        width: 100.w,
        decoration: BoxDecoration(
          color: AppColors.darkOlive,
          borderRadius: BorderRadius.only(topRight: Radius.circular(8.r),
              bottomRight: Radius.circular(8.r)),
        ),

        child: Center(child: Text(LangKeys.apply.tr(),
        style: AppStyles.white16SemiBold,),),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}