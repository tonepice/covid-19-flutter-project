class CovidStatsEntity {
  final String? txnDate;
  final String? province;
  final int? newCase;
  final int? totalCase;
  final int? newDeath;
  final int? totalDeath;
  final String? updateDate;

  const CovidStatsEntity({
    required this.txnDate,
    required this.province,
    required this.newCase,
    required this.totalCase,
    required this.newDeath,
    required this.totalDeath,
    required this.updateDate,
  });

  // ฟังก์ชัน factory ที่รับค่าจาก JSON หรือแหล่งข้อมูลอื่น
  factory CovidStatsEntity.fromJson(Map<String, dynamic> json) {
    return CovidStatsEntity(
      txnDate: json['txnDate'] ?? '', // กำหนดค่าเริ่มต้นเป็นค่าว่างถ้าเป็น null
      province: json['province'] ?? 'Unknown', // ถ้าเป็น null ให้ใช้ 'Unknown'
      newCase: json['newCase'] ?? 0, // ถ้าเป็น null ให้ใช้ 0
      totalCase: json['totalCase'] ?? 0, // ถ้าเป็น null ให้ใช้ 0
      newDeath: json['newDeath'] ?? 0, // ถ้าเป็น null ให้ใช้ 0
      totalDeath: json['totalDeath'] ?? 0, // ถ้าเป็น null ให้ใช้ 0
      updateDate: json['updateDate'] ?? '', // ถ้าเป็น null ให้ใช้ค่าว่าง
    );
  }
}
