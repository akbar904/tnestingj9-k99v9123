
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_app/widgets/custom_text_widget.dart';

void main() {
	group('CustomTextWidget', () {
		testWidgets('displays initial text as "Cat" with clock icon', (WidgetTester tester) async {
			// Arrange
			await tester.pumpWidget(MaterialApp(home: Scaffold(body: CustomTextWidget())));

			// Act

			// Assert
			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('toggles text to "Dog" with person icon on tap', (WidgetTester tester) async {
			// Arrange
			await tester.pumpWidget(MaterialApp(home: Scaffold(body: CustomTextWidget())));

			// Act
			await tester.tap(find.text('Cat'));
			await tester.pump(); // Rebuild the widget after the state has changed.

			// Assert
			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
