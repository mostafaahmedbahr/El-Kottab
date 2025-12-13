

import 'package:el_kottab/features/chat/presentation/views/widgets/message_input.dart';
import 'package:el_kottab/features/chat/presentation/views/widgets/message_list.dart';
import '../../../../main_imports.dart';

class  ChatView extends StatelessWidget {
  const  ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            CustomNetWorkImage(
              imageUrl: "https://i.pravatar.cc/150?img=52",
              height: 40.h,
              width: 40.w,
              raduis: 50,
            ),
            Gap(10.w),
            Text("Mostafa Bahr", style: AppStyles.black16SemiBold),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(child: MessageList()),
          MessageInput(),
        ],
      ),
    );
  }




}