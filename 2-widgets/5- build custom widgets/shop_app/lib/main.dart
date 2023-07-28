import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shop_app/models/category.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/models/shop_cart.dart';
import 'package:shop_app/pages/shop_cart/shop_cart_page.dart';
import 'package:shop_app/pages/categories/categories_page.dart';
import 'package:shop_app/pages/favorites/favorites_page.dart';
import 'package:shop_app/pages/profile/profile_page.dart';
import 'package:shop_app/pages/store/store_page.dart';
import 'ui_kit/ui_kit.dart' as U;

List<Category> categories = [
  Category(
    title: ' گوشی ',
    image: 'assets/imgs/categories/e-devices.png',
    color: Color.fromARGB(255, 161, 207, 178),
  ),
  Category(
    title: ' لپتاپ ',
    image: 'assets/imgs/categories/laptop.png',
    color: Color.fromARGB(255, 255, 210, 161),
  ),
  Category(
    title: ' هندزفری',
    image: 'assets/imgs/categories/headphone.png',
    color: Color.fromARGB(255, 217, 197, 224),
  ),
  Category(
    title: ' ابزار شبکه',
    image: 'assets/imgs/categories/network.png',
    color: Color.fromARGB(255, 218, 241, 254),
  ),
];

List<Product> products = [
  Product(
    title: ' گوشی Samsung A14',
    rating: 4.2,
    price: 5019000,
    image: 'assets/imgs/products/a14.png',
    description:
        'اگر به دنبال خرید گوشی‌ میان‌رده‌ای هستید که در کنار قیمتی مقرون به‌صرفه، عملکرد بسیار خوب و کاملا قابل قبولی در اجرای فعالیت‌های روزمره داشته باشد، قطعا می‌توانید انتخاب بسیار خوبی در بین گوشی‌های سری A شرکت سامسونگ داشته باشید. سامسونگ Galaxy A14 یکی از این گوشی‌های میان‌رده است. صفحه‌نمایش 6.6 اینچ و رزولوشن 1080×2408 پیکسل این گوشی با نمایش 400 پیکسل در هر اینچ، توانایی نمایش دقیق رنگ‌ها و کیفیت بسیار مطلوبی را در شرایط نوری متنوع دارد. در بخش سنسور‌های دوربین هم باید بگوییم که سنسور 50 مگاپیکسلی عریض این گوشی، به خوبی تا میزان بسیار زیادی توقعات شما را در عکاسی نور و روز و حتی نور شب در جایگاه یک گوشی میان‌رده بر‌آورده می‌کند. سنسور دوربین 5 مگاپیکسل فوق عریض هم برای عکاسی در طبیعت به به زاویه دید گسترده‌ای نیاز دارید بسیار مناسب است و سنسور 2 مگاپیکسل ماکرو هم برای ثبت تصاویر از فاصله نزدیک در نظر گرفته شده است. دوربین سلفی 13 مگاپیکسل هم برای عکاسی در نور روز گزینه بسیار مناسبی است. پردازنده هلیو G80 شرکت مدیاتک هم این گوشی را همراهی می‌کند و سبب شده تا در اجرای بازی‌های محبوب و نرم‌افزار‌های کاربردی، عملکرد خوبی داشته باشد. باتری 5000 میلی‌آمپر‌ساعت هم به ازای هر بار شارژ صد درصدی، طول عمر مفید (زمان آماده به‌کار) دو روز را در شرایط استفاده معمولی ارائه می‌کند. در مجموع باید بگوییم که اگر به دنبال خرید گوشی میان‌رده‌ای هستید که به صفحه‌نمایش مناسب، سنسور دوربین عریض قدرتمند، پردازنده خوب و باتری قابل قبولی بهره برده باشد، سامسونگ Galaxy A14 می‌تواند یکی از گزینه‌های بسیار خوب باشد.',
    category: categories[0],
  ),
  Product(
    title: 'گوشی Samsung Dokme',
    rating: 4.2,
    price: 910000,
    image: 'assets/imgs/products/dokme.png',
    description:
        'گوشی‌های کلاسیک سامسونگ طرفداران بسیاری در بین کاربران دارند و باید بدانید که با توجه به مشخصات فنی در نظر گرفته شده، توانایی ارائه عملکرد مناسب و قابل قبولی را در استفاده روزمره دارند. سامسونگ Sm_B315E هم یکی از این گوشی‌های کلاسیک و ساده است. در نمای رو‌به‌رویی این گوشی به صفحه‌نمایش با ابعاد 2.0 اینچ از نوع TFT با رزولوشن 128×160 پیکسل با توانایی نمایش 102 پیکسل در هر اینچ مجهز شده است. ابعاد و رزولوشن مناسب در نظر گرفته شده برای این صفحه‌نمایش سبب شده تا وضوح تصویر و خوانایی مناسب آیکون‌ها و اعلان‌ها را شاهد باشید. خبری از دوربین اصلی و دوربین سلفی برای این گوشی نیست. صفحه‌کلید در نظر گرفته شده در قسمت پایینی صفحه‌نمایش هم از دکمه‌هایی با ابعاد و متریال مناسب بهره برده و در نتیجه تجربه کاربری راحت و سریعی را برای شما به ارمغان می‌آورد. وزن بسیار سبک 75 گرمی این گوشی هم به هیچ عنوان در استفاده طولانی مدت خستگی برای دست به همراه ندارد. در نهایت هم باتری با میزان ظرفیت 800 میلی‌آمپر‌ساعت این گوشی را همراهی می‌کند که همانند اکثر گوشی‌های کلاسیک، به ازای هر بار شارژ صد درصدی، طول عمر مفید (زمان آماده به‌کار) بسیار مناسبی را ارائه می‌کند. با توجه به تست‌های انجام شده، این باتری به ازای هر بار شارژ صد درصدی توانایی ارائه طول عمر مفید 11 ساعت را برای حالت مکالمه صوتی دارد. در نهایت اگر به دنبال خرید گوشی کلاسیکی هستید که برای استفاده روزمره عملکرد مناسبی داشته باشد، سامسونگ Sm_B315E می‌تواند یکی از گزینه‌های شما برای انتخاب باشد',
    category: categories[0],
  ),
  Product(
    title: 'لپتاپ idepad',
    rating: 3.9,
    price: 35000000,
    image: 'assets/imgs/products/ideapad.png',
    description:
        ' شرکت‌های بزرگ تولیدکننده‌ی لپ‌تاپ با رقابت سختی که در طراحی سری محصولات حرفه‌ای مخصوص بازی دارند، از این فرصت برای قدرت‌نمایی استفاده می‌کنند. به همین دلیل معمولا تمام لپ‌تاپ‌های مخصوص بازی مجهز به سخت‌افزارهای به‌روز و قوی، صفحه‌نمایش باکیفیت و امکانات متعدد هستند. لپ‌تاپ‌های مخصوص بازی شرکت «لنوو» هم همین خصوصیات را داشته و ارزش خرید زیادی دارند. سری گیمینگ لنوو با سی پی یو قدرتمند نسل دهم و گرافیک قدرتمند 4 گیگابایت قابلیت اجرای سنگین‌ترین بازی‌ها و نرم‌افزارهای گرافیکی را دارد. پردازنده مرکزی 10750H Corei7 اینتل در کنار 16 گیگابایت رم از نوع DDR4 و پردازنده گرافیکی GeForce GTX 1650 Ti مجموعه سخت افزار لپ تاپ 15.6 اینچی لنوو مدل IdeaPad Gaming 3 15IMH05 - NB را تشکیل می‌دهند که باعث می‌شود این محصول برای استفاده‌های روزمره و معمولی و همچنین کاربری‌های حرفه‌ای‌تر نظیر گیمینگ گزینه‌ای مناسب و انتخابی شایسته باشد. یک ترابایت هارد دیسک به همراه 256 گیگ حافظه از نوع SSD هم کاربر را از خرید هارد اکسترنال بی‌نیاز خواهد کرد.',
    category: categories[1],
  ),
  Product(
    title: ' لپتاپ Asus VivoBook',
    rating: 4.3,
    price: 27000000,
    image: 'assets/imgs/products/vivabook.png',
    description:
        ' لپ تاپ ایسوس ROG Strix G15 G513RM-HQ116 از سری لپ تاپ‌های ایسوس است. این لپ تاپ گیمینگ وزنی برابر 2.3 کیلوگرم داشته و ابعاد آن برابر 354×259×27.2 میلی‌متر است. سازنده پردازنده این لپ تاپ AMD سری Ryzen 7 بوده و مدل آن 6800H است. برای این لپ تاپ علاوه بر پردازنده قدرتمندی که در نظر گرفته شده است؛ پردازنده گرافیکی بسیار پرقدرتی هم اختصاص داده‌اند. سازنده پردازنده این پردازنده گرافیکی انویدیا بوده و مدل آن GeForce RTX3060 GDDR6 است. با این پردازنده‌ها شما می‌‎‌توانید اغلب بازی‌ها را انجام دهید و به امور گرافیکی‌تان بپردازید. این لپ تاپ 16 مگابایت حافظه کش دارد. علاوه بر آن 16 گیگابایت رم از نوع DDR5 برای آن در نظر گرفته شده است. این لپ تاپ به عنوان حافظه داخلی 1 ترابایت حافظه از نوع SSD PCIe NVMe (درایو حالت جامد) (Solid State Drive) دارد. این لپ تاپ 15.6 اینچی بوده، نوع پنل آن IPS است.',
    category: categories[1],
  ),
  Product(
    title: 'لپتاپ Asus VivoBook',
    rating: 5,
    price: 9990009,
    image: 'assets/imgs/products/vivabook.png',
    description:
        ' لپ تاپ ایسوس ROG Strix G15 G513RM-HQ116 از سری لپ تاپ‌های ایسوس است. این لپ تاپ گیمینگ وزنی برابر 2.3 کیلوگرم داشته و ابعاد آن برابر 354×259×27.2 میلی‌متر است. سازنده پردازنده این لپ تاپ AMD سری Ryzen 7 بوده و مدل آن 6800H است. برای این لپ تاپ علاوه بر پردازنده قدرتمندی که در نظر گرفته شده است؛ پردازنده گرافیکی بسیار پرقدرتی هم اختصاص داده‌اند. سازنده پردازنده این پردازنده گرافیکی انویدیا بوده و مدل آن GeForce RTX3060 GDDR6 است. با این پردازنده‌ها شما می‌‎‌توانید اغلب بازی‌ها را انجام دهید و به امور گرافیکی‌تان بپردازید. این لپ تاپ 16 مگابایت حافظه کش دارد. علاوه بر آن 16 گیگابایت رم از نوع DDR5 برای آن در نظر گرفته شده است. این لپ تاپ به عنوان حافظه داخلی 1 ترابایت حافظه از نوع SSD PCIe NVMe (درایو حالت جامد) (Solid State Drive) دارد. این لپ تاپ 15.6 اینچی بوده، نوع پنل آن IPS است.',
    category: categories[1],
  ),
  Product(
    title: ' لپتاپ mac M1',
    rating: 5,
    price: 64000000,
    image: 'assets/imgs/products/macm1.png',
    description:
        ' MacBook Pro M2 2022 با پردازنده‌ی M2 تواناتر از لپ تاپ‌های نسل قبل خود طراحی شده و طراحی ظاهری مینیمال و جمع و جور آن همچنان می‌تواند چشم‌ها را به خود خیره کند. باتری این لپ تاپ تا 20 ساعت می‌تواند شارژدهی داشته باشد و سیستم خنک کننده‌ی توانا، صفحه نمایش رتینا و دوربین HD Face Time، میکروفن با کیفیت استودیویی از دیگر ویژگی‌های آن هستند.',
    category: categories[1],
  ),
  Product(
    title: ' هندزفری in puds',
    rating: 5,
    price: 395000,
    image: 'assets/imgs/products/inpuds.png',
    description:
        ' MacBook Pro M2 2022 با پردازنده‌ی M2 تواناتر از لپ تاپ‌های نسل قبل خود طراحی شده و طراحی ظاهری مینیمال و جمع و جور آن همچنان می‌تواند چشم‌ها را به خود خیره کند. باتری این لپ تاپ تا 20 ساعت می‌تواند شارژدهی داشته باشد و سیستم خنک کننده‌ی توانا، صفحه نمایش رتینا و دوربین HD Face Time، میکروفن با کیفیت استودیویی از دیگر ویژگی‌های آن هستند.',
    category: categories[2],
  ),
  Product(
    title: ' شارژر hdmi',
    rating: 5,
    price: 140000,
    image: 'assets/imgs/products/hdmichanger.png',
    description:
        ' گاهی اوقات شما نیاز به انتقال تصاویر در فاصله‌های طولانی دارید. اگر نمایشگر شما درگاه HDMI داشته باشد، مجبور هستید از کابل‌های HDMI استفاده کنید. با این حال کابل‌های HDMI با طول زیاد قیمت بسیار زیادی دارند. در چنین مواقعی اکستندر HDMI به کار شما می‌آید. با استفاده از این قطعه می‌توانید با کمک کابل شبکه و با هزینه کمتر تصاویر خود را در فواصل طولانی منتقل کنید. اکستندر HDMI مدل 3D طول 30 متر محصولی کیفیت است که چنین وظیفه‌ای را برای شما انجام می‌دهد. به کمک اکستندر HDMI مدل 3D طول 30 متر می‌توانید تصاویر خود را بین دو قطعه این دستگاه به کمک کابل شبکه تا سی متر انتقال دهید. اکستندر HDMI مدل 3D طول 30 متر از رزولوشن 1080 پشتیبانی می‌کند و تصویر مطلوبی در اختیار شما قرار می‌دهد. در این نوع اکستندر، بر خلاف مدل‌های دیگر برای انتقال تصویر می‌بایست از دو کابل شبکه استفاده کرد. مزیت این نوع از اکستندرها قیمت بسیار پایین‌تر آن‌ها نسبت به دیگر مدل‌‎ها می‌باشد.',
    category: categories[3],
  ),
  Product(
    title: ' گوشی iphone 13',
    rating: 5,
    price: 32000000,
    image: 'assets/imgs/products/iphone13.png',
    description:
        ' گوشی موبایل iPhone 13 CH پرچم‌دار جدید شرکت اپل است که با چند ویژگی جدید و دوربین دوگانه روانه بازار شده است. نمایشگر آیفون 13 به پنل Super Retina مجهز ‌شده است تا تصاویر بسیار مطلوبی را به کاربر عرضه کند. این نمایشگر رزولوشن بسیار بالایی دارد؛ به‌طوری‌که در اندازه­‌ی 6.1 اینچی‌اش، حدود 460 پیکسل را در هر اینچ جا داده است. امکان شارژ بی‌‌سیم باتری در این گوشی وجود دارد. تشخیص چهره با استفاده از دوربین جلو دیگر ویژگی است که در آیفون جدید اپل به کار گرفته شده است. از نظر سخت‌‌افزاری این گوشی از تراشه­‌ی جدید A15 بهره می‌برد که دارای 15 میلیارد ترانزیستور است که دارای کنترل گرمای مطلوبی بوده که تا بتواند علاوه بر کارهای معمول، از قابلیت‌های جدید واقعیت مجازی که اپل این روزها روی آن تمرکز خاصی دارد، پشتیبانی کند. به گفته خود شرکت اپل این گوشی دارای سرعتی 50 برابر نسخه 12 خود است. پردازنده دارای ماژولار جدیدی است که مصرف باتری را بسیار پایین‌تر آورده است و شما دارای حفظ باتری بالاتری هستید. اپل در این سری از گوشی‌های iPhone خود پردازنده گرافیکی‌ای را قرار داده که از سری 12 گوشی‌های خود 30 درصد سریع‌تر است و این نویدبخش آن است که شما می‌توانید بازی‌هایی را با گرافیک و MAP سنگین تر و بزرگ‌تر اجرا کنید. یکی از ویژگی‌هایی که در iPhone 13 شاهد هستیم سیستم فیلمبرداری ProRes سینمایی آن است که می تواند انقلابی در فیلمبرداری گوشی‌های موبایل به‌راه انداخته باشد. گوشی‌های نات اکتیو با قرار گرفتن سیم‌کارت‌های داخلی اکتیو می‌شوند و برخلاف مدل اکتیو پلمپ کالا باز نشده است. گوشی‌های اکتیو برند اپل هم به این شکل هستند که به دلیل محدودیت‌های برخی از محصولات اپل برای کشور ایران، در کشور‌های همسایه به‌صورت رسمی با یک بار قرار گرفتن سیم‌کارت، اکتیو شده و پلمپ می‌شوند و باید بدانید که این پروسه هیچ مشکلی در راستای گارانتی کالا به‌همراه ندارد. پارت‌نامبر‌های اروپا و ژاپن و امارات تک سیم‌کارت هستند و پارت‌نامبر‌های مربوط به امارات هم از فیس تایم پشتیبانی نمی‌کنند. پارت‌نامبر JA (ژاپن) هم حتی در حالت سایلنت صدای شاتر عکس قطع نمی‌شود.',
    category: categories[0],
  ),
  Product(
    title: 'Key Mouse',
    rating: 5,
    price: 64000000,
    image: 'assets/imgs/products/keymouse.png',
    description: ' keyboard and mouse',
    category: categories[2],
  ),
];

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
//
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
//
  int selectedDes = 2;

  List<Product> favorites = [];

  ShopCart shopCart = ShopCart(shopItems: []);

  void onFavoriatePressed(Product product) {
    setState(
      () {
        if (favorites.contains(product)) {
          favorites.remove(product);
        } else {
          favorites.add(product);
        }
      },
    );
  }

  void onAddtoShopCartPressed(Product product) {
    setState(
      () {
        // var existingShopItemIndex = shopCard.shopItems.indexWhere(
        //   (element) => element.product == product,
        // );
        // if (existingShopItemIndex == -1) {
        //   shopCard.shopItems.add(ShopItem(product: product));
        // } else {
        //   var existingShopItem = shopCard.shopItems[existingShopItemIndex];
        //   if (existingShopItem.count <= 10) existingShopItem.count++;
        // }
        try {
          var existingShopItem = shopCart.shopItems.firstWhere((element) {
            return element.product == product;
          });
          if (existingShopItem.count <= 10) existingShopItem.count++;
        } catch (_) {
          shopCart.shopItems.add(ShopItem(product: product));
        }
      },
    );
  }

  void onRemovefromShopCartPressed(Product product) {
    setState(
      () {
        // var existingShopItemIndex = shopCard.shopItems.indexWhere(
        //   (element) => element.product == product,
        // );
        // if (existingShopItemIndex != -1) {
        //   var existingShopItem = shopCard.shopItems[existingShopItemIndex];
        //   if (existingShopItem.count <= 1) {
        //     shopCard.shopItems.remove(existingShopItem);
        //   } else {
        //     existingShopItem.count--;
        //   }
        // }
        try {
          var existingShopItem = shopCart.shopItems.firstWhere((element) {
            return element.product == product;
          });
          if (existingShopItem.count <= 1) {
            shopCart.shopItems.remove(existingShopItem);
          } else {
            existingShopItem.count--;
          }
        } catch (_) {}
      },
    );
  }

  // Widget getPage(int index) {
  //   var temp = [
  //     ProfilePage(),
  //     FavoritesPage(
  //       favorites: favorites,
  //       onFavoriatePressed: onFavoriatePressed,
  //       onAddtoShopCardPressed: onAddtoShopCardPressed,
  //       products: products,
  //     ),
  //     StorePage(
  //       products: products,
  //       onFavoriatePressed: onFavoriatePressed,
  //       onAddtoShopCardPressed: onAddtoShopCardPressed,
  //     ),
  //     CartPage(
  //       shopCard: shopCard,
  //     ),
  //     CategoriesPage(),
  //   ];
  //   return temp[index];
  // }

  @override
  Widget build(BuildContext context) {
//
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {
        PointerDeviceKind.mouse,
        PointerDeviceKind.touch,
        PointerDeviceKind.stylus,
        PointerDeviceKind.unknown,
      }),
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('fa', 'IR'),
        Locale('en', 'US'),
      ],
      locale: Locale('fa', 'IR'),
      home: Scaffold(
        backgroundColor: U.Theme.background,
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 65,
          title: Center(
            child: U.Image(path: U.Images.shopLogo),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_none_rounded),
            ),
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: [],
          ),
        ),
        bottomNavigationBar: U.NavigationBar(
          selectedIndex: selectedDes,
          onDestnationChange: (index) => setState(() => selectedDes = index),
          destinations: [
            U.NavigationBarDestination(
              title: 'پروفایل',
              icon: U.Images.profileIcon,
            ),
            U.NavigationBarDestination(
              title: 'علاقه‌مندی‌ها',
              icon: U.Images.favoriteIcon,
            ),
            U.NavigationBarDestination(
              title: 'فروشگاه',
              icon: U.Images.storeIcon,
            ),
            U.NavigationBarDestination(
              title: 'سبدخرید',
              icon: U.Images.shopCartIcon,
            ),
            U.NavigationBarDestination(
              title: 'دسته‌بندی',
              icon: U.Images.categoriesIcon,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IndexedStack(
            index: selectedDes,
            children: [
              ProfilePage(),
              FavoritesPage(
                favorites: favorites,
                shopCart: shopCart,
                products: products,
                onFavoriatePressed: onFavoriatePressed,
                onAddtoShopCartPressed: onAddtoShopCartPressed,
                onRemovetoShopCartPressed: onRemovefromShopCartPressed,
              ),
              StorePage(
                products: products,
                favorites: favorites,
                shopCart: shopCart,
                onFavoriatePressed: onFavoriatePressed,
                onAddtoShopCartPressed: onAddtoShopCartPressed,
                onRemovetoShopCartPressed: onRemovefromShopCartPressed,
              ),
              CartPage(
                products: products,
                shopCard: shopCart,
                favorites: favorites,
                onFavoriatePressed: onFavoriatePressed,
                onAddtoShopCartPressed: onAddtoShopCartPressed,
                onRemovetoShopCartPressed: onRemovefromShopCartPressed,
              ),
              CategoriesPage(),
            ],
          ),
          // getPage[selectedDes],
        ),
      ),
    );
  }
}
