import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';

import '../dto/user_request.dart';
import '../model/user.dart';

// V -> P(전역 프로바이더, 뷰모델) -> R
class UserRepository {
  Future<ResponseDTO> fetchJoin(JoinReqDTO requestDTO) async {
    try {
      final response = await dio.post("/join", data: requestDTO.toJson());
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      // responseDTO.data = User.fromJson(responseDTO.data);
      // final jwt = response.headers["Authorization"];
      // if (jwt != null) {
      //   responseDTO.token = jwt.first;
      // }
      return responseDTO;
    } catch (e) {
      //200이 아니면 catch로 감
      return ResponseDTO(-1, "중복되는 유저명입니다", null);
    }
  }

  Future<ResponseDTO> fetchLogin(LoginReqDTO requestDTO) async {
    try {
      final response = await dio.post("/login", data: requestDTO.toJson());
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      responseDTO.data = User.fromJson(responseDTO.data);
      final jwt = response.headers["Authorization"];

      // List<String>? = 정확한 타입
      if (jwt != null) {
        responseDTO.token = jwt.first;
      }

      return responseDTO;
    } catch (e) {
      //200이 아니면 catch로 감
      return ResponseDTO(-1, "유저네임 혹은 비번이 틀렸습니다", null);
    }
  }
}
