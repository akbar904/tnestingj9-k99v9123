
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.walturn.flutter_app/screens/home_screen.dart';

class MockHomeCubit extends MockCubit<HomeState> implements HomeCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		late HomeCubit homeCubit;

		setUp(() {
			homeCubit = MockHomeCubit();
		});

		testWidgets('initially displays text "Cat" with clock icon', (WidgetTester tester) async {
			when(() => homeCubit.state).thenReturn(HomeState(text: 'Cat', icon: Icons.access_time));
			
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<HomeCubit>(
						create: (_) => homeCubit,
						child: HomeScreen(),
					),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('displays text "Dog" with person icon when state changes', (WidgetTester tester) async {
			whenListen(
				homeCubit,
				Stream.fromIterable([
					HomeState(text: 'Cat', icon: Icons.access_time),
					HomeState(text: 'Dog', icon: Icons.person),
				]),
				initialState: HomeState(text: 'Cat', icon: Icons.access_time),
			);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<HomeCubit>(
						create: (_) => homeCubit,
						child: HomeScreen(),
					),
				),
			);

			await tester.pump(); // Rebuild the widget with new state

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});

		testWidgets('taps on text to toggle between "Cat" and "Dog"', (WidgetTester tester) async {
			when(() => homeCubit.state).thenReturn(HomeState(text: 'Cat', icon: Icons.access_time));
			when(() => homeCubit.toggleText()).thenAnswer((_) {});

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<HomeCubit>(
						create: (_) => homeCubit,
						child: HomeScreen(),
					),
				),
			);

			await tester.tap(find.text('Cat'));
			verify(() => homeCubit.toggleText()).called(1);
		});
	});
}
