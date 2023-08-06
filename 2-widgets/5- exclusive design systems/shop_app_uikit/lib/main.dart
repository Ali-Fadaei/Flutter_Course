import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shop_app_uikit/models/category.dart';
import 'package:shop_app_uikit/models/product.dart';
import 'package:shop_app_uikit/models/shop_cart.dart';
import 'package:shop_app_uikit/pages/shop_cart/shop_cart_page.dart';
import 'package:shop_app_uikit/pages/categories/categories_page.dart';
import 'package:shop_app_uikit/pages/favorites/favorites_page.dart';
import 'package:shop_app_uikit/pages/profile/profile_page.dart';
import 'package:shop_app_uikit/pages/store/store_page.dart';

import 'ui_kit/ui_kit.dart' as U;

List<Category> categories = [
  Category(
    title: 'موبایل',
    image: 'assets/imgs/categories/e-devices.png',
    color: Color.fromARGB(255, 161, 207, 178),
  ),
  Category(
    title: 'لپتاپ',
    image: 'assets/imgs/categories/laptop.png',
    color: Color.fromARGB(255, 255, 210, 161),
  ),
  Category(
    title: 'هندزفری',
    image: 'assets/imgs/categories/headphone.png',
    color: Color.fromARGB(255, 217, 197, 224),
  ),
  Category(
    title: 'ابزار شبکه',
    image: 'assets/imgs/categories/network.png',
    color: Color.fromARGB(255, 218, 241, 254),
  ),
];

List<Product> products = [
  Product(
    title: 'گلکسی S23 Ultra',
    rating: 4.8,
    price: 62000000,
    image: 'assets/imgs/products/s23_ultra.png',
    description:
        'سامسونگ Galaxy S23 Ultra به‌عنوان گل سرسبد گوشی‌های هوشمند خانواده S23 با بهره بردن از مشخصات فنی قدرتمند معرفی شد. در نگاه اول از نظر طراحی در نظر گرفته شده، سامسونگ Galaxy S23 Ultra به نسبت نسل قبلی یعنی Galaxy S22 Ultra تغییرات زیادی نداشته و تقریبا هر دو گوشی از طراحی مشابهی بهره بردند. اما باید بدانید که Galaxy S23 Ultra به نسبت نسل قبلی، قدرتمند‌تر از همیشه وارد میدان رقابت شده است. ',
    category: categories[0],
  ),
  Product(
    title: 'گلکسی Z Fold 4',
    rating: 4,
    price: 75500000,
    image: 'assets/imgs/products/Z_Fold_4.png',
    description:
        'سامسونگ Galaxy Z Fold4 یکی از گوشی‌های هوشمند انعطاف پذیر جدید این شرکت است که مشخصات فنی قدرتمند و قابلیت‌های جذابی را با خود به‌همراه دارد. باید قبول کرد که سامسونگ در عرصه گوشی‌های هوشمند انعطاف پذیر، پیشگام بوده است و توانسته عملکرد بسیار خوبی را به‌نمایش بگذارد.',
    category: categories[0],
  ),
  Product(
    title: 'آیفون 13 pro',
    rating: 4.8,
    price: 73000000,
    image: 'assets/imgs/products/iphone_13_pro.png',
    description:
        'اپل همواره توانسته است گوشی‌های هوشمند قدرتمند و بسیار باکیفیتی را روانه بازار کند و پرچمداران سری 13 هم توانستند با بهره بردن از مشخصات فنی قدرتمند، نه‌تنها به نسبت نسل قبلی یعنی خانواده iPhone12، بلکه به نسبت پرچمداران مدعی دیگر هم عملکرد بسیار درخشانی داشته باشند. iPhone 13 Pro از لحاظ مشخصات فنی در نظر گرفته شده چیزی کم از گل سرسبد این سری یعنی iPhone 13 Pro Max ندارد.',
    category: categories[0],
  ),
  Product(
    title: 'شیائومی 11 ultra',
    rating: 4.6,
    price: 40000000,
    image: 'assets/imgs/products/mi_11_ultra.png',
    description:
        'شیائومی Mi 11 Ultra یکی از قدرتمند‌ترین گوشی‌های هوشمند این شرکت است که در جایگاه یک گوشی پرچمدار، توانایی ارائه عملکرد بسیار خوبی را دارد. این گوشی به صفحه‌نمایش با ابعاد 6.81 اینچ و رزولوشن 1440×3200 پیکسل از نوع AMOLED مجهز شده است. صفحه‌نمایش بسیار با‌کیفیت که توانایی نمایش 515 پیکسل در هر اینچ و نرخ بروزرسانی 120 هرتز را دارد.',
    category: categories[0],
  ),
  Product(
    title: 'اپل Macbook Pro 2023',
    rating: 4.2,
    price: 176500000,
    image: 'assets/imgs/products/macbook_pro.png',
    description:
        'لپ تاپ 2023 MacBook Pro MPHG3 اپل معرفی شده در سال 2023، یکی از بهترین و مدرن‌ترین لپ تاپ‌های اپل است. این لپ تاپ با طراحی شیک و مقاوم و بهره‌مندی از تکنولوژی‌های پیشرفته‌ی اپل، یکی از بهترین گزینه‌ها برای کاربرانی است که به دنبال یک دستگاه قدرتمند و کارآمد هستند. این لپ تاپ با صفحه نمایش Retina با اندازه 14.2 اینچ و رزولوشن 3024x1964 پیکسل، تجربه‌ی تماشایی و بینظیری را به کاربران خود ارائه می‌دهد.',
    category: categories[1],
  ),
  Product(
    title: 'مایکروسافت Surface Laptop Studio',
    rating: 4.8,
    price: 143900000,
    image: 'assets/imgs/products/surface_studio.png',
    description:
        'لپ تاپ Surface Studio از سری لپ‌تاپ‌های شرکت مایکروسافت است. صفحه نمایش این لپ تاپ 14.4 اینچی بوده، نوع پنلی که در آن مورد استفاده قرار می‌گیرد؛ PixelSense است. رزولوشن تصویر در این صفحه نمایش 2400x 1600 پیکسل خواهد بود. نرخ تازه سازی در این صفحه نمایش تا 120 هرتز می‌رسد. بنابراین اگر به لپ تاپی احتیاج دارید که صفحه بتواند تصویر با کیفیتی به شما ارائه کند این لپ تاپ می‌تواند برای شما مناسب باشد. از طرفی این لپ تاپ از پردازنده مرکزی قدرتمندی هم بهره می‌برد که می‌تواند شما را در امور متفاوت یاری کند.',
    category: categories[1],
  ),
  Product(
    title: 'ایسوس Zenbook 14X',
    rating: 4.9,
    price: 75000000,
    image: 'assets/imgs/products/zenbook_14x.png',
    description:
        'لپ تاپ‌های سری ZenBook 14X شرکت ایسوس از جمله محصولات فوق‌العاده زیبای این شرکت هستند که می‌توانند انتخابی بسیار ایده آل برای طراحان باشند. لپ تاپ ZenBook 14X OLED UX5401ZA-L7036 هم از این دسته از محصولات است و مشخصات سخت افزاری جالب توجه‌ای دارد. این لپ تاپ به پردازنده‌ی مرکزی بسیار قدرتمند شرکت اینتل یعنی Core i7 12700H مجهز شده است. همچنین، 16 گیگابایت رم LPDDR5 در کنار یک ترابایت حافظه‌ی SSD NVMe PCIe 4.0 برای این لپ تاپ در نظر گرفته شده است. اما نمایشگر این لپ تاپ است که آن را از بسیاری از محصولات مشابه متمایز می‌کند. این لپ تاپ دارای یک نمایشگر 14 اینچی با وضوح فوق‌العاده‌ی 1800 در 2880 یا 2.8K از نوع OLED مجهز شده است.',
    category: categories[1],
  ),
  Product(
    title: 'سونی AirBuds WF-1000XM4',
    rating: 4.8,
    price: 13480000,
    image: 'assets/imgs/products/sony_airbuds.png',
    description:
        'کمپانی سونی به‌طور رسمی از ایرفون WF-1000XM4 رونمایی کرد. در این ایرفون کاملاً بی‌سیم (truly wireless)، برای نخستین بار از پردازنده‌ی جدید Integrated Processor V1 و موتور صوتی DSEE Extreme (که پیش‌تر در هدفون دور گوش WH-1000XM4 به کار رفته بود) بهره گرفته شده است. پردازنده‌ی Integrated Processor V1 موجب بهبود عملکرد نویز کنسلیشن و کاهش مصرف انرژی هدفون می‌شود. مهندسان سونی می‌گویند که این پردازنده، توانایی سیستم حذف نویز در حذف فرکانس‌های بالا را 40 درصد افزایش داده است. یک درایور داینامیک 6 میلی‌متری جدید نیز برای WF-1000XM4 طراحی شده تا کیفیت صدا و به‌خصوص عملکرد بیس بهبود یابد.',
    category: categories[2],
  ),
  Product(
    title: 'اپل AirPods Pro 2',
    rating: 4.5,
    price: 10480000,
    image: 'assets/imgs/products/apple_airpods_pro2.png',
    description:
        'نسل دوم ایرپادهای سری پرو شرکت اپل با ویژگی‌های جدید معرفی شد. این سری از هدفون‌های بی سیم شرکت اپل همواره به دلیل بهره‌مندی از خصوصیات و ویژگی‌های منحصر به فرد خود مورد توجه علاقه‌مندان قرار گرفته است و در این نسل شاهد افزوده شدن چندین قابلیت جدید به آن هستیم. هدفون بی سیم اپل مدل AirPods Pro 2nd generation در کنار کیفیت ساخت فوق‌العاده بالای خود، به بلوتوث 5.3 مجهز شده است تا شاهد سرعت بسیار بالای آن در زمینه‌ی برقراری اتصال باشیم. این هدفون بی سیم نسبت به نسل پیش خود به میزان دو برابر و تا 48,000 بار در ثانیه توانایی کاهش نویز را دارد.',
    category: categories[2],
  ),
  Product(
    title: 'هواوی FreeBuds 5i',
    rating: 4.6,
    price: 3600000,
    image: 'assets/imgs/products/huawei_freebuds_5i.png',
    description:
        'طراحی در نظر گرفته شده برای محفظه شارژر با ابعاد مناسب هیچ مشکلی در راستای جا‌به‌جایی با خود به‌همراه ندارد و البته طراحی گوشی‌های هدفون هم به نحوی است که به‌خوبی درون گوش قرار می‌گیرد و به‌راحتی برای مثال در حین راه رفتن و دویدن از گوش خارج نمی‌شود. قابلیت نویز کنسلینگ این هدفون هم سبب شده تا نویز‌ها و صداهای موجود در محیط به‌خوبی تا میزان بسیار زیادی حذف شوند و در نهایت خروجی صدا بسیار با‌کیفیتی را شاهد خواهید بود.  هر کدام از گوشی‌های هدفون با فعال بودن قابلیت نویز کنسلینگ، توانایی ارائه طول عمر مفید (زمان آماده به‌کار) 6 ساعت برای پخش موسیقی را دارد. در حالت غیر فعال بودن نویز کنسلینگ هم طول عمر مفید 7.5 ساعت را به ازای هر بار شارژ صد درصدی برای پخش موسیقی شاهد خواهید بود.',
    category: categories[2],
  ),
  Product(
    title: 'ایسوس RT-AX89X',
    rating: 4.6,
    price: 21500000,
    image: 'assets/imgs/products/asus_rt.png',
    description:
        'ایسوس یکی از موفق ترین برندهای تولید کننده تجهیزات شبکه در دنیا، محصولاتی منطبق با استاندارد WiFi 6 عرضه کرده است. برای استفاده از این راهکار جدید و سودمند، نیاز به روترهایی با استاندارد 802.11ax است که اغلب روترها و محصولات شبکه جدید ایسوس از این رابط پشتیبانی می کند و علاوه بر سرعت بالا و امنیت مضاعف، ویژگی های منحصر به فردی نظیر شبکه گیمینگ اختصاصی با استفاده از QoS Adaptive، wtfast، AiMesh و AiProtectio شبکه ای بی نقص و حرفه ای را برای استفاده همزمان دستگاه های سازگار جدید مانند کنسول های نسل نهم Sony و Microsoft به صورت پایدار در اختیار کاربران قرار داده است. یکی از محصولاتی که در این روزها، اخبار بسیاری از آن منتشر شده، نسل جدید کنسول های گیمینگ نظیر PlayStation 5 و XBOX Series X است که راهکار شبکه آن شامل WiFi 6 می‌شود.',
    category: categories[3],
  ),
  Product(
    title: 'ایسوس DSL-AX82U',
    rating: 4.7,
    price: 16780000,
    image: 'assets/imgs/products/asus_dsl.png',
    description:
        'ایسوس یکی از موفق ترین برندهای تولید کننده تجهیزات شبکه در دنیا، محصولاتی منطبق با استاندارد WiFi 6 عرضه کرده است. برای استفاده از این راهکار جدید و سودمند، نیاز به روترهایی با استاندارد 802.11ax است که اغلب روترها و محصولات شبکه جدید ایسوس از این رابط پشتیبانی می کند و علاوه بر سرعت بالا و امنیت مضاعف، ویژگی های منحصر به فردی نظیر شبکه گیمینگ اختصاصی با استفاده از QoS Adaptive، wtfast، AiMesh و AiProtectio شبکه ای بی نقص و حرفه ای را برای استفاده همزمان دستگاه های سازگار جدید مانند کنسول های نسل نهم Sony و Microsoft به صورت پایدار در اختیار کاربران قرار داده است. یکی از محصولاتی که در این روزها، اخبار بسیاری از آن منتشر شده، نسل جدید کنسول های گیمینگ نظیر PlayStation 5 و XBOX Series X است که راهکار شبکه آن شامل WiFi 6 می‌شود.',
    category: categories[3],
  ),
  Product(
    title: 'دی‌لینک 4G N300 DWR-M921',
    rating: 4.7,
    price: 3500000,
    image: 'assets/imgs/products/dlink_4g.png',
    description:
        'روتر بی سیم دی-لینک مدل 4G N300 DWR-M921 محصولی از شرکت «دی- لینک » است. این روتر شرکت دی‌-لینک دارای یک درگاه برای نصب سیم‎کارت است که می‌توانید از سیم‌کارت تمام اپراتورها استفاده کنید. در کنار شیار سیم‌کارت، چهار درگاه LAN وجود دارد که می‌توان از آن برای اتصال باسیم ابزارها به شبکه‌ی بی‌سیم استفاده کرد. همچنین این دستگاه می‎تواند از طریق اتصال WAN به اینترنت فعلی شما وصل می‌شود. این اتصال می‌تواند شامل یک اینترنت پهن‌باند باشد که به وسیله‌ آنتن‌های پوینت تو پوینت (P2P) وایرلس دریافت می‌کنید یا همان اتصال ADSL خانگی‌تان که مدت‌ها از آن استفاده کرده‌اید. برای این دستگاه چهار عدد آنتن در نظر گرفته شده است که دوتای آن‌ها برای اتصال آنتن‌های G/4G3 است و دو تای دیگر برای آنتن‌های شبکه‌ی وای‌فای هستند.',
    category: categories[3],
  ),
];

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
//
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
//
  int selectedDes = 2;

  List<Product> favorites = [];

  ShopCart shopCart = ShopCart(shopItems: []);

  void onFavoritePressed(Product product) {
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

  @override
  Widget build(BuildContext context) {
//
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown,
        },
      ),
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
        appBar: U.AppBar.primary(
          onMenuPressed: () {},
          onNotifPressed: () {},
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
        body: IndexedStack(
          index: selectedDes,
          children: [
            ProfilePage(),
            FavoritesPage(
              favorites: favorites,
              shopCart: shopCart,
              products: products,
              onFavoritePressed: onFavoritePressed,
              onAddtoShopCartPressed: onAddtoShopCartPressed,
              onRemovefromShopCartPressed: onRemovefromShopCartPressed,
            ),
            StorePage(
              products: products,
              favorites: favorites,
              shopCart: shopCart,
              onFavoritePressed: onFavoritePressed,
              onAddtoShopCartPressed: onAddtoShopCartPressed,
              onRemovefromShopCartPressed: onRemovefromShopCartPressed,
            ),
            CartPage(
              products: products,
              shopCard: shopCart,
              favorites: favorites,
              onFavoritePressed: onFavoritePressed,
              onAddtoShopCartPressed: onAddtoShopCartPressed,
              onRemovefromShopCartPressed: onRemovefromShopCartPressed,
            ),
            CategoriesPage(
              categories: categories,
            ),
          ],
        ),
      ),
    );
  }
}
