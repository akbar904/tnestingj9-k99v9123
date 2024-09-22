
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_app/main.dart';

class MockHomeCubit extends MockCubit<HomeState> implements HomeCubit {}

void main() {
	group('main.dart', () {
		testWidgets('App initializes correctly', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());
			expect(find.byType(MyApp), findsOneWidget);
		});

		group('MyApp Widget Tests', () {
			testWidgets('Displays HomeScreen', (WidgetTester tester) async {
				await tester.pumpWidget(MyApp());
				expect(find.byType(HomeScreen), findsOneWidget);
			});
		});

		group('Cubit Tests', () {
			late HomeCubit homeCubit;

			setUp(() {
				homeCubit = MockHomeCubit();
			});

			blocTest<HomeCubit, HomeState>(
				'initial state is correct',
				build: () => homeCubit,
				expect: () => [],
			);

			blocTest<HomeCubit, HomeState>(
				'toggles text between Cat and Dog',
				build: () => homeCubit,
				act: (cubit) => cubit.toggleText(),
				verify: (_) {
					verify(() => homeCubit.toggleText()).called(1);
				},
			);
		});
	});
}
