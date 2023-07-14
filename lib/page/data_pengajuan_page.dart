import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oneline_absen/bloc/data_pengajuan_bloc.dart';
import 'package:oneline_absen/model/pengajuan_model.dart';

class DataPengajuanPage extends StatefulWidget {
  const DataPengajuanPage({super.key});

  @override
  State<DataPengajuanPage> createState() => _DataPengajuanPageState();
}

class _DataPengajuanPageState extends State<DataPengajuanPage> {
  ScrollController _scrollController = ScrollController();

  // void onScroll() {
  //   if (controller.position.maxScrollExtent == controller.position.pixels) {
  //     beritaBloc.add(BeritaEvent());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(255, 64, 90, 183),
          flexibleSpace: Stack(
            children: <Widget>[
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.fromLTRB(12, 5, 12, 5),
                  margin: EdgeInsets.all(20),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.featured_play_list,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Pengajuan 4",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 2,
                left: 0,
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: Text(
                    "Data Pengajuan",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: BlocBuilder<DataPengajuanBloc, DataPengajuanState>(
          builder: (context, state) {
            if (state is DataPengajuanInitial) {
              return Center(
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              DataPengajuanLoadedState dataLoad =
                  state as DataPengajuanLoadedState;
              return ListView.builder(
                controller: _scrollController,
                shrinkWrap: true,
                itemCount: (dataLoad.hasReachMax!)
                    ? dataLoad.listPengajuan!.length
                    : dataLoad.listPengajuan!.length + 1,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: BuildCard(dataLoad.listPengajuan![index], context),
                    onTap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(10),
                            ),
                          ),
                          context: context,
                          builder: (BuildContext bc) {
                            return Wrap(
                              children: <Widget>[
                                DetailPengajuanBottomUp(
                                    dataLoad.listPengajuan![index]),
                              ],
                            );
                          });
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

Card BuildCard(PengajuanModel model, BuildContext context) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Container(
      margin: EdgeInsets.only(top: 8),
      height: (MediaQuery.of(context).size.height * 0.20) +
          ((model.kategoriPengajuan == "DINAS") ? 24.0 : 4.0),
      padding: EdgeInsets.fromLTRB(12, 10, 12, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[100],
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "${model.kategoriPengajuan} - ${model.docNo}",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                  decoration: BoxDecoration(
                    color: (model.status == "I")
                        ? Colors.cyan[100]
                        : (model.status == "R")
                            ? Colors.green[100]
                            : Colors.redAccent[100],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    (model.status == "I")
                        ? "Diproses"
                        : (model.status == "R")
                            ? "Disetujui"
                            : "Ditolak",
                    style: TextStyle(
                      color: (model.status == "I")
                          ? Colors.blue[600]
                          : (model.status == "R")
                              ? Colors.green[600]
                              : Colors.red[600],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: <Widget>[
              Text(
                "Tanggal",
                style: TextStyle(color: Colors.grey[700]),
              ),
              SizedBox(
                width: 50,
              ),
              Text(":"),
              SizedBox(
                width: 10,
              ),
              Text(model.docDate,
                  style: TextStyle(fontWeight: FontWeight.w500)),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: <Widget>[
              Text(
                "Jenis Waktu",
                style: TextStyle(color: Colors.grey[700]),
              ),
              SizedBox(
                width: 21,
              ),
              Text(":"),
              SizedBox(
                width: 10,
              ),
              Text(model.jenisWaktu,
                  style: TextStyle(fontWeight: FontWeight.w500)),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: <Widget>[
              Text(
                "Keperluan",
                style: TextStyle(color: Colors.grey[700]),
              ),
              SizedBox(
                width: 36,
              ),
              Text(":"),
              SizedBox(
                width: 10,
              ),
              Text(model.jenisKeperluan,
                  style: TextStyle(fontWeight: FontWeight.w500)),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          (model.kategoriPengajuan == "DINAS")
              ? Row(
                  children: <Widget>[
                    Text(
                      "Client",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    SizedBox(
                      width: 65,
                    ),
                    Text(":"),
                    SizedBox(
                      width: 10,
                    ),
                    Text(model.tujuanDinas,
                        style: TextStyle(fontWeight: FontWeight.w500)),
                  ],
                )
              : Container(),
        ],
      ),
    ),
  );
}

class DetailPengajuanBottomUp extends StatelessWidget {
  PengajuanModel model;
  DetailPengajuanBottomUp(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * .82,
        padding: EdgeInsets.fromLTRB(14, 16, 14, 0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(10.0),
                topRight: const Radius.circular(10.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Detail",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "${model.kategoriPengajuan} - ${model.docNo}",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Text(
                  "Status Pengajuan",
                  style: TextStyle(color: Colors.grey[700]),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(":"),
                SizedBox(
                  width: 10,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                  decoration: BoxDecoration(
                    color: (model.status == "I")
                        ? Colors.cyan[100]
                        : (model.status == "R")
                            ? Colors.green[100]
                            : Colors.redAccent[100],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    (model.status == "I")
                        ? "Diproses"
                        : (model.status == "R")
                            ? "Disetujui"
                            : "Ditolak",
                    style: TextStyle(
                      color: (model.status == "I")
                          ? Colors.blue[600]
                          : (model.status == "R")
                              ? Colors.green[600]
                              : Colors.red[600],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 1,
              color: Colors.grey[350],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: <Widget>[
                Text(
                  "Nama Pengaju",
                  style: TextStyle(color: Colors.grey[700]),
                ),
                SizedBox(
                  width: 38,
                ),
                Text(":"),
                SizedBox(
                  width: 10,
                ),
                Text(model.namaPengaju),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Text(
                  "Tanggal Pengajuan",
                  style: TextStyle(color: Colors.grey[700]),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(":"),
                SizedBox(
                  width: 10,
                ),
                Text(model.pengajuanDate),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Text(
                  "Supevisor",
                  style: TextStyle(color: Colors.grey[700]),
                ),
                SizedBox(
                  width: 72,
                ),
                Text(":"),
                SizedBox(
                  width: 10,
                ),
                Text(model.spvPengajuan),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 1,
              color: Colors.grey[350],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: <Widget>[
                Text(
                  "Tanggal Izin",
                  style: TextStyle(color: Colors.grey[700]),
                ),
                SizedBox(
                  width: 56,
                ),
                Text(":"),
                SizedBox(
                  width: 10,
                ),
                Text(model.pengajuanDate),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Text(
                  "Jenis Waktu",
                  style: TextStyle(color: Colors.grey[700]),
                ),
                SizedBox(
                  width: 56,
                ),
                Text(":"),
                SizedBox(
                  width: 10,
                ),
                Text(model.jenisWaktu),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Text(
                  "Keperluan",
                  style: TextStyle(color: Colors.grey[700]),
                ),
                SizedBox(
                  width: 72,
                ),
                Text(":"),
                SizedBox(
                  width: 10,
                ),
                Text(model.jenisKeperluan),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Text(
                    "Keterangan",
                    style: TextStyle(color: Colors.grey[700]),
                    textAlign: TextAlign.end,
                  ),
                  SizedBox(
                    width: 62,
                  ),
                  Text(":"),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Text(
                      model.keterangan,
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}
