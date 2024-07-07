class PostModel{
  String ?name;
  String ?uid;
  String ?image;
  String ?date;
  String ?text;
  String ?PostImage;

  PostModel({
    this.uid,
    this.name,
    this.image,
    this.text,
    this.date,
    this.PostImage

  });
  PostModel.fromJson(Map<String,dynamic> json){
    name=json['name'];
    uid=json['uid'];
    image=json['image'];
    text=json['text'];
    date=json['date'];
    PostImage=json['PostImage'];
  }
  Map<String,dynamic> toMap(){
    return {
      'name':name,
      'uid':uid,
      'image':image,
      'text':text,
      'PostImage':PostImage,
      'date':date

    };
  }

}