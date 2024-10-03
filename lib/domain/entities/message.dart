enum FromWho { me, its }

class Message {
  final String text;
  final String? imageUrl;
  final FromWho sender;

  Message({required this.text, this.imageUrl, required this.sender});
}
