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

  //========Home==========//
  static const home = '$hostConnect/home.php';//done

  //=========Items=======//
  static const items = '$hostConnect/items/items.php';//done
  static const search = '$hostConnect/items/search.php';//done

  //=========Address=====//
  static const addressAdd = '$hostConnect/address/add.php';
  static const addressAddStore = '$hostConnect/address/add_store.php';//done
  static const addressDelete = '$hostConnect/address/delete.php';//done
  static const addressEdit = '$hostConnect/address/edit.php';//done
  static const addressView = '$hostConnect/address/view.php';//done

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




  //=========Admin App=======//

  //=========Categories=======//
  static const categoriesAdd = '$hostConnect/admin/categories/add.php';//done
  static const categoriesEdit = '$hostConnect/admin/categories/edit.php';//done
  static const categoriesDelete = '$hostConnect/admin/categories/delete.php';//done
  static const categoriesView = '$hostConnect/admin/categories/view.php';//done

  //=========Items=======//
  static const itemsAdd = '$hostConnect/admin/items/add.php';//done
  static const itemsEdit = '$hostConnect/admin/items/edit.php';//done
  static const itemsDelete = '$hostConnect/admin/items/delete.php';//done
  static const itemsView = '$hostConnect/admin/items/view.php';//done

  //=========User=======//
  static const userView = '$hostConnect/admin/users/view.php';//done
  static const userChangeType = '$hostConnect/admin/users/changeType.php';//done

  //=========Complains=======//
  // static const sendComplain = '$hostConnect/complains/sendcomplain.php';//done
  static const viewAdminComplains = '$hostConnect/admin/complains/view.php';//done
}
