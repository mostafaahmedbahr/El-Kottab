import 'package:el_kottab/features/sessions/presentation/views/widgets/session_item.dart';
import 'package:el_kottab/main_imports.dart';

import '../../../../core/shared_cubits/auth_cubit/auth_cubit.dart';
import '../../../../core/shared_widgets/click_here_to_register.dart';

class SessionsView extends StatelessWidget {
  const SessionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding:   EdgeInsets.all(12.0.r),
        child:
        context.read<AuthCubit>().isGuest? GoToLogin():
        Column(
          children: [
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context,index){
                    return SessionItem(
                        reciterName: "reciterName",
                        reciterImage: "reciterImage",
                        recordingDuration: Duration(minutes: 20),
                        recordingDate: DateTime.now(),
                    );
                  },
                  separatorBuilder: (context,index){
                    return Gap(12.h);
                  },
                  itemCount: 10,
              ),
            )
          ],
        ),
      )),
    );
  }
}
