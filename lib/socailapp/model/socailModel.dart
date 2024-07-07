class SocialModel{
  String ?name;
  String ?email;
  String ?phone;
  String ?uid;
  String ?image;
  String ?cover;
  String ?bio;
  SocialModel({
    this.email,
    this.phone,
    this.uid,
    this.name,
    this.cover,
    this.image,
    this.bio

});
  SocialModel.fromJson(Map<String,dynamic> json){
    name=json['name'];
    email=json['email'];
    phone=json['phone'];
    uid=json['uid'];
    cover=json['cover'];
    image=json['image'];
    bio=json['bio'];
  }
  Map<String,dynamic> toMap(){
    return {
      'name':name,
      'email':email,
      'uid':uid,
      'phone':phone,
      'image':image,
      'cover':cover,
      'bio':bio
    };
  }

}