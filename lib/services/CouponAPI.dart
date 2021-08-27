import 'package:nyoba/constant/constants.dart';

class CouponAPI {
  fetchListCoupon(page) async {
    var response =
        await baseAPI.getAsync('$coupon?page=$page&per_page=50');
    return response;
  }

  searchCoupon(code) async {
    var response =
    await baseAPI.getAsync('$coupon?code=$code&page=1&per_page=1');
    return response;
  }
}
