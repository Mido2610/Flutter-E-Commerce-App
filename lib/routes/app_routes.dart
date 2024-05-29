

import 'package:get/get.dart';
import 'package:waflo_admin/features/authentication/screens/login/login.dart';
import 'package:waflo_admin/features/authentication/screens/onboarding/onboarding.dart';
import 'package:waflo_admin/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:waflo_admin/features/authentication/screens/signup/signup.dart';
import 'package:waflo_admin/features/authentication/screens/signup/verify_email.dart';
import 'package:waflo_admin/features/personalization/screens/address/address.dart';
import 'package:waflo_admin/features/personalization/screens/profile_setting/profile_setting.dart';
import 'package:waflo_admin/features/shop/screens/cart/cart_screen.dart';
import 'package:waflo_admin/features/shop/screens/checkout_screen/checkout_screen.dart';
import 'package:waflo_admin/features/shop/screens/home/home.dart';
import 'package:waflo_admin/features/shop/screens/order/order_screen.dart';
import 'package:waflo_admin/features/shop/screens/product_review/product_review.dart';
import 'package:waflo_admin/features/shop/screens/profile/profile_screen.dart';
import 'package:waflo_admin/features/shop/screens/store/store_screen.dart';
import 'package:waflo_admin/features/shop/screens/wishlist/wish_list.dart';
import 'package:waflo_admin/routes/routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: Routes.home, page: () => const HomeScreen()),
    GetPage(name: Routes.store, page: () => const CreateStoreScreen()),
    GetPage(name: Routes.favourites, page: () => const CreateWishListSCreen()),
    GetPage(name: Routes.settings, page: () => const CreateProfileScreen()),
    GetPage(name: Routes.productReviews, page: () => const ProductReviewScreen()),
    GetPage(name: Routes.order, page: () => const OrderScreen()),
    GetPage(name: Routes.checkout, page: () => const CheckOutScreen()),
    GetPage(name: Routes.cart, page: () => const CartScreen()),
    GetPage(name: Routes.userProfile, page: () => const ProfileSettingScreen()),
    GetPage(name: Routes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: Routes.signUp, page: () => const SignUpScreen()),
    GetPage(name: Routes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: Routes.signIn, page: () => const LoginScreen()),
    GetPage(name: Routes.forgotPassword, page: () => const ForgotPasswordScreen()),
    GetPage(name: Routes.onBoarding, page: () => const OnBoardingScreen()),
  ];
}