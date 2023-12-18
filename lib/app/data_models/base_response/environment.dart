/// baseUrl : ""
/// supabaseUrl : "localhost:52431"
/// supabaseAnonKey : ""
/// supabaseAuthCallbackUrlHostname : null

class Environment {
  Environment({
    this.baseUrl,
    this.supabaseUrl,
    this.supabaseAnonKey,
    this.supabaseAuthCallbackUrlHostname,
  });

  Environment.fromJson(dynamic json) {
    baseUrl = json['baseUrl'];
    supabaseUrl = json['supabaseUrl'];
    supabaseAnonKey = json['supabaseAnonKey'];
    supabaseAuthCallbackUrlHostname = json['supabaseAuthCallbackUrlHostname'];
  }

  String? baseUrl;
  String? supabaseUrl;
  String? supabaseAnonKey;
  dynamic supabaseAuthCallbackUrlHostname;

  Environment copyWith({
    String? baseUrl,
    String? supabaseUrl,
    String? supabaseAnonKey,
    dynamic supabaseAuthCallbackUrlHostname,
  }) =>
      Environment(
        baseUrl: baseUrl ?? this.baseUrl,
        supabaseUrl: supabaseUrl ?? this.supabaseUrl,
        supabaseAnonKey: supabaseAnonKey ?? this.supabaseAnonKey,
        supabaseAuthCallbackUrlHostname: supabaseAuthCallbackUrlHostname ??
            this.supabaseAuthCallbackUrlHostname,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['baseUrl'] = baseUrl;
    map['supabaseUrl'] = supabaseUrl;
    map['supabaseAnonKey'] = supabaseAnonKey;
    map['supabaseAuthCallbackUrlHostname'] = supabaseAuthCallbackUrlHostname;
    return map;
  }
}
