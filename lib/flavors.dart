import 'package:sole/constants/app_constants.dart';

enum Flavor {
  dev,
  staging,
  production,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Sole-dev';
      case Flavor.staging:
        return 'Sole-staging';
      case Flavor.production:
        return 'Sole';
      default:
        return 'title';
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.dev:
        return Constants.devUrl;
      case Flavor.staging:
        return Constants.stagingUrl;
      case Flavor.production:
        return Constants.productionUrl;
      default:
        return 'baseUrl';
    }
  }

}
