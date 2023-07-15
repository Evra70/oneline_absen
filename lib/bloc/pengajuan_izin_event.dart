part of 'pengajuan_izin_bloc.dart';

abstract class PengajuanIzinEvent {
  String keteranganIzin;
  PengajuanIzinEvent(this.keteranganIzin);
}

class SetKeteranganIzinEvent extends PengajuanIzinEvent {
  SetKeteranganIzinEvent(super.keteranganIzin);
}

