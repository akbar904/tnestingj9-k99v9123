
import 'package:flutter/material.dart';

class CustomTextWidget extends StatefulWidget {
	const CustomTextWidget({Key? key}) : super(key: key);

	@override
	_CustomTextWidgetState createState() => _CustomTextWidgetState();
}

class _CustomTextWidgetState extends State<CustomTextWidget> {
	bool _isCat = true;

	void _toggleText() {
		setState(() {
			_isCat = !_isCat;
		});
	}

	@override
	Widget build(BuildContext context) {
		return GestureDetector(
			onTap: _toggleText,
			child: Row(
				children: [
					Text(_isCat ? 'Cat' : 'Dog'),
					Icon(_isCat ? Icons.access_time : Icons.person),
				],
			),
		);
	}
}
