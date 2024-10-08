import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': {
          '1': 'اختر اللغة',
          '2': 'عربي',
          '3': 'انجليزي',
          '4': 'تسجيل حساب',
          '5':
              'سجل حساب باستخدام اللإيميل و كلمة المرور أو استمر باستخدام مواقع التواصل الأجتماعي',
          '6': 'اسم المستخدم',
          '7': 'البريد الإلكتروني',
          '8': 'رقم الجوال',
          '9': 'كلمة المرور',
          '10': 'تسجيل الدخول',
          '11':
              ' سجل دخول باستخدام اللإيميل و كلمة المرور أو استمر باستخدام مواقع التواصل الأجتماعي',
          '12': 'نسيت كلمة المرور؟',
          '13': 'ليس لديك حساب؟ ',
          '14': 'لديك حساب؟ ',
          '15': 'التحقق من البريد الإلكتروني',
          '16': 'تحقق من بريدك الإلكتروني',
          '17': 'الرجاء إدخال رمز التحقق المرسل الى',
          '18': 'إعادة إرسال',
          '19': 'نجاح',
          '20': 'تم التحقق',
          '21': 'الانتقال إلى صفحة تسجيل الدخول',
          '22': 'التحقق من البريد الإلكتروني',
          '23': 'الرجاء إدخال بريدك الإلكتروني لتلقي رمز التحقق',
          '24': 'تحقق',
          '25': 'الرجاء إدخال رمز التحقق',
          '26': 'إعادة تعيين كلمة المرور',
          '27': 'تغيير كلمة المرور',
          '28': 'إعادة كلمة المرور',
          '29': 'حفظ',
          '30': 'تنبية',
          '31': 'هل أنت متأكد؟',
          '32': 'الصفحة الرئيسية',
          '33': 'المستخدمين',
          '34': 'الفئات',
          '35': 'المنتجات',
          '36': 'الطلبات',
          '37': 'الرسائل',
          '38': 'الإشعارات',
          '39': 'تفاصيل الطلب',
          '40': 'المنتج',
          '41': 'الكمية',
          '42': 'السعر',
          '43': 'السعر الإجمالي',
          '44': 'عنوان الشحن',
          '45': 'أرشيف الطلبات',
          '46': 'رقم الطلب',
          '47': 'سعر الطلب',
          '48': 'سعر توصيل الطلب',
          '49': 'طريقة الدفع للطلب',
          '50': 'نوع تسليم للطلب',
          '51': 'حالة للطلب',
          '52': 'السعر الإجمالي للطلب',
          '53': 'التفاصيل',
          '54': 'تتبع',
          '55': 'حذف',
          '56': 'إضافة الفئات',
          '57': 'أدخل أسم الفئة',
          '58': 'أسم الفئة',
          '59': 'أدخل اسم الفئة (عربي)',
          '60': 'اسم التصنيف (عربي)',
          '61': 'تحميل الصور',
          '62': 'إضافة',
          '63': 'تعديل الفئات',
          '64': 'إضافة منتجات',
          '65': 'أدخل اسم المنتج (انجليزي)',
          '66': 'اسم المنتج (انجليزي)',
          '67': 'أدخل اسم المنتج (عربي)',
          '68': 'اسم المنتج (عربي)',
          '69': 'أدخل وصف المنتج (انجليزي)',
          '70': 'وصف المنتج (انجليزي)',
          '71': 'أدخل وصف المنتج (عربي)',
          '72': 'وصف المنتج (عربي)',
          '73': 'أدخل عدد المنتجات',
          '74': 'عدد المنتجات',
          '75': 'أدخل السعر',
          '76': 'السعر',
          '77': 'أدخل الخصم',
          '78': 'الخصم',
          '79': 'اختر الفئة',
          '80': 'تعديل المنتجات',
          '81': 'إخفاء',
          '82': 'إظهار',
          '83': 'تم',
          '84': 'قبول',
          '85': 'من فضلك اختر صورة',
          '86': 'تم الإضافة إلى الفئات بنجاح',
          '87': 'فشل في إضافة الفئة',
          '88': 'خطأ',
          '89': 'خطأ في الخادم',
          '90': 'تم تعديل الفئة بنجاح',
          '91': 'فشل في تعديل الفئة',
          '92': 'تم حذف الفئة بنجاح',
          '93': 'فشل في حذف الفئة',
          '94': 'البريد الإلكتروني غير موجود',
          '95': 'خطأ في التحقق',
          '96': 'كلمات المرور غير متطابقة',
          '97': 'خطأ في رمز التحقق',
          '98': 'تم تسليم الطلب',
          '99': 'توصيل',
          '100': 'نفسي',
          '101': 'البطاقة',
          '102': 'نقدي',
          '103': 'بانتظار الموافقة',
          '104': 'تحضير',
          '105': 'على الطريق',
          '106': 'جاهز للاستلام عن طريق خدمة التوصيل',
          '107': 'الأرشيف',
          '108': 'تمت الموافقة على الطلب',
          '109': 'معلق',
          '110': 'مقبولة',
          '111': 'تم الإضافة إلى المنتجات بنجاح',
          '112': 'فشل في إضافة المنتج',
          '113': 'تم تعديل المنتج بنجاح',
          '114': 'فشل في تعديل المنتج',
          '115': 'تم الحذف من الإشعارات بنجاح',
          '116': 'فشل في حذف الإشعار',
          '117': 'الرسائل',
          '118': 'تم حذف المستخدم بنجاح',
          '119': 'فشل في حذف المستخدم',
          '120': 'إضافة المستخدمين',
          '121': 'أدخل أسم المستخدم',
          '122': 'أسم المستخدم',
          '123': 'تم إضافة المستخدم بنجاح',
          '124': 'فشل في إضافة المستخدم',
          '125': 'تم تعديل المستخدم بنجاح',
          '126': 'فشل في تعديل المستخدم',
          '127': 'تم حذف المنتج بنجاح',
          '128': 'فشل في حذف المنتج',
          '129': 'من فضلك اختر الفئة',
          '130': '-آو-',
          '131': 'سجل ادخول باستخدام جوجل',
          '132': 'الرجوع إلى صفحة تسجيل الدخول',
          '133': 'خطأ في البريد الإلكتروني أو كلمة المرور',
          '134': 'البريد الإلكتروني موجود مسبقا',
          '135': 'تم إرسال رمز التحقق',
          '136': 'هناك مشكلة في إرسال رمز التحقق',
          '137': 'أدخل اللون (انجليزي)',
          '138': 'اسم اللون (انجليزي)',
          '139': 'أدخل اللون (عربي)',
          '140': 'اسم اللون (عربي)',
          '141': 'اختر طريقة الدفع',
        },
        'en': {
          '1': 'Choose Language',
          '2': 'AR',
          '3': 'EN',
          '4': 'Sign Up',
          '5':
              'Sign up with your email and password or continue with social media',
          '6': 'User Name',
          '7': 'Email',
          '8': 'Phone',
          '9': 'Password',
          '10': 'Sign In',
          '11':
              'Sign in with your email and password or continue with social media',
          '12': 'Forget Password?',
          '13': 'Don\'t have an account? ',
          '14': 'Already have an account? ',
          '15': 'Email Verification',
          '16': 'Check Your Email',
          '17': 'Please Enter the verification code sent to',
          '18': 'resend',
          '19': 'Success',
          '20': 'You are verified',
          '21': 'Go to Login',
          '22': 'Check Email',
          '23': 'Please Enter your email to receive the verification code',
          '24': 'Check',
          '25': 'Please Enter the verification code',
          '26': 'Reset Password',
          '27': 'Change Password',
          '28': 'RePassword',
          '29': 'Save',
          '30': 'Warrning',
          '31': 'Are you sure?',
          '32': 'Home',
          '33': 'Users',
          '34': 'Categories',
          '35': 'Products',
          '36': 'Orders',
          '37': 'Messages',
          '38': 'Notifications',
          '39': 'Order Details',
          '40': 'Product',
          '41': 'Quantity',
          '42': 'Price',
          '43': 'Total Price',
          '44': 'Shipping Address',
          '45': 'Orders Archive',
          '46': 'Order Number',
          '47': 'Order price',
          '48': 'Order delivery price',
          '49': 'Order payment method',
          '50': 'Order delivery type',
          '51': 'Order status',
          '52': 'Order total price',
          '53': 'Details',
          '54': 'Tracking',
          '55': 'Delete',
          '56': 'Add categories',
          '57': 'Enter category name',
          '58': 'Category name',
          '59': 'Enter category name (Arabic)',
          '60': 'Category name (Arabic)',
          '61': 'Upload image',
          '62': 'ADD',
          '63': 'Edit categories',
          '64': 'Add Products',
          '65': 'Enter product name',
          '66': 'Product name',
          '67': 'Enter product name (Arabic)',
          '68': 'Product name (Arabic)',
          '69': 'Enter product description (English)',
          '70': 'Product description (English)',
          '71': 'Enter product description (Arabic)',
          '72': 'Product description (Arabic)',
          '73': 'Enter product count',
          '74': 'Product count',
          '75': 'Enter the price',
          '76': 'Price',
          '77': 'Enter discount',
          '78': 'Discount',
          '79': 'Choose category',
          '80': 'Edit Products',
          '81': 'Hidden',
          '82': 'Active',
          '83': 'Done',
          '84': 'Approval',
          '85': 'Please choose an image',
          '86': 'Category is add successfully',
          '87': 'Failed to add categorie',
          '88': 'ERROR',
          '89': 'SERVER ERROR',
          '90': 'Edit category is successful',
          '91': 'Edit category is failure',
          '92': 'Delete from Category is successful',
          '93': 'Delete from Category is failure',
          '94': 'EMAIL DOES NOT EXIST',
          '95': 'VALIDATION ERROR',
          '96': 'PASSWORDS NOT MATCH',
          '97': 'VCODE ERROR',
          '98': 'The order is delivered',
          '99': 'Delivery',
          '100': 'My self',
          '101': 'Card',
          '102': 'Cash',
          '103': 'Waiting for approval',
          '104': 'Preparing',
          '105': 'On the way',
          '106': 'Ready to pickup by delivery service',
          '107': 'Archive',
          '108': 'The order is approved',
          '109': 'Pendinging',
          '110': 'Accepted',
          '111': 'Add to product is successful',
          '112': 'Add to product is failure',
          '113': 'Edit product is successful',
          '114': 'Edit product is failure',
          '115': 'notification is deleted successfully',
          '116': 'Failed to delete notification',
          '117': 'Messages',
          '118': 'user is deleted successfully',
          '119': 'Failed to delete user',
          '120': 'Add users',
          '121': 'Enter user name',
          '122': 'User name',
          '123': 'User is add successfully',
          '124': 'Failed to add user',
          '125': 'Edit user is successful',
          '126': 'Edit user is failure',
          '127': 'product is deleted successfully',
          '128': 'Failed to delete product',
          '129': 'Please choose a category',
          '130': '-OR-',
          '131': 'Sign in with Google',
          '132': 'Back to login',
          '133': 'There is a problem with your email or password',
          '134': 'email exists',
          '135': 'VCODE is send',
          '136': 'There was a problem sending the verification code',
          '137': 'Enter Color (English)',
          '138': 'Color (English)',
          '139': 'Enter Color (Arabic)',
          '140': 'Color (Arabic)',
          '141': 'Choose payment method',
        },
      };
}
