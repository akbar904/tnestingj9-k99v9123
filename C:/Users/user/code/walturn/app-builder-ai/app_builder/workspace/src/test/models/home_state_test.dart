
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:my_app/models/home_state.dart';

void main() {
	group('HomeState Tests', () {
		test('initial state should be correct', () {
			final homeState = HomeState(text: 'Cat', icon: Icons.access_time);
			expect(homeState.text, 'Cat');
			expect(homeState.icon, Icons.access_time);
		});

		test('should correctly serialize and deserialize HomeState', () {
			final homeState = HomeState(text: 'Dog', icon: Icons.person);
			final json = homeState.toJson();
			final newHomeState = HomeState.fromJson(json);

			expect(newHomeState.text, homeState.text);
			expect(newHomeState.icon, homeState.icon);
		});

		test('copyWith should return a new instance with updated values', () {
			final homeState = HomeState(text: 'Cat', icon: Icons.access_time);
			final newHomeState = homeState.copyWith(text: 'Dog', icon: Icons.person);

			expect(newHomeState.text, 'Dog');
			expect(newHomeState.icon, Icons.person);
			expect(homeState.text, 'Cat'); // Ensure original state is unchanged
			expect(homeState.icon, Icons.access_time);
		});
	});
}
