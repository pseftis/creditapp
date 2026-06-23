import 'package:flutter_test/flutter_test.dart';

import 'package:cred_rewards_app/main.dart';

void main() {
  testWidgets('IPO Mentor AI dashboard renders platform overview', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('IPO Mentor AI + Trust Engine'), findsOneWidget);
    expect(find.text('Guided IPO Workflow'), findsOneWidget);
    expect(find.text('Trust Engine'), findsOneWidget);
    expect(find.text('Expected Impact'), findsOneWidget);
  });
}
