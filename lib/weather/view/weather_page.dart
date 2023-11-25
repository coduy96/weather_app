import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/weather/weather.dart';
import 'package:weather_repository/weather_repository.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(context.read<WeatherRepository>()),
      child: const WeatherView(),
    );
  }
}

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  final TextEditingController _searchTextController =
      TextEditingController(); // add this

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: SafeArea(
        child: SizedBox.expand(
          child: BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, state) {
              switch (state.status) {
                case WeatherStatus.initial:
                  return const WeatherEmpty();
                case WeatherStatus.loading:
                  return const WeatherLoading();
                case WeatherStatus.success:
                  return WeatherPopulated(
                    weather: state.weather,
                    units: state.temperatureUnits,
                    onRefresh: () {
                      return context.read<WeatherCubit>().refreshWeather();
                    },
                  );
                case WeatherStatus.failure:
                  return const WeatherError();
              }
            },
          ),
        ),
      ),
      bottomNavigationBar: const UnitToggle(),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: TextField(
        controller: _searchTextController,
        style: Theme.of(context).textTheme.titleLarge,
        decoration: InputDecoration(
          prefixIcon: const Padding(
            padding: EdgeInsets.only(right: 10),
            child: SizedBox(
              width: 10,
              child: Column(
                children: <Widget>[
                  Divider(
                    thickness: 2,
                  ),
                  Divider(
                    thickness: 2,
                  ),
                ],
              ),
            ),
          ),
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.search,
            ),
            onPressed: () {
              context
                  .read<WeatherCubit>()
                  .fetchWeather(_searchTextController.text);
            },
          ),
        ),
        onSubmitted: (value) =>
            context.read<WeatherCubit>().fetchWeather(value),
      ),
      toolbarHeight: 100,
    );
  }
}

class UnitToggle extends StatelessWidget {
  const UnitToggle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<WeatherCubit, WeatherState>(
        buildWhen: (previous, current) =>
            previous.temperatureUnits != current.temperatureUnits,
        builder: (context, state) {
          return ListTile(
            title: Text(
              'Enable celcius units',
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            trailing: Switch(
              value: state.temperatureUnits.isCelsius,
              onChanged: (_) => context.read<WeatherCubit>().toggleUnits(),
            ),
          );
        },
      ),
    );
  }
}
