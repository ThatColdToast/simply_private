class MessageData {
  int messageId;
  String message;
  int time;
  int userId;

  MessageData({
    required this.messageId,
    required this.message,
    required this.time,
    required this.userId,
  });

  @override
  String toString() {
    return '($messageId, $message, $time, $userId)';
  }
}
