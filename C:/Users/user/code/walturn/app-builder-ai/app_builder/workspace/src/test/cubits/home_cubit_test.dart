
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/cubits/home_cubit.dart';
import 'package:my_app/models/home_state.dart';

class MockHomeCubit extends MockCubit<HomeState> implements HomeCubit {}

void main() {
	group('HomeCubit', () {
		late HomeCubit homeCubit;

		setUp(() {
			homeCubit = HomeCubit();
		});

		tearDown(() {
			homeCubit.close();
		});

		test('initial state is HomeState(text: "Cat", icon: Icons.access_time)', () {
			expect(homeCubit.state, HomeState(text: 'Cat', icon: Icons.access_time));
		});

		blocTest<HomeCubit, HomeState>(
			'emits [HomeState(text: "Dog", icon: Icons.person)] when toggleText is called once',
			build: () => homeCubit,
			act: (cubit) => cubit.toggleText(),
			expect: () => [HomeState(text: 'Dog', icon: Icons.person)],
		);

		blocTest<HomeCubit, HomeState>(
			'emits [HomeState(text: "Dog", icon: Icons.person), HomeState(text: "Cat", icon: Icons.access_time)] when toggleText is called twice',
			build: () => homeCubit,
			act: (cubit) {
				cubit.toggleText();
				cubit.toggleText();
			},
			expect: () => [
				HomeState(text: 'Dog', icon: Icons.person),
				HomeState(text: 'Cat', icon: Icons.access_time),
			],
		);
	});
}
