class Notifications_Data{
  String imageURL;
  String name;
  String message;

  Notifications_Data({this.imageURL, this.name, this.message});

  factory Notifications_Data.fromJson(Map<String, dynamic> json) => Notifications_Data(
    message: json["message"],
    imageURL: json["imageURL"],
    name: json["name"],
  );

  Map<String, dynamic>  toJson() => {
    "message": message,
    "imageURL": imageURL,
    "name": name,
  };
}