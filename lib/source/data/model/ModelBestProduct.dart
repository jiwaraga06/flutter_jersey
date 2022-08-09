class ModelBestProduct {
  int? id;
  String? nama;
  int? harga;
  int? hargaNameset;
  int? isReady;
  int? isFavorite;
  String? jenis;
  double? berat;
  String? gambar;
  int? ligaId;
  String? createdAt;
  String? updatedAt;

  ModelBestProduct(
      {this.id,
      this.nama,
      this.harga,
      this.hargaNameset,
      this.isReady,
      this.isFavorite,
      this.jenis,
      this.berat,
      this.gambar,
      this.ligaId,
      this.createdAt,
      this.updatedAt});

  ModelBestProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    harga = json['harga'];
    hargaNameset = json['harga_nameset'];
    isReady = json['is_ready'];
    isFavorite = json['is_favorite'];
    jenis = json['jenis'];
    berat = json['berat'];
    gambar = json['gambar'];
    ligaId = json['liga_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
