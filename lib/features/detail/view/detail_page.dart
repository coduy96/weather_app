import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../widgets/weather_icon_image.dart';
import '../../weather/cubit/weather_cubit.dart';

class DetailPage extends StatelessWidget {
  const DetailPage._();

  static Route<void> route(WeatherCubit weatherCubit) {
    return MaterialPageRoute<void>(
      builder: (_) => BlocProvider.value(
        value: weatherCubit,
        child: const DetailPage._(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Detail forecast',
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.forecastData.list.length,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.all(10.0), // Margin around the container
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).primaryColor, // Border color
                  width: 2.0, // Border width
                ),
                borderRadius: BorderRadius.circular(10.0), // Border radius
              ),
              child: ListTile(
                  leading: WeatherIconImage(
                      iconUrl: state.forecastData.list[index].iconUrl,
                      size: 30),
                  title: Text(
                    state.forecastData.list[index].description.toString(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  subtitle: Text(
                    DateFormat('EEE-d MMM').format(
                      state.forecastData.list[index].date,
                    ),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  trailing: Text(
                    state.isEnableCelcius
                        ? '${state.forecastData.list[index].temp.celsius.toStringAsPrecision(2)}°C'
                        : '${state.forecastData.list[index].temp.farhenheit.toStringAsPrecision(2)}°F',
                    style: Theme.of(context).textTheme.bodyLarge,
                  )),
            ),
          );
        },
      ),
    );
  }
}
