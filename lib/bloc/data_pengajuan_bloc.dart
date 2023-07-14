import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oneline_absen/model/pengajuan_model.dart';

part 'data_pengajuan_event.dart';
part 'data_pengajuan_state.dart';

class DataPengajuanBloc extends Bloc<DataPengajuanEvent, DataPengajuanState> {
  DataPengajuanBloc() : super(DataPengajuanInitial()) {
    on<DataPengajuanEvent>((event, emit) async {
      List<PengajuanModel> listPengajuan;
      print("PANGGGIL BLOC");
      listPengajuan = await PengajuanModel.getPengajuanList(0, 0);
      print(listPengajuan);
      emit(DataPengajuanLoadedState(
          listPengajuan: listPengajuan, hasReachMax: true));
    });
  }
}
