// "msg_id": "1",
// "sender_username": "S_Admin",
// "receiver_username": "S_Admin",
// "msg_content": "",
// "msg_status": "read",
// "msg_date":

class UsersChat {
  String id,
      msgID,
      senderUsername,
      receiverUsername,
      msgContent,
      msgStatus,
      msgDate;

  UsersChat(
      {this.id,
      this.msgID,
      this.senderUsername,
      this.receiverUsername,
      this.msgContent,
      this.msgStatus,
      this.msgDate});

  factory UsersChat.fromJson(Map<String, dynamic> json) {
    return UsersChat(
        msgID: json["msg_id"],
        senderUsername: json["sender_username"],
        receiverUsername: json["receiver_username"],
        msgContent: json["msg_content"],
        msgStatus: json["msg_status"],
        msgDate: json["msg_date"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "msg_id": msgID,
      "sender_username": senderUsername,
      "receiver_username": receiverUsername,
      "msg_content": msgContent,
      "msg_status": msgStatus,
      "msg_date": msgDate
    };
  }

  Map<String, dynamic> toMap() {
    return {
      "msg_id": msgID,
      "sender_username": senderUsername,
      "receiver_username": receiverUsername,
      "msg_content": msgContent,
      "msg_status": msgStatus,
      "msg_date": msgDate
    };
  }
}
