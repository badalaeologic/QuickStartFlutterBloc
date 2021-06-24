class MasterData {
  String sId;
  List<String> shipmentTermsList;
  List<String> currencyList;
  List<String> unitList;
  List<String> productCategoryList;
  List<String> auctionFieldList;
  List<String> jobRoleList;
  List<String> jobTitleList;
  String dataType;

  MasterData({
    this.sId,
    this.shipmentTermsList,
    this.currencyList,
    this.unitList,
    this.productCategoryList,
    this.auctionFieldList,
    this.jobRoleList,
    this.jobTitleList,
    this.dataType,
  });

  MasterData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    shipmentTermsList = json['shipmentTermsList'] != null
        ? json['shipmentTermsList'].cast<String>()
        : [];
    currencyList = json['currencyList'] != null
        ? json['currencyList'].cast<String>()
        : [];
    unitList = json['unitList'] != null
        ? json['unitList'].cast<String>()
        : [];
    productCategoryList = json['productCategoryList'] != null
        ? json['productCategoryList'].cast<String>()
        : [];
    auctionFieldList = json['auctionFieldList'] != null
        ? json['auctionFieldList'].cast<String>()
        : [];
    jobRoleList = json['jobRoleList'] != null
        ? json['jobRoleList'].cast<String>()
        : [];
    jobTitleList = json['jobTitleList'] != null
        ? json['jobTitleList'].cast<String>()
        : [];
    dataType = json['dataType'] != null ? json['dataType'] : "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['shipmentTermsList'] = this.shipmentTermsList;
    data['currencyList'] = this.currencyList;
    data['unitList'] = this.unitList;
    data['productCategoryList'] = this.productCategoryList;
    data['auctionFieldList'] = this.auctionFieldList;
    data['jobRoleList'] = this.jobRoleList;
    data['jobTitleList'] = this.jobTitleList;
    data['dataType'] = this.dataType;
    return data;
  }
}
