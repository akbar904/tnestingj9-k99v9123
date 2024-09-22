
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.walturn.flutter_app/cubits/home_cubit.dart';
import 'package:com.walturn.flutter_app/widgets/custom_text_widget.dart';

class HomeScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Home Screen'),
			),
			body: Center(
				child: BlocBuilder<HomeCubit, HomeState>(
					builder: (context, state) {
						return GestureDetector(
							onTap: () {
								context.read<HomeCubit>().toggleText();
							},
							child: CustomTextWidget(
								text: state.text,
								icon: state.icon,
							),
						);
					},
				),
			),
		);
	}
}
