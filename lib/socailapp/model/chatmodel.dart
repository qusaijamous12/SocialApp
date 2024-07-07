class ChatModel{

  String ?senderId;
  String ?recieverId;
  String ?text;
  String ?date;

  ChatModel({
    this.senderId,
    this.recieverId,
    this.date,
    this.text,


  });
  ChatModel.fromJson(Map<String,dynamic> json){
    senderId=json['senderId'];
    recieverId=json['recieverId'];
    text=json['text'];
    date=json['date'];
  }
  Map<String,dynamic> toMap(){
    return {
      'senderId':senderId,
      'recieverId':recieverId,
      'text':text,
      'date':date

    };
  }

}