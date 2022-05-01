class Character {
  int? charId;
  String? name;
  String? birthday;
  List<String>? occupation;
  String? img;
  String? status;
  String? nickname;
  List<int>? appearance;
  String? portrayed;
  String? category;
  List<int>? betterCallSaulAppearance;

  Character({
    this.charId,
    this.name,
    this.birthday,
    this.occupation,
    this.img,
    this.status,
    this.nickname,
    this.appearance,
    this.portrayed,
    this.category,
    this.betterCallSaulAppearance,
  });

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        charId: json['char_id'] as int?,
        name: json['name'] as String?,
        birthday: json['birthday'] as String?,
        occupation: json['occupation'] as List<String>?,
        img: json['img'] as String?,
        status: json['status'] as String?,
        nickname: json['nickname'] as String?,
        appearance: json['appearance'] as List<int>?,
        portrayed: json['portrayed'] as String?,
        category: json['category'] as String?,
        betterCallSaulAppearance:
            json['better_call_saul_appearance'] as List<int>?,
      );

  Map<String, dynamic> toJson() => {
        'char_id': charId,
        'name': name,
        'birthday': birthday,
        'occupation': occupation,
        'img': img,
        'status': status,
        'nickname': nickname,
        'appearance': appearance,
        'portrayed': portrayed,
        'category': category,
        'better_call_saul_appearance': betterCallSaulAppearance,
      };
}
