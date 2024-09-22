
import 'package:flutter/material.dart';

class HomeState {
	final String text;
	final IconData icon;

	HomeState({required this.text, required this.icon});

	// Factory constructor to create HomeState from JSON
	factory HomeState.fromJson(Map<String, dynamic> json) {
		return HomeState(
			text: json['text'],
			icon: IconData(json['icon'], fontFamily: 'MaterialIcons'),
		);
	}

	// Method to convert HomeState to JSON
	Map<String, dynamic> toJson() {
		return {
			'text': text,
			'icon': icon.codePoint,
		};
	}

	// Method to create a copy of HomeState with updated values
	HomeState copyWith({String? text, IconData? icon}) {
		return HomeState(
			text: text ?? this.text,
			icon: icon ?? this.icon,
		);
	}
}
