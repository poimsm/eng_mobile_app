class MockProductUPCScan {
  bool error;
  MockProductUPCScan({required this.error});

  String json() {
    if (error) {
      return errorResponse;
    }

    if (!error) {
      return successResponse;
    }
    return '{}';
  }

  String successResponse = '''
      {
        "result": "OK",
        "message": null,
        "description": "RCERAVE SA CR.ALIS.A/R340G",
        "sku": "447245"
      }
    ''';

  String errorResponse = '''
      {
        "result": "ERROR",
        "message": "UPC no coincide con ningun SKU en base de datos",
        "description": null,
        "sku": null
      }
    ''';
}
