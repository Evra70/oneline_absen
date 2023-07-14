import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

class PengajuanModel extends Equatable {
  String kategoriPengajuan;
  String docNo;
  String docDate;
  String status;
  String namaPengaju;
  String spvPengajuan;
  String pengajuanDate;
  String jenisWaktu;
  String jenisKeperluan;
  String keterangan;
  String tujuanDinas;

  PengajuanModel({
    this.kategoriPengajuan = "",
    this.docNo = "",
    this.docDate = "",
    this.status = "",
    this.namaPengaju = "",
    this.spvPengajuan = "",
    this.pengajuanDate = "",
    this.jenisWaktu = "",
    this.jenisKeperluan = "",
    this.keterangan = "",
    this.tujuanDinas = "",
  });

  static Future<String> _dummyPengajuanList() async {
    await Future.delayed(Duration(seconds: 1));
    return '''
      [
        {
          "kategoriPengajuan" : "IZIN",
          "docNo" : "LF/202110/000001",
          "docDate" : "12 Sep 2022",
          "status" : "I",
          "namaPengaju" : "Ephraim",
          "spvPengajuan" : "Pak David",
          "pengajuanDate" : "13 Sep 2022",
          "jenisWaktu" : "Setengah Hari (Pagi)",
          "jenisKeperluan" : "Sakit",
          "keterangan" : "Beli Boba di Xie Fu Tang",
          "tujuanDinas" : ""
        },
        {
          "kategoriPengajuan" : "CUTI",
          "docNo" : "LF/202110/000002",
          "docDate" : "13 Sep 2022",
          "status" : "R",
          "namaPengaju" : "Ephraim",
          "spvPengajuan" : "Pak David",
          "pengajuanDate" : "14 Sep 2022",
          "jenisWaktu" : "Seharian",
          "jenisKeperluan" : "Urusan Keluarga",
          "keterangan" : "Mengunjungi keluarga di luar pulau",
          "tujuanDinas" : ""
        },
        {
          "kategoriPengajuan" : "DINAS",
          "docNo" : "LF/202110/000003",
          "docDate" : "14 Sep 2022",
          "status" : "C",
          "namaPengaju" : "Ephraim",
          "spvPengajuan" : "Pak David",
          "pengajuanDate" : "15 Sep 2022",
          "jenisWaktu" : "Setengah Hari (Siang)",
          "jenisKeperluan" : "Dinas Luar Kantor",
          "keterangan" : "Pergi ke Clien",
          "tujuanDinas" : "PT SOLUSI SEJATI"
        }
      ]
    ''';
  }

  factory PengajuanModel.createPengajuan(Map<String, dynamic> object) {
    return PengajuanModel(
      kategoriPengajuan: object['kategoriPengajuan'],
      docNo: object['docNo'],
      docDate: object['docDate'],
      status: object['status'],
      namaPengaju: object['namaPengaju'],
      spvPengajuan: object['spvPengajuan'],
      pengajuanDate: object['pengajuanDate'],
      jenisWaktu: object['jenisWaktu'],
      jenisKeperluan: object['jenisKeperluan'],
      keterangan: object['keterangan'],
      tujuanDinas: object['tujuanDinas'],
    );
  }

  static Future<List<PengajuanModel>> getPengajuanList(
      int start, int limit) async {
    // Uri apiUrl = Uri.parse(
    //     "../pengajuan/limit/?_start=${start}&_limit=${limit}");
    var apiResult = await _dummyPengajuanList();
    var jsonObject = json.decode(apiResult) as List;

    print("INI DIPANGGIL");
    return jsonObject
        .map<PengajuanModel>((item) => PengajuanModel(
              kategoriPengajuan: item['kategoriPengajuan'],
              docNo: item['docNo'],
              docDate: item['docDate'],
              status: item['status'],
              namaPengaju: item['namaPengaju'],
              spvPengajuan: item['spvPengajuan'],
              pengajuanDate: item['pengajuanDate'],
              jenisWaktu: item['jenisWaktu'],
              jenisKeperluan: item['jenisKeperluan'],
              keterangan: item['keterangan'],
              tujuanDinas: item['tujuanDinas'],
            ))
        .toList();
  }

  @override
  List<Object?> get props => [
        kategoriPengajuan,
        docNo,
        docDate,
        status,
        namaPengaju,
        spvPengajuan,
        pengajuanDate,
        jenisWaktu,
        jenisKeperluan,
        keterangan,
        tujuanDinas,
      ];
}
