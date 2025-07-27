import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_viewer_app/app_skeleton.dart';
import 'package:product_viewer_app/src/view/favorites/favorites.dart';
import 'package:product_viewer_app/src/view/products/product_list_screen.dart';

void main() {
  testWidgets('BottomNavigationBar navigates between Home and Favorites', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const ProviderScope(child: MaterialApp(home: AppSkeleton())),
    );

    expect(find.byType(ProductListScreen), findsOneWidget);
    expect(find.byType(FavoritesScreen), findsNothing);

    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pumpAndSettle();

    expect(find.byType(FavoritesScreen), findsOneWidget);
    expect(find.byType(ProductListScreen), findsNothing);

    await tester.tap(find.byIcon(Icons.home));
    await tester.pumpAndSettle();

    expect(find.byType(ProductListScreen), findsOneWidget);
    expect(find.byType(FavoritesScreen), findsNothing);
  });
}
