part of 'pengajuan_izin_bloc.dart';

abstract class PengajuanIzinEvent {
  String? value;
  PengajuanIzinEvent(this.value);
}

class PengajuanIzinSakitEvent extends PengajuanIzinEvent {
  PengajuanIzinSakitEvent(super.value);
}

class PengajuanIzinLainnyaEvent extends PengajuanIzinEvent {
  PengajuanIzinLainnyaEvent(super.value);
}
