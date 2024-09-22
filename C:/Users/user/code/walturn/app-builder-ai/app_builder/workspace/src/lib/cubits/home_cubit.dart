
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_app/models/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
	HomeCubit() : super(HomeState(text: 'Cat', icon: Icons.access_time));

	void toggleText() {
		if (state.text == 'Cat') {
			emit(HomeState(text: 'Dog', icon: Icons.person));
		} else {
			emit(HomeState(text: 'Cat', icon: Icons.access_time));
		}
	}
}
