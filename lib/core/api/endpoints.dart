class Category {
  static const String coffee = '/coffee/';
}

class Slugs {
  static const String hot = 'hot';
  static const String iced = 'iced';
}

class Endpoints {
  static const String hotCofee = "${Category.coffee}${Slugs.hot}";
  static const String icedCofee = "${Category.coffee}${Slugs.iced}";
}
