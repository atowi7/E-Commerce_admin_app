class AppLink {
  static const String server = 'https://atowi7.com/ECommerce_app';
  static const String test = '$server/test.php';

  //image
  static const String image = '$server/upload';
  static const String categrieImage = '$image/categorie';
  static const String productImage = '$image/item';

  //Auth
  static const String signup = '$server/admin/auth/signup.php';
  static const String sifnupVerifyCode = '$server/admin/auth/verifycode.php';
  static const String resendVerifyCode =
      '$server/admin/auth/resendverifycode.php';
  static const String login = '$server/admin/auth/login.php';
  static const String checkemail =
      '$server/admin/forget_password/checkemail.php';
  static const String verifyCode =
      '$server/admin/forget_password/verifycode.php';
  static const String resetpassword =
      '$server/admin/forget_password/resetpassword.php';

  //Home
  static const String home = '$server/admin/home.php';

  //Orders
  static const String ordersApproval = '$server/admin/orders/approval.php';
  static const String ordersPrepare = '$server/admin/orders/prepare.php';

  static const String ordersArchive = '$server/admin/orders/archive.php';
  static const String ordersViewAccepted =
      '$server/admin/orders/viewaccepted.php';
  static const String ordersViewPending =
      '$server/admin/orders/viewpending.php';
  static const String ordersDetials = '$server/admin/orders/details.php';

  //Notification
  static const String notification = '$server/admin/notification.php';

  //Categorie
  static const String categorieView = '$server/admin/categorie/view.php';
  static const String categorieAdd = '$server/admin/categorie/add.php';
  static const String categorieEdit = '$server/admin/categorie/edit.php';
  static const String categorieDelete = '$server/admin/categorie/delete.php';

  //Product
  static const String productView = '$server/admin/product/view.php';
  static const String productAdd = '$server/admin/product/add.php';
  static const String productEdit = '$server/admin/product/edit.php';
  static const String productDelete = '$server/admin/product/delete.php';
}
