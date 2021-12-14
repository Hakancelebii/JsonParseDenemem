class Yonetmenler{
  String yonetmen_id;
  String yonetmen_adi;

  Yonetmenler(this.yonetmen_id, this.yonetmen_adi);

  factory Yonetmenler.fromJson(Map<String,dynamic> json){
    return Yonetmenler(json["yonetmen_id"] as String, json["yonetmen_adi"] as String);
  }
}