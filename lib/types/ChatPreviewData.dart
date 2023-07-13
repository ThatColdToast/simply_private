class ChatPreviewData {
  int userId;
  String name;
  String? messageText;
  int messageTime;

  ChatPreviewData({
    required this.userId,
    required this.name,
    required this.messageText,
    required this.messageTime,
  });

  @override
  String toString() {
    return '($userId, $name, ${messageText ?? '_'}, $messageTime)';
  }
}
