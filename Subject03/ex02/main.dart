import 'package:http/http.dart' as http;
import 'package:test/test.dart';

void main() async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/users');

  test("통신 테스트", () async {
    final response = await http.get(url);
    final statusCode = response.statusCode;

    expect(statusCode, 200);
  });
}
