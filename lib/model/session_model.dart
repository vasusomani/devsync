class SessionModel {
  String? sessionid;
  String? username;
  String? id;
  String? expiresIn;
  String? plan;

  SessionModel({
    this.sessionid,
    this.username,
    this.id,
    this.expiresIn,
    this.plan,
  });

  SessionModel.fromJson(Map<String, dynamic> json) {
    sessionid = json['sessionId'].toString();
    username = json['userData']['username'].toString();
    id = json['userData']['_id'].toString();
    expiresIn = json['userData']['expiresIn'].toString();
    plan = json['userData']['plan'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sessionId'] = sessionid;
    data['userData'] = {
      'username': username,
      '_id': id,
      'expiresIn': expiresIn,
      'plan': plan,
    };
    return data;
  }
}
