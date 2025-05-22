import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_lab_assignment_3/main.dart';
import 'package:flutter_lab_assignment_3/data/repositories/album_repository.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Create a test repository using a mock or empty client
    final testRepo = AlbumRepository(client: http.Client());

    // Pass the repository to MyApp
    await tester.pumpWidget(MyApp(repository: testRepo));

    // Since your real UI likely doesn't show a counter, this part might fail unless you add a dummy counter
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
