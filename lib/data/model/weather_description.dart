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
        return "clear sky";
      case WeatherDescription.mainlyClear:
        return "mainly clear sky";
      case WeatherDescription.partlyCloudy:
        return "partly cloudy";
      case WeatherDescription.overcast:
        return "cloudy";
      case WeatherDescription.fog:
        return "foggy";
      case WeatherDescription.depositingRimeFog:
        return "rime fog";
      case WeatherDescription.lightDrizzle:
        return "light drizzle";
      case WeatherDescription.moderateDrizzle:
        return "moderate drizzle";
      case WeatherDescription.denseDrizzle:
        return "dense drizzle";
      case WeatherDescription.lightFreezingRain:
        return "light freezing drizzle";
      case WeatherDescription.denseFreezingDrizzle:
        return "dense freezing drizzle";
      case WeatherDescription.slightRain:
        return "slight rain";
      case WeatherDescription.moderateRain:
        return "moderate rain";
      case WeatherDescription.heavyRain:
        return "heavy rain";
      case WeatherDescription.lightFreezingRain:
        return "light freezing rain";
      case WeatherDescription.heavyFreezingRain:
        return "heavy freezing rain";
      case WeatherDescription.slightSnowFall:
        return "slight snowfall";
      case WeatherDescription.moderateSnowFall:
        return "moderate snowfall";
      case WeatherDescription.heavySnowFall:
        return "heavy snowfall";
      case WeatherDescription.snowGrains:
        return "snow grains";
      case WeatherDescription.slightRainShowers:
        return "slight rain showers";
      case WeatherDescription.moderateRainShowers:
        return "moderate rain showers";
      case WeatherDescription.violentRainShowers:
        return "violent rain showers";
      case WeatherDescription.slightSnowShowers:
        return "slight snow showers";
      case WeatherDescription.heavySnowShowers:
        return "heavy snow showers";
      case WeatherDescription.slightThunderstorm:
        return "slight thunderstorm";
      case WeatherDescription.slightHailThunderstorm:
        return "hail thunderstorm";
      case WeatherDescription.heavyHailThunderstorm:
        return "heavy hail thunderstorm";
      default:
        return "clear sky";
    }
  }
}