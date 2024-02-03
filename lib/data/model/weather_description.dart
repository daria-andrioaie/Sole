import 'package:sole/resources/image_assets_path.dart';

enum WeatherDescription {
  clearSky,
  mainlyClear, partlyCloudy, overcast,
  fog, depositingRimeFog,
  lightDrizzle, moderateDrizzle, denseDrizzle,
  lightFreezingDrizzle, denseFreezingDrizzle,
  slightRain, moderateRain, heavyRain,
  lightFreezingRain, heavyFreezingRain,
  slightSnowFall, moderateSnowFall, heavySnowFall,
  snowGrains,
  slightRainShowers, moderateRainShowers, violentRainShowers,
  slightSnowShowers, heavySnowShowers,
  slightThunderstorm, moderateThunderstorm,
  slightHailThunderstorm, heavyHailThunderstorm;

  static WeatherDescription fromIntCode(int code) {
    switch (code) {
      case 0:
        return WeatherDescription.clearSky;
      case 1:
        return WeatherDescription.mainlyClear;
      case 2:
        return WeatherDescription.partlyCloudy;
      case 3:
        return WeatherDescription.overcast;
      case 45:
        return WeatherDescription.fog;
      case 48:
        return WeatherDescription.depositingRimeFog;
      case 52:
        return WeatherDescription.lightDrizzle;
      case 53:
        return WeatherDescription.moderateDrizzle;
      case 55:
        return WeatherDescription.denseDrizzle;
      case 56:
        return WeatherDescription.lightFreezingDrizzle;
      case 57:
        return WeatherDescription.denseFreezingDrizzle;
      case 61:
        return WeatherDescription.slightRain;
      case 63:
        return WeatherDescription.moderateRain;
      case 65:
        return WeatherDescription.heavyRain;
      case 66:
        return WeatherDescription.lightFreezingRain;
      case 67:
        return WeatherDescription.heavyFreezingRain;
      case 71:
        return WeatherDescription.slightSnowFall;
      case 73:
        return WeatherDescription.moderateSnowFall;
      case 75:
        return WeatherDescription.heavySnowFall;
      case 77:
        return WeatherDescription.snowGrains;
      case 80:
        return WeatherDescription.slightRainShowers;
      case 81:
        return WeatherDescription.moderateRainShowers;
      case 82:
        return WeatherDescription.violentRainShowers;
      case 85:
        return WeatherDescription.slightSnowShowers;
      case 86:
        return WeatherDescription.heavySnowShowers;
      case 95:
        return WeatherDescription.slightThunderstorm;
      case 96:
        return WeatherDescription.slightHailThunderstorm;
      case 99:
        return WeatherDescription.heavyHailThunderstorm;
      default:
        return WeatherDescription.clearSky;
    }
  }

  @override
  String toString() {
    switch (this) {
      case WeatherDescription.clearSky:
        return "Clear Sky";
      case WeatherDescription.mainlyClear:
        return "Mainly Clear Sky";
      case WeatherDescription.partlyCloudy:
        return "Partly Cloudy";
      case WeatherDescription.overcast:
        return "Cloudy";
      case WeatherDescription.fog:
        return "Foggy";
      case WeatherDescription.depositingRimeFog:
        return "Rime Fog";
      case WeatherDescription.lightDrizzle:
        return "Light Drizzle";
      case WeatherDescription.moderateDrizzle:
        return "Moderate Drizzle";
      case WeatherDescription.denseDrizzle:
        return "Dense Drizzle";
      case WeatherDescription.lightFreezingRain:
        return "Light Freezing Drizzle";
      case WeatherDescription.denseFreezingDrizzle:
        return "Dense Freezing Drizzle";
      case WeatherDescription.slightRain:
        return "Slight Rain";
      case WeatherDescription.moderateRain:
        return "Moderate Rain";
      case WeatherDescription.heavyRain:
        return "Heavy Rain";
      case WeatherDescription.lightFreezingRain:
        return "Light Freezing Rain";
      case WeatherDescription.heavyFreezingRain:
        return "Heavy Freezing Rain";
      case WeatherDescription.slightSnowFall:
        return "Slight Snowfall";
      case WeatherDescription.moderateSnowFall:
        return "Moderate Snowfall";
      case WeatherDescription.heavySnowFall:
        return "Heavy Snowfall";
      case WeatherDescription.snowGrains:
        return "Snow Grains";
      case WeatherDescription.slightRainShowers:
        return "Slight Rain Showers";
      case WeatherDescription.moderateRainShowers:
        return "Moderate Rain Showers";
      case WeatherDescription.violentRainShowers:
        return "Violent Rain Showers";
      case WeatherDescription.slightSnowShowers:
        return "Slight Snow Showers";
      case WeatherDescription.heavySnowShowers:
        return "Heavy Snow Showers";
      case WeatherDescription.slightThunderstorm:
        return "Slight Thunderstorm";
      case WeatherDescription.slightHailThunderstorm:
        return "Hail Thunderstorm";
      case WeatherDescription.heavyHailThunderstorm:
        return "Heavy Hail Thunderstorm";
      default:
        return "Clear Sky";
    }
  }

  String imageAssetPath() {
    switch (this) {
      case WeatherDescription.clearSky:
        return ImageAssetsPath.burningSun;
      case WeatherDescription.mainlyClear:
        return ImageAssetsPath.burningSun;
      case WeatherDescription.partlyCloudy:
        return ImageAssetsPath.rainyCloud;
      case WeatherDescription.overcast:
        return ImageAssetsPath.rainyCloud2;
      case WeatherDescription.fog:
        return ImageAssetsPath.fog;
      case WeatherDescription.depositingRimeFog:
        return ImageAssetsPath.fog;
      case WeatherDescription.lightDrizzle:
      case WeatherDescription.moderateDrizzle:
      case WeatherDescription.denseDrizzle:
      case WeatherDescription.lightFreezingRain:
      case WeatherDescription.denseFreezingDrizzle:
      case WeatherDescription.slightRain:
      case WeatherDescription.moderateRain:
      case WeatherDescription.heavyRain:
      case WeatherDescription.heavyFreezingRain:
      case WeatherDescription.slightRainShowers:
      case WeatherDescription.moderateRainShowers:
      case WeatherDescription.violentRainShowers:
        return ImageAssetsPath.waterdrops;
      case WeatherDescription.slightSnowFall:
      case WeatherDescription.moderateSnowFall:
      case WeatherDescription.heavySnowFall:
      return ImageAssetsPath.snowflake;
      case WeatherDescription.snowGrains:
      case WeatherDescription.slightSnowShowers:
      case WeatherDescription.heavySnowShowers:
        return ImageAssetsPath.snowflakes;
      case WeatherDescription.slightThunderstorm:
      case WeatherDescription.slightHailThunderstorm:
      case WeatherDescription.heavyHailThunderstorm:
        return ImageAssetsPath.lightening;
      default:
        return ImageAssetsPath.burningSun;
    }
  }
}