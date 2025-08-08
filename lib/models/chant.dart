class Chant {
  final String title;
  final String content;
  final String audioPath;

  Chant({required this.title, required this.content, required this.audioPath});

  factory Chant.fromJson(Map<String, dynamic> json) {
    return Chant(
      title: json['title'] as String,
      content: json['content'] as String,
      audioPath: json['audioPath'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
        'audioPath': audioPath,
      };
}
