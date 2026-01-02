import 'package:easy_localization/easy_localization.dart';
import 'package:el_kottab/features/free_learning/data/repos/free_learning_repo_imple.dart';
import 'package:el_kottab/features/free_learning/presentation/view_model/free_learning_cubit.dart';
import 'package:el_kottab/features/free_learning/presentation/view_model/free_learning_states.dart';
import 'package:el_kottab/features/free_learning/presentation/views/widgets/invitation_supported.dart';
import 'package:el_kottab/features/free_learning/presentation/views/widgets/main_info.dart';
import 'package:el_kottab/features/free_learning/presentation/views/widgets/random_teacher_info.dart';
import 'package:el_kottab/main_imports.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/app_services/remote_services/service_locator.dart';

class FreeLearningView extends StatelessWidget {
  const FreeLearningView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LangKeys.aLFatihahInitiative.tr()),
      ),
      body: BlocProvider(
        create: (context)=>FreeLearningCubit(getIt.get<FreeLearningRepoImpl>())..getRandomTeacher(),
        child: BlocBuilder<FreeLearningCubit , FreeLearningStates>(
          builder: (context,state){
            var freeLearningCubit = context.read<FreeLearningCubit>();
            final isLoading = state is GetRandomTeacherLoadingState || freeLearningCubit.randomTeacherModel==null;

            return Skeletonizer(
              enabled: isLoading,
              child: Padding(
                padding:   EdgeInsets.all(20.0.r),
                child: ListView(
                  children: [
                    MainInfo(),
                    Gap(24.h),
                    InvitationSupported(),
                    Gap(24.h),
                    RandomTeacherInfo(),
                    Gap(24.h),
                    CustomButton(
                        btnText: LangKeys.startFreeLearning.tr(),
                        onPressed: (){}),
                    Gap(20.h),
                  ],
                ),
              ),
            );
          },

        ),
      ),
    );
  }
}
