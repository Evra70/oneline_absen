import 'package:bloc/bloc.dart';

part 'pengajuan_izin_event.dart';

class PengajuanIzinBloc extends Bloc<PengajuanIzinEvent, String> {
  PengajuanIzinBloc() : super("Sakit") {
    on<SetKeteranganIzinEvent>((event, emit) {
      print("ini SetKeteranganIzinEvent");
      final oldState = state;

      // state.keperluanIzin = event.keteranganIzin;


      if (oldState == state) {
        print("state tidak berubah");
      }

      // print("PengajuanIzinSakitEvent " + state.keperluanIzin);
      emit(event.keteranganIzin);
    });
  }
}
