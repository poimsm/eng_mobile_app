class MockScanSKU {
  json() {
    return '''
      {
        "result": "SUCCESS",
        "image_url": "/app/media/SKU_estandar/251676_0.webp",
        "message": "El codigo 007801620009250 no corresponde al sku 40052, corresponde al sku 404733",
        "dict": 

        {
  "shelves": [
    {
      "index": 1,
      "color": 1,
      "products": [
        {
          "index": 1,
          "color": 2,
          "stock_time": "06:05:32",
          "description": "BCERAVE B1 ACTUALIZADO",
          "SKU": "2919893677",
          "stock": 10,
          "faces": 2,
          "pile_up": 2,
          "detected_to_total": "5/8",
          "image_url": "/app/media/SKU_estandar/251676_0.webp"
        },
        {
          "index": 2,
          "color": 1,
          "stock_time": "06:05:32",
          "description": "XCERAVE B1 ACTUALIZADO",
          "SKU": "787887",
          "stock": 12,
          "faces": 3,
          "pile_up": 5,
          "detected_to_total": "10/10",
          "image_url": "/app/media/SKU_estandar/251676_0.webp"
        }
      ]
    },
    {
      "index": 2,
      "color": 2,
      "products": [
        {
          "index": 1,
          "color": 2,
          "stock_time": "06:05:32",
          "description": "ECERAVE B2 ACTUALIZADO",
          "SKU": "656566",
          "stock": 10,
          "faces": 2,
          "pile_up": 2,
          "detected_to_total": "5/8",
          "image_url": "/app/media/SKU_estandar/251676_0.webp"
        },
        {
          "index": 2,
          "color": 0,
          "stock_time": "06:05:32",
          "description": "GCERAVE B2 ACTUALIZADO",
          "SKU": "35355",
          "stock": 12,
          "faces": 3,
          "pile_up": 5,
          "detected_to_total": "10/10",
          "image_url": "/app/media/SKU_estandar/251676_0.webp"
        },
        {
          "index": 3,
          "color": 1,
          "stock_time": "06:05:32",
          "description": "TCERAVE B2 ACTUALIZADO",
          "SKU": "000546",
          "stock": 12,
          "faces": 3,
          "pile_up": 5,
          "detected_to_total": "10/10",
          "image_url": "/app/media/SKU_estandar/251676_0.webp"
        }
      ]
    }
  ],
  "shelves_data": {
    "1": {
      "total_products": 4,
      "total_units": 8,
      "missing_products": 6,
      "color": 1,
      "campo_alen": "asd"
    },
    "2": {
      "total_products": 3,
      "total_units": 12,
      "missing_products": 3,
      "color": 0,
      "campo_alen": "asd"
    }
  },
  "planogram": [
    {
      "index": 1,
      "shelf": 1,
      "stock_time": "06:05:32",
      "color": 2,
      "description": "XCERAVE SA ACTUALIZADO",
      "SKU": "001936",
      "stock": 10,
      "faces": 2,
      "pile_up": 2,
      "detected_to_total": "5/8",
      "image_url": "/app/media/SKU_estandar/251676_0.webp",
      "image_high_resolution_url": "/app/media/SKU_estandar/251676_0.webp"
    },
    {
      "index": 1,
      "shelf": 2,
      "color": 2,
      "stock_time": "06:05:32",
      "description": "RCERAVE SA ACTUALIZADO",
      "SKU": "999936",
      "stock": 10,
      "faces": 2,
      "pile_up": 2,
      "detected_to_total": "5/8",
      "image_url": null,
      "image_high_resolution_url": null
    },
    {
      "index": 2,
      "shelf": 2,
      "color": 1,
      "stock_time": "06:05:32",
      "description": "PCERAVE SA ACTUALIZADO",
      "SKU": "191936",
      "stock": 10,
      "faces": 2,
      "pile_up": 2,
      "detected_to_total": "5/8",
      "image_url": "/app/media/SKU_estandar/251676_0.webp",
      "image_high_resolution_url": "/app/media/SKU_estandar/251676_0.webp"
    },
    {
      "index": 3,
      "shelf": 2,
      "color": 0,
      "stock_time": "06:05:32",
      "description": "ACERAVE SA ACTUALIZADO",
      "SKU": "291936",
      "stock": 10,
      "faces": 2,
      "pile_up": 2,
      "detected_to_total": "5/8",
      "image_url": null,
      "image_high_resolution_url": null
    }
  ],
  "local": "FCV0003",
  "gondola": "ACCESORIOS BELLEZA.MRC-A",
  "OSA": 0.99,
  "total_products_planogram": 100,
  "total_products_found": 120,
  "total_missing_products": 20,
  "missing_products_with_photos": 20,
  "missing_products_without_photos": 20,
  "last_stock_time": "15:50"
}


      }
    ''';
  }
}
