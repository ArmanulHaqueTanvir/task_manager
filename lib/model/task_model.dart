class Task {
  int? id, isCompleted, remind;
  String? title, description, startTime, selectedDate, upcomingDate;
  bool? priority;

  Task({
    this.id,
    this.title,
    this.description,
    this.startTime,
    this.isCompleted,
    this.remind,
    this.selectedDate,
    this.upcomingDate,
    this.priority,
  });

  Task.fromJSON(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    description = json["description"];
    startTime = json["startTime"];
    isCompleted = json["isCompleted"];
    remind = json["remind"];
    selectedDate = json["selectedDate"];
    upcomingDate = json["upcomingDate"];
    // priority = json[false];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['startTime'] = startTime;
    data['isCompleted'] = isCompleted;
    data['remind'] = remind;
    data['selectedDate'] = selectedDate;
    data['upcomingDate'] = upcomingDate;
    // data['priority'] = priority as bool;

    return data;
  }
}
