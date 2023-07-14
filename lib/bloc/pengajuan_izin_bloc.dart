import 'package:bloc/bloc.dart';

part 'pengajuan_izin_event.dart';
part 'pengajuan_izin_state.dart';

class PengajuanIzinBloc extends Bloc<PengajuanIzinEvent, PengajuanIzinState> {
  PengajuanIzinBloc() : super(PengajuanIzinInitial("Sakit")) {
    on<PengajuanIzinSakitEvent>((event, emit) {
      state.keperluanIzin = event.value.toString();
      print(state.keperluanIzin);
      emit(state);
    });
    on<PengajuanIzinLainnyaEvent>((event, emit) {
      state.keperluanIzin = event.value.toString();
      print(state.keperluanIzin);
      emit(state);
    });
  }
}
