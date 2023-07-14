part of 'data_pengajuan_bloc.dart';

abstract class DataPengajuanState extends Equatable {
  const DataPengajuanState();

  @override
  List<Object> get props => [];
}

class DataPengajuanInitial extends DataPengajuanState {
  @override
  List<Object> get props => [];
}

class DataPengajuanLoadedState extends DataPengajuanState {
  List<PengajuanModel>? listPengajuan;
  bool? hasReachMax;

  DataPengajuanLoadedState({this.listPengajuan, this.hasReachMax});

  DataPengajuanLoadedState copyWith(
      {List<PengajuanModel>? listPengajuan, bool? hasReachMax}) {
    return DataPengajuanLoadedState(
      listPengajuan: listPengajuan ?? listPengajuan,
      hasReachMax: hasReachMax ?? this.hasReachMax,
    );
  }

  @override
  List<Object> get props => [listPengajuan ?? []];
}
