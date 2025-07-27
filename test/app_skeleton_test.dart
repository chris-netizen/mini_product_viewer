import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_viewer_app/app_skeleton.dart';

void main() {
  testWidgets('BottomNavigationBar switches between Home and Favorites', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const ProviderScope(child: MaterialApp(home: AppSkeleton())),
    );

    expect(find.text('Favorites'), findsNothing);
    expect(find.byType(BottomNavigationBar), findsOneWidget);

    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pumpAndSettle();

    expect(find.text('Favorites'), findsOneWidget);
  });
}
