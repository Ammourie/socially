enum MediaType {
  image(0),
  video(1),
  unknown(-1);

  final int? value;
  const MediaType(this.value);

  static MediaType mapToType(int? value) {
    switch (value) {
      case 0:
        return MediaType.image;
      case 1:
        return MediaType.video;
      default:
        return MediaType.unknown;
    }
  }
}
