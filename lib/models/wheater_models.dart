class Weather {
  String? by;
  bool? validKey;
  Results? results;
  int? executionTime;
  bool? fromCache;

  Weather(
      {this.by,
        this.validKey,
        this.results,
        this.executionTime,
        this.fromCache});

  Weather.fromJson(Map<String, dynamic> json) {
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
    if (this.results != null) {
      data['results'] = this.results!.toJson();
    }
    data['execution_time'] = this.executionTime;
    data['from_cache'] = this.fromCache;
    return data;
  }
}

class Results {
  num? temp;
  String? date;
  String? time;
  String? conditionCode;
  String? description;
  String? currently;
  String? cid;
  String? city;
  String? imgId;
  num? humidity;
  num? cloudiness;
  num? rain;
  String? windSpeedy;
  num? windDirection;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temp'] = this.temp;
    data['date'] = this.date;
    data['time'] = this.time;
    data['condition_code'] = this.conditionCode;
    data['description'] = this.description;
    data['currently'] = this.currently;
    data['cid'] = this.cid;
    data['city'] = this.city;
    data['img_id'] = this.imgId;
    data['humidity'] = this.humidity;
    data['cloudiness'] = this.cloudiness;
    data['rain'] = this.rain;
    data['wind_speedy'] = this.windSpeedy;
    data['wind_direction'] = this.windDirection;
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    data['condition_slug'] = this.conditionSlug;
    data['city_name'] = this.cityName;
    if (this.forecast != null) {
      data['forecast'] = this.forecast!.map((v) => v.toJson()).toList();
    }
    data['cref'] = this.cref;
    return data;
  }
}

class Forecast {
  String? date;
  String? weekday;
  int? max;
  int? min;
  int? cloudiness;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['weekday'] = this.weekday;
    data['max'] = this.max;
    data['min'] = this.min;
    data['cloudiness'] = this.cloudiness;
    data['rain'] = this.rain;
    data['rain_probability'] = this.rainProbability;
    data['wind_speedy'] = this.windSpeedy;
    data['description'] = this.description;
    data['condition'] = this.condition;
    return data;
  }
}
