import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/_core/utils/validator_util.dart';
import 'package:flutter_blog/data/dto/user_request.dart';
import 'package:flutter_blog/ui/widgets/custom_auth_text_form_field.dart';
import 'package:flutter_blog/ui/widgets/custom_elavated_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Ref를 사용하려면 StatelessWidget에서 ConsumerWidget으로 변경하여야 한다.
class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  final username = TextEditingController();

  final password = TextEditingController();

  ValueNotifier<String> gender = ValueNotifier("여");

  void submit(WidgetRef ref) {
    if (formKey.currentState!.validate()) {
      print(username.text);
      print(password.text);
      print(gender);

      LoginReqDTO loginreqDTO = LoginReqDTO(
        username: username.text,
        password: password.text,
      );
      // UI에서 비즈니스 로직 처리 -> 프로바이더에 위임(뷰모델1:1, 프로바이더 - 전역적)
      // Navigator.popAndPushNamed(context, Move.postListPage);}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomAuthTextFormField(
            text: "Username",
            obscureText: false,
            funValidator: validateUsername(),
            controller: username,
          ),
          const SizedBox(height: mediumGap),
          CustomAuthTextFormField(
            text: "Password",
            obscureText: true,
            funValidator: validatePassword(),
            controller: password,
          ),
          const SizedBox(height: largeGap),
        ],
      ),
    );
  }
}
