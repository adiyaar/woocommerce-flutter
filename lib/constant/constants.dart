import 'package:nyoba/services/BaseWooAPI.dart';

String version = '1.3.2';
String packageName = 'com.revo.woocommerce';
String url = "https://demoonlineshop.revoapps.id";

// oauth_consumer_key
String consumerKey = "ck_3dd50eabf6ac18ab07078c39227d552afb3909a3";
String consumerSecret = "cs_f571992a893d1f7227a9275f4c38051047cc60ba";

String auth = '?noAuth=1';
String woAuth = '?woAuth=';
String token = '12345';

// baseAPI for WooCommerce
BaseWooAPI baseAPI = BaseWooAPI(url, consumerKey, consumerSecret);

const debugNetworkProxy = false;

/*Endpoint START*/

// Splashscreen & Intro
String introPage = 'home-api/intro-page';

// General Setting
String generalSetting = 'home-api/general-settings';

// Home
String banner = 'home-api/slider';
String category = 'home-api/categories';
String homeFlashSale = 'home-api/flash-sale';
String homeMiniBanner = 'home-api/mini-banner';
String productCategories = '$product/categories';
String extendProducts = 'home-api/extend-products';
String recentProducts = 'home-api/recent-view-products';
String popularCategories = 'home-api/popular-categories';

// Blog
String blog = 'posts';
String postComment = 'post_comment';
String listComment = 'comments';

// Auth
String loginDefault = 'generate_auth_cookie';
String signUp = 'register';
String signInOTP = 'firebase_sms_login';
String signInGoogle = 'google_login';
String signInFacebook = 'fb_connect';
String inputTokenUrl = 'home-api/input-token-firebase';
String forgotPasswordUrl = 'send-email-forgot-password';

// Product
String product = 'products';
String checkWishlistProduct = 'home-api/check-product-wistlist';
String setWishlistProduct = 'home-api/add-remove-wistlist';
String listWishlistProduct = 'home-api/list-product-wistlist';
String checkVariations = 'home-api/check-produk-variation';
String reviewProductUrl = '$product/reviews';
String getBarcodeUrl = 'get-barcode';

// Account
String userDetail = 'get_currentuserinfo';
String updateUser = 'update_user_profile';

// Order
String orderApi = '/revo-checkout/';
String listOrders = 'home-api/list-orders';

// Coupon
String coupon = 'coupons';

// Review
String historyReviewUrl = 'home-api/list-review-user';
String addReviewUrl = 'insert-review';

// Notification
String notificationUrl = 'home-api/list-notification';

// Categories
String allCategoriesUrl = 'list-categories';

/*Endpoint END*/

List<String> categoryProduct = [
  "Shirt",
  "Pants",
  "Hat",
  "T-Shirt",
  "Underware",
  "Socks",
  "Cardigan",
  "Accessories",
  "Watches",
  "Slippers"
];

List<String> categories = [
  "Computer & Laptop",
  "Handphone & Tablet",
  "Camera & Audio",
  "Fashion",
  "Automotive",
  "View More"
];
