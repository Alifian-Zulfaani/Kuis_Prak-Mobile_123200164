import 'package:flutter/material.dart';
import 'data_buku.dart';

class detailBook extends StatefulWidget {
  final DataBuku list;
  const detailBook({Key? key, required this.list}) : super(key: key);

  @override
  State<detailBook> createState() => _detailBookState();
}

class _detailBookState extends State<detailBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.list.title),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => detailBook(list: widget.list,),),),
              icon: const Icon(Icons.search))
        ],
      ),
      body: ListView(
        children: [
          Container(
            width: 700,
            height: 300,
            margin: const EdgeInsets.only(top: 10.0, bottom: 15.0),
            child: ListView(
              children: [
              Align(
                alignment: Alignment.center,
                child: Image.network(widget.list.imageLink,
                  width: 700,
                  height: 300,),
                ),
              ],
            ),
          ),
          Text('Judul                       : ' + widget.list.title),
          Text('Penulis                    : ' + widget.list.author),
          Text('Bahasa                    : ' + widget.list.language),
          Text('Negara                    : ' + widget.list.country),
          Text('Jumlah Halaman   : ' + widget.list.pages.toString()),
          Text('Tahun Terbit           : ' + widget.list.year.toString()),
          Row(
            children: [
              Text('Status                      : '),
              Text(widget.list.isAvailable ? 'Tersedia' : 'Tidak Tersedia',
                style: TextStyle(
                  color: widget.list.isAvailable ? Colors.green : Colors.red,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
          ),
          ElevatedButton(
            onPressed: !widget.list.isAvailable ? null : () {
                widget.list.isAvailable = false;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Berhasil Meminjam Buku'),
                      backgroundColor: Colors.green),
              );
            },
            child: Text('Pinjam Buku'),
          ),
        ],
      ),
    );
  }
}
