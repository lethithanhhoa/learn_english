class DBVersion {
  String version;

  DBVersion({this.version});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'version': version,
    };
    return map;
  }

  factory DBVersion.fromMap(Map<String, dynamic> data) {
    return DBVersion(
      version: data['version'],
    );
  }
}