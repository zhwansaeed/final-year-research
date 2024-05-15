class EventModel {
  final String image, title, description;
  final int id;

  EventModel(
      {required this.image,
      required this.title,
      required this.description,
      required this.id});
}

List<EventModel> events = [
  EventModel(
      id: 1,
      title: "نۆرس ئایلەند",
      description:
          "زۆر کات گەشتیارە بییانییەکان ئێمە هڵدەبژێرن ئەوان چێژ لە سروشتی  جوانی كودستان دەبینن، تۆی گەشتیار دەتوانیت دەتوانیت چالاكییە جۆراوجۆرەكانی ئێمە تاقی بكەیتەوە ئێمە لە شارباژێرین ـپرۆژەی نۆرس ئایلەند  لە كونەماسی.....",
      image: "assets/events/north-island.png"),
  EventModel(
      id: 2,
      title: "نەورۆز",
  
      description:
          " نەورۆز 🔥 ئاهەنگێكی كوردەوارییە ،هاتنی بەهار وساڵی نوێ یە لە فەرهەنگی كوردیدا .لە ئێوارەی ۲٠ی ئاداردا بە داگیرساندنی ئاگری نەورۆز و لەبەركردنی جل و بەرگی نەتەوەی كوردی ئاهەنگ دەگێڕن پێشوازی لە یەكەم ڕۆژی ساڵی كوردی دەكرێت لە هەموو ناوچەكانی كوردستان،لە شاری سلێمانی وەك هەموو شارەكانی دیكە ئاهەنگ و چالاكی جۆراوجۆر ئەنجام دەدرێت ،لە شەقامی سالم و گردی مامەیارە گەورەترین مەشخەڵی نەورۆز دادەگیرسێت",
          
      image: "assets/events/nawroz.png"),
  EventModel(
      id: 3,
      title: "باڵۆن",
      description:
          "لەگەڵ ئێمە بفڕە🪂  بۆ  یەکەم جار لە كوردستان  خۆشترین سەركێشی بە🪂پاراسایلینگ🪂 لە دیمەنە جوانەكەی دەریاچەی دوكان تاقی بكەرەوە ناونیشان:هاوینەهەواری ئاشوور،دەریاچەی دوكان",
      image: "assets/events/ashur.png"),
  EventModel(
      id: 4,
      title: "ئەسپ سواری",
      description:
          "چێژ ببینە لە ئەسپ سواری و سەرکەشی بكە لەگەڵ سروشتە جوانەكەی سلێمانی تۆی گەشتیار دەتوانیت سەردانی یانەكەمان بكەیت و ئەسپ سواری ئەنجام بدەیت 🐎یانەی ئەسپ سواری ئارش🐎 سلێمانی ـ  ڕێگای سەرەکی قەرەداغ",
      image: "assets/events/arsh-horse-sport.png"),
  EventModel(
      id: 5,
      title: "جێتسكی",
      description:
          "تۆی گەشتیار ئەگەر ئارەزووی سەركێشی راستەقینەدەكەیت،بێ دوودڵی 🏄🏻جێتسكی  تاقی بكەرەوە لەناو جوانترین دەریاچەی سلێمانی خۆشترین یادگاری گەشتەكەت تۆمار بكە ناونیشان :هاوینەهەواری ئاشور،دەریاچەی دوكان",
      image: "assets/events/jetski-adventure.png"),
  EventModel(
      id: 6,
      title: "بەلەمی كایاك",
      description:
          "چێژ لە جوانی دەریاچەی دوكان ببینە 🌊 ،تۆی گەشتیار ئێستا دەتوانیت سەردانمان بكەیت و ئەزموونی بەلەمی 🚣🏻كایاك 🚣🏻‍♂️لە دەریاچەی دوكان تاقی بكەیتەوە ناونیشان :هاوینەهەواری ئاشور،دەریاچەی دوكان",
      image: "assets/events/kayak-event.png")
];
