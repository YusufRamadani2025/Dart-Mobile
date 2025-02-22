import 'dart:convert';

class Sample {
  final String name;
  final int age;
  final List<String> hobby;
  final Github github;

  Sample({
    required this.name,
    required this.age,
    required this.hobby,
    required this.github,
  });

  factory Sample.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return Sample(
        name: 'Unknown',
        age: 0,
        hobby: [],
        github: Github.empty(),
      );
    }

    return Sample(
      name: json["Name"] ?? 'Unknown',
      age: json["Age"] ?? 0,
      hobby: (json["Hobby"] as List?)?.map((e) => e.toString()).toList() ?? [],
      github: json["Github"] != null ? Github.fromJson(json["Github"]) : Github.empty(),
    );
  }

  @override
  String toString() {
    return 'Sample(name: $name, age: $age, hobby: $hobby, github: $github)';
  }
}

class Github {
  final String username;
  final int repositories;
  final bool isGDE;

  Github({
    required this.username,
    required this.repositories,
    required this.isGDE,
  });

  factory Github.empty() {
    return Github(username: 'NoUsername', repositories: 0, isGDE: false);
  }

  factory Github.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Github.empty();

    return Github(
      username: json["username"] ?? 'NoUsername',
      repositories: json["repositories"] ?? 0,
      isGDE: json["isGDE"] ?? false,
    );
  }

  @override
  String toString() => 'Github(username: $username, repositories: $repositories, isGDE: $isGDE)';
}

void main() {
  String jsonData = '''
  {
    "Name": "John Doe",
    "Age": 25,
    "Hobby": ["Reading", "Coding"],
    "Github": {
      "username": "johndoe",
      "repositories": 10,
      "isGDE": true
    }
  }
  ''';

  Map<String, dynamic> parsedJson = jsonDecode(jsonData);
  Sample sample = Sample.fromJson(parsedJson);

  // Cetak hasilnya
  print(sample);
}
