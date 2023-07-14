part of 'pengajuan_izin_bloc.dart';

abstract class PengajuanIzinState {
  String keperluanIzin;
  PengajuanIzinState(this.keperluanIzin);
}

class PengajuanIzinInitial extends PengajuanIzinState {
  PengajuanIzinInitial(super.keperluanIzin);
}

class PengajuanIzinSakitState extends PengajuanIzinState {
  PengajuanIzinSakitState(super.keperluanIzin);
}

class PengajuanIzinLainnyaState extends PengajuanIzinState {
  PengajuanIzinLainnyaState(super.keperluanIzin);
}
