class WeatherModel {
  String? by;
  bool? validKey;
  Results? results;
  int? executionTime;
  bool? fromCache;

  WeatherModel(
      {this.by,
      this.validKey,
      this.results,
      this.executionTime,
      this.fromCache});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    by = json['by'];
    validKey = json['valid_key'];
    results =
        json['results'] != null ? new Results.fromJson(json['results']) : null;
    executionTime = json['execution_time'];
    fromCache = json['from_cache'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['by'] = this.by;
    data['valid_key'] = this.validKey;

    data['execution_time'] = this.executionTime;
    data['from_cache'] = this.fromCache;
    return data;
  }
}

class Results {
  int? temp;
  String? date;
  String? time;
  String? conditionCode;
  String? description;
  String? currently;
  String? cid;
  String? city;
  String? imgId;
  int? humidity;
  int? cloudiness;
  int? rain;
  String? windSpeedy;
  int? windDirection;
  String? sunrise;
  String? sunset;
  String? conditionSlug;
  String? cityName;
  List<Forecast>? forecast;
  String? cref;

  Results(
      {this.temp,
      this.date,
      this.time,
      this.conditionCode,
      this.description,
      this.currently,
      this.cid,
      this.city,
      this.imgId,
      this.humidity,
      this.cloudiness,
      this.rain,
      this.windSpeedy,
      this.windDirection,
      this.sunrise,
      this.sunset,
      this.conditionSlug,
      this.cityName,
      this.forecast,
      this.cref});

  Results.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    date = json['date'];
    time = json['time'];
    conditionCode = json['condition_code'];
    description = json['description'];
    currently = json['currently'];
    cid = json['cid'];
    city = json['city'];
    imgId = json['img_id'];
    humidity = json['humidity'];
    cloudiness = json['cloudiness'];
    rain = json['rain'];
    windSpeedy = json['wind_speedy'];
    windDirection = json['wind_direction'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    conditionSlug = json['condition_slug'];
    cityName = json['city_name'];
    if (json['forecast'] != null) {
      forecast = <Forecast>[];
      json['forecast'].forEach((v) {
        forecast!.add(new Forecast.fromJson(v));
      });
    }
    cref = json['cref'];
  }
}

class Forecast {
  String? date;
  String? weekday;
  num? max;
  num? min;
  num? cloudiness;
  double? rain;
  int? rainProbability;
  String? windSpeedy;
  String? description;
  String? condition;

  Forecast(
      {this.date,
      this.weekday,
      this.max,
      this.min,
      this.cloudiness,
      this.rain,
      this.rainProbability,
      this.windSpeedy,
      this.description,
      this.condition});

  Forecast.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    weekday = json['weekday'];
    max = json['max'];
    min = json['min'];
    cloudiness = json['cloudiness'];
    rain = json['rain'];
    rainProbability = json['rain_probability'];
    windSpeedy = json['wind_speedy'];
    description = json['description'];
    condition = json['condition'];
  }
}
