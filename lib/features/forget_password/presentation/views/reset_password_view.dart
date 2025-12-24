import 'package:match_kora_app/features/forget_password/presentation/views/widgets/reset_password_view_body.dart';
import '../../../../main_importants.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text(AppStrings.resetPassword,style: TextStyle(
          color: AppColors.whiteColor,
        ),),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
            icon: Icon(Icons.arrow_back,color: AppColors.whiteColor,)),
      ),
      body:   ResetPasswordViewBody(),
    );
  }
}
