class API {
  //Main connection
  static const hostConnect = 'https://www.koshtna.com/API_koshtna';

  //=========Images=======//

  static const images = 'https://www.koshtna.com/API_koshtna/upload';//done
  static const categoriesImages = '$images/categories';//done
  static const itemsImages = '$images/items';//done

  //========Authentication==========//

  //signup-user
  static const signUp = '$hostConnect/auth/signup.php'; //done
  //login-user
  static const login = '$hostConnect/auth/login.php'; //done
  //verifyCode
  static const verifyCode = '$hostConnect/auth/verifycode.php';//done
  //resetPassword
  static const resetPass = '$hostConnect/auth/resetpass.php';//done
  //send new code to go to change password
  static const changeVerifyCode = '$hostConnect/auth/changeverifycode.php';//done
  //check if email exists
  static const validateEmail = '$hostConnect/auth/validate_email.php';//done
  //check if store exists
  static const validateStoreName = '$hostConnect/auth/validate_storename.php';//done
  // updates user info
  static const updateInfo = '$hostConnect/auth/update_info.php';//done
  //delete user
  static const deleteUser = '$hostConnect/auth/delete.php';//done

  //========Home==========//
  static const home = '$hostConnect/home.php';//done

  //=========Items=======//
  static const items = '$hostConnect/items/items.php';//done
  static const search = '$hostConnect/items/search.php';//done

  //=========favorites=====//
  static const addFavorite = '$hostConnect/favorite/add.php';//done
  static const removeFavorite = '$hostConnect/favorite/remove.php';//done
  static const deleteFavorite = '$hostConnect/favorite/delete.php';//done
  static const viewFavorite = '$hostConnect/favorite/view.php';//done

  //=========Cart=====//
  static const addItemToCart = '$hostConnect/cart/add.php';//done
  static const deleteFromCart = '$hostConnect/cart/delete.php';//done
  static const deleteAllFromCart = '$hostConnect/cart/delete_all_cart.php';//done
  static const getCountItems = '$hostConnect/cart/getcountitems.php';//done
  static const cartView = '$hostConnect/cart/view.php'; //done

  //=========Address=====//
  static const addressAdd = '$hostConnect/address/add.php';
  static const addressAddStore = '$hostConnect/address/add_store.php';//done
  static const addressDelete = '$hostConnect/address/delete.php';//done
  static const addressEdit = '$hostConnect/address/edit.php';//done
  static const addressView = '$hostConnect/address/view.php';//done

  //=========Checkout=====//
  static const checkout = '$hostConnect/orders/checkout.php';//done

  //=========Orders=======//
  //view all orders
  static const pendingOrders = '$hostConnect/orders/pending.php';//done
  static const orderDetails = '$hostConnect/orders/details.php';//done

  //=========Complains=======//
  static const sendComplain = '$hostConnect/complains/sendcomplain.php';//done
  //view all Complains
  static const viewComplains = '$hostConnect/complains/view.php';//done

  //=========Choose Branch=======//
  static const chooseBranch = '$hostConnect/choosebranch.php';//done

  //=========Fund Data=======//
  static const fundData = '$hostConnect/auth/getDataFund.php';//done
}
