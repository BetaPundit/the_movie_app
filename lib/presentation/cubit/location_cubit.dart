import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/utils/constants/enums.dart';
import 'package:geocoding/geocoding.dart';

part 'location_cubit.freezed.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState({
    @Default(NetworkStatus.initial) NetworkStatus status,
    Placemark? place,
  }) = _LocationState;

  const LocationState._();

  String get streetAddress => place?.street ?? '--';

  String get subAddress =>
      '${place?.locality}, ${place?.subAdministrativeArea}, ${place?.postalCode}';
}

@lazySingleton
class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(const LocationState());

  Future<void> fetchLocation() async {
    emit(state.copyWith(status: NetworkStatus.loading));

    final response = await _getCurrentLocation();

    if (response != null) {
      emit(state.copyWith(
        status: NetworkStatus.success,
        place: response,
      ));
    } else {
      emit(state.copyWith(status: NetworkStatus.failure));
    }
  }

  Future<Placemark?> _getAddressFromLatLng(Position position) async {
    final placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    return place;
  }

  Future<Placemark?> _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    final place = await _getAddressFromLatLng(position);

    return place;
  }
}
