import 'package:nyoba/constant/constants.dart';
import 'package:nyoba/services/Session.dart';

class UserAPI {
  fetchDetail() async {
    Map data = {"cookie": Session.data.get('cookie')};
    var response = await baseAPI.postAsync('$userDetail', data, isCustom: true);
    return response;
  }

  updateUserInfo(
      {String fisrtName,
      String lastName,
      String password}) async {
    Map data = {
      "cookie": Session.data.get('cookie'),
      "first_name": fisrtName,
      "last_name": lastName,
      if (password.isNotEmpty) "user_pass": password
    };
    var response = await baseAPI.postAsync('$updateUser', data, isCustom: true);
    return response;
  }
}
