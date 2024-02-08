class HealthData {
  int? heartRate;
  DailyGoals? dailyGoals;
  int? steps;
  int? lastSleep;
  Type? type;

  HealthData(
      {this.heartRate, this.dailyGoals, this.steps, this.lastSleep, this.type});

  HealthData.fromJson(Map<String, dynamic> json) {
    heartRate = json['heartRate'];
    dailyGoals = json['dailyGoals'] != null
        ? DailyGoals.fromJson(json['dailyGoals'])
        : null;
    steps = json['steps'];
    lastSleep = json['lastSleep'];
    type = json['type'] != null ? Type.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['heartRate'] = heartRate;
    if (dailyGoals != null) {
      data['dailyGoals'] = dailyGoals!.toJson();
    }
    data['steps'] = steps;
    data['lastSleep'] = lastSleep;
    if (type != null) {
      data['type'] = type!.toJson();
    }
    return data;
  }
}

class DailyGoals {
  Friday? friday;
  Saturday? saturday;
  Friday? sunday;
  Saturday? monday;
  Saturday? tuesday;
  Friday? wednesday;
  Friday? thursday;

  DailyGoals(
      {this.friday,
      this.saturday,
      this.sunday,
      this.monday,
      this.tuesday,
      this.wednesday,
      this.thursday});

  DailyGoals.fromJson(Map<String, dynamic> json) {
    friday = json['friday'] != null ? Friday.fromJson(json['friday']) : null;
    saturday =
        json['saturday'] != null ? Saturday.fromJson(json['saturday']) : null;
    sunday = json['sunday'] != null ? Friday.fromJson(json['sunday']) : null;
    monday = json['monday'] != null ? Saturday.fromJson(json['monday']) : null;
    tuesday =
        json['tuesday'] != null ? Saturday.fromJson(json['tuesday']) : null;
    wednesday =
        json['wednesday'] != null ? Friday.fromJson(json['wednesday']) : null;
    thursday =
        json['thursday'] != null ? Friday.fromJson(json['thursday']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (friday != null) {
      data['friday'] = friday!.toJson();
    }
    if (saturday != null) {
      data['saturday'] = saturday!.toJson();
    }
    if (sunday != null) {
      data['sunday'] = sunday!.toJson();
    }
    if (monday != null) {
      data['monday'] = monday!.toJson();
    }
    if (tuesday != null) {
      data['tuesday'] = tuesday!.toJson();
    }
    if (wednesday != null) {
      data['wednesday'] = wednesday!.toJson();
    }
    if (thursday != null) {
      data['thursday'] = thursday!.toJson();
    }
    return data;
  }
}

class Friday {
  bool? goal;
  double? percent;

  Friday({this.goal, this.percent});

  Friday.fromJson(Map<String, dynamic> json) {
    goal = json['goal'];
    percent = json['percent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['goal'] = goal;
    data['percent'] = percent;
    return data;
  }
}

class Saturday {
  bool? goal;
  double? percent;

  Saturday({this.goal, this.percent});

  Saturday.fromJson(Map<String, dynamic> json) {
    goal = json['goal'];
    percent = json['percent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['goal'] = goal;
    data['percent'] = percent;
    return data;
  }
}

class Type {
  int? awake;
  int? rem;
  int? lightSleep;
  int? deepSleep;

  Type({this.awake, this.rem, this.lightSleep, this.deepSleep});

  Type.fromJson(Map<String, dynamic> json) {
    awake = json['awake'];
    rem = json['rem'];
    lightSleep = json['lightSleep'];
    deepSleep = json['deepSleep'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['awake'] = awake;
    data['rem'] = rem;
    data['lightSleep'] = lightSleep;
    data['deepSleep'] = deepSleep;
    return data;
  }
}
