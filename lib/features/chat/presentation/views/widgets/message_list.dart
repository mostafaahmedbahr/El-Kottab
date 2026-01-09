import 'package:el_kottab/core/shared_widgets/empty_widget.dart';
import 'package:el_kottab/features/chat/presentation/view_model/chat_cubit.dart';
import 'package:el_kottab/features/chat/presentation/view_model/chat_states.dart';
import 'package:el_kottab/features/chat/presentation/views/widgets/right_message_by_me.dart';
import '../../../../../main_imports.dart';
import 'left_message_from_teacher.dart';

class MessageList extends StatelessWidget {
  const MessageList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatStates>(
      builder: (context, state) {
        var chatCubit = context.read<ChatCubit>();
        return state is GetAllChatMessagesLoadingState &&
                chatCubit.allMessagesModel == null
            ? CustomLoading()
            : state is GetAllChatMessagesErrorState
            ? Center(child: Text(state.error.toString(),style: AppStyles.black16SemiBold,))
            : state is GetAllChatMessagesSuccessState &&
                  chatCubit.allMessagesModel!.data!.isEmpty
            ? EmptyWidget(msg: LangKeys.noMessagesFound)
            : Padding(
              padding:   EdgeInsets.all(12.0.r),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return chatCubit.allMessagesModel!.data![index].senderRole ==
                            "user"
                        ? RightMessageByMe(  date: chatCubit.allMessagesModel!.data![index].createdAt.toString(),
                        message: chatCubit.allMessagesModel!.data![index].message.toString())
                        : LeftMessageFromTeacher(  date: chatCubit.allMessagesModel!.data![index].createdAt.toString(), message: chatCubit.allMessagesModel!.data![index].message.toString());
                  },
                  separatorBuilder: (context, index) {
                    return Gap(12.h);
                  },
                  itemCount: chatCubit.allMessagesModel!.data!.length,
                ),
            );

      },
    );
  }
}
