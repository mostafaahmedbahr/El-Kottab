import 'package:easy_localization/easy_localization.dart';
import 'package:el_kottab/features/login/presentation/views/login_view.dart';
import '../../main_imports.dart';

class ClickHereToRegister extends StatelessWidget {
  const ClickHereToRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextButton(
          onPressed: (){
            showLoginBottomSheet(context);
          },
         child: Text( LangKeys.toRegisterClickHere.tr(),style: AppStyles.black16SemiBold,)),
      ],
    );
  }
}




showLoginBottomSheet(context)=>  showModalBottomSheet(
  context: context,
  backgroundColor: Colors.white,
  clipBehavior: Clip.antiAlias,
  constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.30),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ),
  ),
  builder: (context) => const LoginBottomSheet(),
);


class LoginBottomSheet extends StatelessWidget {
  const LoginBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(LangKeys.signIn.tr(),style: AppStyles.primary16SemiBold,),
              InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.close)),
            ],
          ),
          Gap(15.h),
          SvgPicture.asset(SvgImages.login, width: MediaQuery.of(context).size.width * 0.2),
          Gap(30.h),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                    btnColor: Colors.white,
                    borderColor: AppColors.darkOlive,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    btnText: LangKeys.cancel.tr(),
                  style: AppStyles.black16SemiBold,
                ),
              ),
              Gap(15.h),
              Expanded(
                child: CustomButton(
                    onPressed: () {
                      AppNav.customNavigator(context: context, screen: LoginView(),finish: true);
                    },
                    btnText: LangKeys.signIn.tr()
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}


class GoToLogin extends StatelessWidget {
  const GoToLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(SvgImages.login, width: MediaQuery.of(context).size.width * 0.2),
          Gap(30.h),
          CustomButton(
              onPressed: () {
                AppNav.customNavigator(context: context, screen: LoginView(),finish: true);
              },
              btnText: LangKeys.signIn.tr()
          )
        ],
      ),
    );
  }
}
