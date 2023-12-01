const String splash = '/splash.dart';
const String onBoarding = '/onBoading.dart';
const String signUp = '/sign_up.dart';
const String marketLogin = '/market_admin_login.dart';
const String adminLogin = '/admin_login.dart';
const String login = '/sign_in_body.dart';
const String branch = '/branch.dart';
const String home = '/home.dart';
const String menu = '/menu.dart';
const String categories = '/categories.dart';
const String previousOrder = '/previous_orders.dart';
const String favoriteScreen = '/favorite.dart';
const String prevOrderDetails = '/previous_order_details.dart';
const String subCategory = '/sub_category.dart';
const String otp = '/otp.dart';
const String problems = '/problems.dart';
const String profile = '/profil.dart';
const String personalInfo = '/personal_into.dart';
const String forgetPass = '/forget_pass.dart';
const String changePass = '/change_pass.dart';
const String cardOrders = '/card_order.dart';
const String confirmOrders = '/confirm_order.dart';
const String lastPageOrders = '/last_page.dart';

//? Main connection
const hostConnect = 'https://www.koshtna.com/API_koshtna';
//? signup-user
const signUpLink = '$hostConnect/auth/signup.php'; //^done
const loginLink = '$hostConnect/auth/login.php'; //^done
//?verifyCode
const verifyCode = '$hostConnect/auth/verifycode.php'; //^done
//?resetPassword
const resetPass = '$hostConnect/auth/resetpass.php';
//?send new code to go to change password
const changeVerifyCode = '$hostConnect/auth/changeverifycode.php';
//?check if email exists
const validateEmail = '$hostConnect/auth/validate_email.php'; //^done
//!more home
const categoriesLink =
    "https://www.koshtna.com/API_koshtna/categories/view.php"; //^done
//? Images
const images = 'https://www.koshtna.com/API_koshtna/upload';
const categoriesImages = '$images/categories'; //^done
const itemsImages = '$images/items'; //& all times

//?home
const homeLink = '$hostConnect/home.php'; //& offers

//? items and search
const items = '$hostConnect/items/items.php'; //& sub categories
const search = '$hostConnect/items/search.php';

//?favorite
const addFavorite = '$hostConnect/favorite/add.php';
const removeFavorite = '$hostConnect/favorite/remove.php';
const viewFavorite = '$hostConnect/favorite/view.php';
const deleteFavorite = '$hostConnect/favorite/delete.php';

//? card
const addItemToCart = '$hostConnect/cart/add.php';
const deleteFromCart = '$hostConnect/cart/delete.php';
const getCountItems =
    '$hostConnect/cart/getcountitems.php'; //& total price and count
const cartView = '$hostConnect/cart/view.php';

//=========Address=====//
const addressAdd = '$hostConnect/address/add.php';
const addressDelete = '$hostConnect/address/delete.php';
const addressEdit = '$hostConnect/address/edit.php';
const addressView = '$hostConnect/address/view.php';

//=========Checkout=====//
const checkout = '$hostConnect/orders/checkout.php';

//=========Orders=======//
//view all orders
const pendingOrders = '$hostConnect/orders/pending.php';

//=========Complains=======//
const sendComplain = '$hostConnect/complains/sendcomplain.php';
//view all Complains
const viewComplains = '$hostConnect/complains/view.php';

//=========Choose Branch=======//
const chooseBranchLink = '$hostConnect/choosebranch.php';
