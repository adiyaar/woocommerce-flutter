import 'package:nyoba/constant/constants.dart';

class GeneralSettingsAPI {
  introPageData() async {
    var response = await baseAPI.getAsync(
      '$introPage',
      isCustom: true,
    );
    return response;
  }

  generalSettingsData() async {
    var response = await baseAPI.getAsync(
      '$generalSetting',
      isCustom: true,
    );
    return response;
  }
}
