class MockLastResult {
  bool isDev;
  String responseType;

  MockLastResult({required this.isDev, required this.responseType});

  String json() {
    if (isDev && responseType == 'success') {
      return successDevResponse;
    }

    if (!isDev && responseType == 'success') {
      return successBasicResponse;
    }

    if (responseType == 'busy') {
      return busyResponse;
    }

    if (responseType == 'idle') {
      return iddleResponse;
    }

    if (responseType == 'imagesInProcess') {
      return imagesInProcessResponse;
    }

    return '{}';
  }

  String iddleResponse = '''
    { "message": "No se ha ejecutado ningún requerimiento" }
  ''';

  String busyResponse = '''
      { "message": "Aun se está procesando el último requerimiento" }
    ''';

  String imagesInProcessResponse = '''
    { "message": "Hay imagenes en procesamiento" }
  ''';

  String successBasicResponse = '''
      {
        "levels": {
          "0": [
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_0.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_0.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            },
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_1.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_1.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            },
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_2.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_2.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            },
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_3.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_3.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            }
          ],
          "1": [
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_4.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_4.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            },
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_5.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_5.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            },
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_6.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_6.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            },
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_7.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_7.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            },
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_8.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_8.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            },
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_9.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_9.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            },
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_10.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_10.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            }
          ]
        },
        "levels_not_found": {
          "0": [
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_0.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_0.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            },
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_1.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_1.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            },
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_2.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_2.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            },
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_3.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_3.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            }
          ],
          "1": [
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_4.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_4.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            },
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_5.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_5.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            },
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_6.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_6.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            },
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_7.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_7.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            },
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_8.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_8.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            },
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_9.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_9.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            },
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_10.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_10.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            }
          ]
        },
        "levels_data": {
          "0": { "total_products": 4, "found_products": 4 },
          "1": { "total_products": 7, "found_products": 7 }
        },
        "referencia_gondola": [
          {
            "image_url": "/app/media/SKU_estandar/251676_0.webp",
            "description": "TRIM CORTAU.P/PIES+CORTAU",
            "sku": "251676"
          },
          {
            "image_url": "/app/media/SKU_estandar/261753_0.webp",
            "description": "TRIM CORTAUN.A/DESLI.PIES",
            "sku": "261753"
          },
          {
            "image_url": null,
            "description": "MAKE UP B.SACAPUNT.DOB.AQ",
            "sku": "287169"
          },
          {
            "image_url": null,
            "description": "KISS IMPRES.COLOR TRY G30",
            "sku": "394586"
          },
          {
            "image_url": "/app/media/SKU_estandar/394576_0.webp",
            "description": "KISS IMPRES.COLOR PETA.30",
            "sku": "394576"
          },
          {
            "image_url": "/app/media/SKU_estandar/394577_0.webp",
            "description": "KISS IMPRES.COLOR PEEV.30",
            "sku": "394577"
          },
          {
            "image_url": null,
            "description": "KISS IMPRES.COLOR REDD.30",
            "sku": "394606"
          },
          {
            "image_url": "/app/media/SKU_estandar/394585_0.webp",
            "description": "KISS IMPRES.COLOR NEV.T30",
            "sku": "394585"
          },
          {
            "image_url": "/app/media/SKU_estandar/180021_0.webp",
            "description": "S.NAT PET.DESMAQ.80",
            "sku": "180021"
          },
          {
            "image_url": "/app/media/SKU_estandar/394604_0.webp",
            "description": "KISS IMPRES.COLOR IM N.30",
            "sku": "394604"
          },
          {
            "image_url": null,
            "description": "SALLY H.QUITA ESM.STR.236",
            "sku": "270852"
          },
          {
            "image_url": null,
            "description": "MAKE UP B.BRO.ANGU.RUB.AA",
            "sku": "287152"
          },
          {
            "image_url": "/app/media/SKU_estandar/267918_0.webp",
            "description": "TRIM PINZA CEJA OBLICUA",
            "sku": "267918"
          },
          {
            "image_url": null,
            "description": "MAKE UP B.AP.SOM.OJ.10 AL",
            "sku": "287162"
          },
          {
            "image_url": "/app/media/SKU_estandar/273277_0.webp",
            "description": "TRIM ENCRESPA+PINZA 04125",
            "sku": "273277"
          },
          {
            "image_url": "/app/media/SKU_estandar/287164_0.webp",
            "description": "MAKE UP B.ENCR.PEST. AO",
            "sku": "287164"
          },
          {
            "image_url": "/app/media/SKU_estandar/287188_0.webp",
            "description": "ACCESS.BY.REMOV.CALLOS T",
            "sku": "287188"
          },
          {
            "image_url": "/app/media/SKU_estandar/394568_0.webp",
            "description": "KISS IMPRESS MINI ROSAD20",
            "sku": "394568"
          },
          {
            "image_url": "/app/media/SKU_estandar/394631_0.webp",
            "description": "KISS UNA.FRANC.NUD.ACRY28",
            "sku": "394631"
          },
          {
            "image_url": "/app/media/SKU_estandar/160084_0.webp",
            "description": "PONJITA ACQUA COLORES",
            "sku": "160084"
          },
          {
            "image_url": null,
            "description": "MAKE UP BROCHA APLIC.DOB.",
            "sku": "298524"
          },
          {
            "image_url": "/app/media/SKU_estandar/394558_0.webp",
            "description": "KISS PEG.UNA.PRECISION 3G",
            "sku": "394558"
          },
          {
            "image_url": "/app/media/SKU_estandar/103143_0.webp",
            "description": "S.NAT.QUITA ESM.HERB.110M",
            "sku": "103143"
          },
          {
            "image_url": null,
            "description": "MAKE UP B.SET MAQ.6PZ.AK",
            "sku": "287161"
          },
          {
            "image_url": "/app/media/SKU_estandar/394561_0.webp",
            "description": "KISS PEG.UNA.POWERFLEX 5G",
            "sku": "394561"
          },
          {
            "image_url": "/app/media/SKU_estandar/251677_0.webp",
            "description": "TRIM PINZA CEJA P/D+PINZA",
            "sku": "251677"
          },
          {
            "image_url": null,
            "description": "MAKE UP B.PINZA OBLIC.AG",
            "sku": "287158"
          },
          {
            "image_url": null,
            "description": "MAKE UP B.BRO.RETR.MAQ.AS",
            "sku": "287167"
          },
          {
            "image_url": "/app/media/SKU_estandar/298522_0.webp",
            "description": "MAKE UP SET ESPE.10X+PINZ",
            "sku": "298522"
          },
          {
            "image_url": "/app/media/SKU_estandar/287183_0.webp",
            "description": "ACCESS.BY.SET MANI.6PZ.N",
            "sku": "287183"
          },
          {
            "image_url": "/app/media/SKU_estandar/394573_0.webp",
            "description": "KISS UNA.FRANC.ACRYLIC.28",
            "sku": "394573"
          },
          {
            "image_url": null,
            "description": "MAKE UP B. BRO.BASE MAQ.Z",
            "sku": "287170"
          },
          {
            "image_url": "/app/media/SKU_estandar/394575_0.webp",
            "description": "KISS IMPRES.COLOR PRET.30",
            "sku": "394575"
          },
          {
            "image_url": "/app/media/SKU_estandar/180016_0.webp",
            "description": "S.NAT.COPO.ALGODON BX100",
            "sku": "180016"
          },
          {
            "image_url": "/app/media/SKU_estandar/259365_0.webp",
            "description": "S.NAT PET.DESMAQ. x80 x2",
            "sku": "259365"
          },
          {
            "image_url": "/app/media/SKU_estandar/293775_0.webp",
            "description": "IMAGI REM.ESM.UNAS AC.110",
            "sku": "293775"
          },
          {
            "image_url": null,
            "description": "MAKE UP B.BRO.SOMB.OJO.AC",
            "sku": "287154"
          },
          {
            "image_url": "/app/media/SKU_estandar/394694_0.webp",
            "description": "KISS QUIC.SOAK-OFF(10+20)",
            "sku": "394694"
          },
          {
            "image_url": "/app/media/SKU_estandar/262028_0.webp",
            "description": "TRIM LIMA P/SALONX2 09770",
            "sku": "262028"
          },
          {
            "image_url": null,
            "description": "MAKE UP B.SET MAQ.6PZ.AT",
            "sku": "287168"
          },
          {
            "image_url": "/app/media/SKU_estandar/287177_0.webp",
            "description": "ACCESS.BY.PIEDRA POMEZ H",
            "sku": "287177"
          },
          {
            "image_url": null,
            "description": "ACCESS.BY.LIMA PIES  S",
            "sku": "287187"
          },
          {
            "image_url": "/app/media/SKU_estandar/181004_0.webp",
            "description": "TRIM CORTAUNAS (P/PIES)",
            "sku": "181004"
          },
          {
            "image_url": "/app/media/SKU_estandar/394562_0.webp",
            "description": "KISS MED+TIJ+PEG+APL+PEST",
            "sku": "394562"
          },
          {
            "image_url": null,
            "description": "MAKE UP SET ESPEJO+PINZA",
            "sku": "298523"
          },
          {
            "image_url": "/app/media/SKU_estandar/394574_0.webp",
            "description": "KISS IMPRES.COLOR POIN.30",
            "sku": "394574"
          },
          {
            "image_url": "/app/media/SKU_estandar/277871_0.webp",
            "description": "TRIM ENCPES.BEAU.CARE X1",
            "sku": "277871"
          },
          {
            "image_url": "/app/media/SKU_estandar/181003_0.webp",
            "description": "TRIM CORTAUNAS CHICO",
            "sku": "181003"
          },
          {
            "image_url": "/app/media/SKU_estandar/261752_0.webp",
            "description": "TRIM CORTAUN.A/DESLI.MANO",
            "sku": "261752"
          },
          {
            "image_url": "/app/media/SKU_estandar/394582_0.webp",
            "description": "KISS IMPRES.COLOR SAND.30",
            "sku": "394582"
          },
          {
            "image_url": "/app/media/SKU_estandar/394605_0.webp",
            "description": "KISS IMPRES.COLOR ALL B30",
            "sku": "394605"
          },
          {
            "image_url": "/app/media/SKU_estandar/297828_0.webp",
            "description": "TANGLE TEEZE.CEP.C.STYLER",
            "sku": "297828"
          },
          {
            "image_url": "/app/media/SKU_estandar/394584_0.webp",
            "description": "KISS IMPRES.COLOR E.OUR30",
            "sku": "394584"
          },
          {
            "image_url": "/app/media/SKU_estandar/261871_0.webp",
            "description": "TRIM ENCRESP.PEST.A/DESLI",
            "sku": "261871"
          },
          {
            "image_url": null,
            "description": "S.NAT.QUIT.ESM.LIMON 110M",
            "sku": "293142"
          },
          {
            "image_url": "/app/media/SKU_estandar/297827_0.webp",
            "description": "TANGLE TEEZE.CEP.T.ORIGIN",
            "sku": "297827"
          },
          {
            "image_url": "/app/media/SKU_estandar/144301_0.webp",
            "description": "TRIM LIMA ESMERIL x10",
            "sku": "144301"
          },
          {
            "image_url": "/app/media/SKU_estandar/394587_0.webp",
            "description": "KISS IMPRES.COLOR TAUP.30",
            "sku": "394587"
          },
          {
            "image_url": null,
            "description": "BE SET MANICURE DISENO",
            "sku": "296180"
          },
          {
            "image_url": "/app/media/SKU_estandar/394566_0.webp",
            "description": "KISS EMP.CUTI.2N1 DOB.EXT",
            "sku": "394566"
          },
          {
            "image_url": "/app/media/SKU_estandar/394570_0.webp",
            "description": "KISS IMPRESS MINI CEREZ20",
            "sku": "394570"
          },
          {
            "image_url": "/app/media/SKU_estandar/287176_0.webp",
            "description": "ACCESS.BY.SET PEDI.6PZ.G",
            "sku": "287176"
          },
          {
            "image_url": null,
            "description": "S.NAT.Q/ESM.PUM.PR.LIM250",
            "sku": "277001"
          }
        ],
        "faltantes": [
          {
            "image_url": "/app/media/SKU_estandar/251676_0.webp",
            "description": "TRIM CORTAU.P/PIES+CORTAU",
            "sku": "251676"
          },
          {
            "image_url": "/app/media/SKU_estandar/261753_0.webp",
            "description": "TRIM CORTAUN.A/DESLI.PIES",
            "sku": "261753"
          },
          {
            "image_url": null,
            "description": "MAKE UP B.SACAPUNT.DOB.AQ",
            "sku": "287169"
          },
          {
            "image_url": null,
            "description": "KISS IMPRES.COLOR TRY G30",
            "sku": "394586"
          },
          {
            "image_url": "/app/media/SKU_estandar/394576_0.webp",
            "description": "KISS IMPRES.COLOR PETA.30",
            "sku": "394576"
          },
          {
            "image_url": "/app/media/SKU_estandar/394577_0.webp",
            "description": "KISS IMPRES.COLOR PEEV.30",
            "sku": "394577"
          },
          {
            "image_url": null,
            "description": "KISS IMPRES.COLOR REDD.30",
            "sku": "394606"
          },
          {
            "image_url": "/app/media/SKU_estandar/394585_0.webp",
            "description": "KISS IMPRES.COLOR NEV.T30",
            "sku": "394585"
          },
          {
            "image_url": "/app/media/SKU_estandar/180021_0.webp",
            "description": "S.NAT PET.DESMAQ.80",
            "sku": "180021"
          },
          {
            "image_url": "/app/media/SKU_estandar/394604_0.webp",
            "description": "KISS IMPRES.COLOR IM N.30",
            "sku": "394604"
          },
          {
            "image_url": null,
            "description": "SALLY H.QUITA ESM.STR.236",
            "sku": "270852"
          },
          {
            "image_url": null,
            "description": "MAKE UP B.BRO.ANGU.RUB.AA",
            "sku": "287152"
          },
          {
            "image_url": "/app/media/SKU_estandar/267918_0.webp",
            "description": "TRIM PINZA CEJA OBLICUA",
            "sku": "267918"
          },
          {
            "image_url": null,
            "description": "MAKE UP B.AP.SOM.OJ.10 AL",
            "sku": "287162"
          },
          {
            "image_url": "/app/media/SKU_estandar/273277_0.webp",
            "description": "TRIM ENCRESPA+PINZA 04125",
            "sku": "273277"
          },
          {
            "image_url": "/app/media/SKU_estandar/287164_0.webp",
            "description": "MAKE UP B.ENCR.PEST. AO",
            "sku": "287164"
          },
          {
            "image_url": "/app/media/SKU_estandar/287188_0.webp",
            "description": "ACCESS.BY.REMOV.CALLOS T",
            "sku": "287188"
          },
          {
            "image_url": "/app/media/SKU_estandar/394568_0.webp",
            "description": "KISS IMPRESS MINI ROSAD20",
            "sku": "394568"
          },
          {
            "image_url": "/app/media/SKU_estandar/394631_0.webp",
            "description": "KISS UNA.FRANC.NUD.ACRY28",
            "sku": "394631"
          },
          {
            "image_url": "/app/media/SKU_estandar/160084_0.webp",
            "description": "PONJITA ACQUA COLORES",
            "sku": "160084"
          },
          {
            "image_url": null,
            "description": "MAKE UP BROCHA APLIC.DOB.",
            "sku": "298524"
          },
          {
            "image_url": "/app/media/SKU_estandar/394558_0.webp",
            "description": "KISS PEG.UNA.PRECISION 3G",
            "sku": "394558"
          },
          {
            "image_url": "/app/media/SKU_estandar/103143_0.webp",
            "description": "S.NAT.QUITA ESM.HERB.110M",
            "sku": "103143"
          },
          {
            "image_url": null,
            "description": "MAKE UP B.SET MAQ.6PZ.AK",
            "sku": "287161"
          },
          {
            "image_url": "/app/media/SKU_estandar/394561_0.webp",
            "description": "KISS PEG.UNA.POWERFLEX 5G",
            "sku": "394561"
          },
          {
            "image_url": "/app/media/SKU_estandar/251677_0.webp",
            "description": "TRIM PINZA CEJA P/D+PINZA",
            "sku": "251677"
          },
          {
            "image_url": null,
            "description": "MAKE UP B.PINZA OBLIC.AG",
            "sku": "287158"
          },
          {
            "image_url": null,
            "description": "MAKE UP B.BRO.RETR.MAQ.AS",
            "sku": "287167"
          },
          {
            "image_url": "/app/media/SKU_estandar/298522_0.webp",
            "description": "MAKE UP SET ESPE.10X+PINZ",
            "sku": "298522"
          },
          {
            "image_url": "/app/media/SKU_estandar/287183_0.webp",
            "description": "ACCESS.BY.SET MANI.6PZ.N",
            "sku": "287183"
          },
          {
            "image_url": "/app/media/SKU_estandar/394573_0.webp",
            "description": "KISS UNA.FRANC.ACRYLIC.28",
            "sku": "394573"
          },
          {
            "image_url": null,
            "description": "MAKE UP B. BRO.BASE MAQ.Z",
            "sku": "287170"
          },
          {
            "image_url": "/app/media/SKU_estandar/394575_0.webp",
            "description": "KISS IMPRES.COLOR PRET.30",
            "sku": "394575"
          },
          {
            "image_url": "/app/media/SKU_estandar/180016_0.webp",
            "description": "S.NAT.COPO.ALGODON BX100",
            "sku": "180016"
          },
          {
            "image_url": "/app/media/SKU_estandar/259365_0.webp",
            "description": "S.NAT PET.DESMAQ. x80 x2",
            "sku": "259365"
          },
          {
            "image_url": "/app/media/SKU_estandar/293775_0.webp",
            "description": "IMAGI REM.ESM.UNAS AC.110",
            "sku": "293775"
          },
          {
            "image_url": null,
            "description": "MAKE UP B.BRO.SOMB.OJO.AC",
            "sku": "287154"
          },
          {
            "image_url": "/app/media/SKU_estandar/394694_0.webp",
            "description": "KISS QUIC.SOAK-OFF(10+20)",
            "sku": "394694"
          },
          {
            "image_url": "/app/media/SKU_estandar/262028_0.webp",
            "description": "TRIM LIMA P/SALONX2 09770",
            "sku": "262028"
          },
          {
            "image_url": null,
            "description": "MAKE UP B.SET MAQ.6PZ.AT",
            "sku": "287168"
          },
          {
            "image_url": "/app/media/SKU_estandar/287177_0.webp",
            "description": "ACCESS.BY.PIEDRA POMEZ H",
            "sku": "287177"
          },
          {
            "image_url": null,
            "description": "ACCESS.BY.LIMA PIES  S",
            "sku": "287187"
          },
          {
            "image_url": "/app/media/SKU_estandar/181004_0.webp",
            "description": "TRIM CORTAUNAS (P/PIES)",
            "sku": "181004"
          },
          {
            "image_url": "/app/media/SKU_estandar/394562_0.webp",
            "description": "KISS MED+TIJ+PEG+APL+PEST",
            "sku": "394562"
          },
          {
            "image_url": null,
            "description": "MAKE UP SET ESPEJO+PINZA",
            "sku": "298523"
          },
          {
            "image_url": "/app/media/SKU_estandar/394574_0.webp",
            "description": "KISS IMPRES.COLOR POIN.30",
            "sku": "394574"
          },
          {
            "image_url": "/app/media/SKU_estandar/277871_0.webp",
            "description": "TRIM ENCPES.BEAU.CARE X1",
            "sku": "277871"
          },
          {
            "image_url": "/app/media/SKU_estandar/181003_0.webp",
            "description": "TRIM CORTAUNAS CHICO",
            "sku": "181003"
          },
          {
            "image_url": "/app/media/SKU_estandar/261752_0.webp",
            "description": "TRIM CORTAUN.A/DESLI.MANO",
            "sku": "261752"
          },
          {
            "image_url": "/app/media/SKU_estandar/394582_0.webp",
            "description": "KISS IMPRES.COLOR SAND.30",
            "sku": "394582"
          },
          {
            "image_url": "/app/media/SKU_estandar/394605_0.webp",
            "description": "KISS IMPRES.COLOR ALL B30",
            "sku": "394605"
          },
          {
            "image_url": "/app/media/SKU_estandar/297828_0.webp",
            "description": "TANGLE TEEZE.CEP.C.STYLER",
            "sku": "297828"
          },
          {
            "image_url": "/app/media/SKU_estandar/394584_0.webp",
            "description": "KISS IMPRES.COLOR E.OUR30",
            "sku": "394584"
          },
          {
            "image_url": "/app/media/SKU_estandar/261871_0.webp",
            "description": "TRIM ENCRESP.PEST.A/DESLI",
            "sku": "261871"
          },
          {
            "image_url": null,
            "description": "S.NAT.QUIT.ESM.LIMON 110M",
            "sku": "293142"
          },
          {
            "image_url": "/app/media/SKU_estandar/297827_0.webp",
            "description": "TANGLE TEEZE.CEP.T.ORIGIN",
            "sku": "297827"
          },
          {
            "image_url": "/app/media/SKU_estandar/144301_0.webp",
            "description": "TRIM LIMA ESMERIL x10",
            "sku": "144301"
          },
          {
            "image_url": "/app/media/SKU_estandar/394587_0.webp",
            "description": "KISS IMPRES.COLOR TAUP.30",
            "sku": "394587"
          },
          {
            "image_url": null,
            "description": "BE SET MANICURE DISENO",
            "sku": "296180"
          },
          {
            "image_url": "/app/media/SKU_estandar/394566_0.webp",
            "description": "KISS EMP.CUTI.2N1 DOB.EXT",
            "sku": "394566"
          },
          {
            "image_url": "/app/media/SKU_estandar/394570_0.webp",
            "description": "KISS IMPRESS MINI CEREZ20",
            "sku": "394570"
          },
          {
            "image_url": "/app/media/SKU_estandar/287176_0.webp",
            "description": "ACCESS.BY.SET PEDI.6PZ.G",
            "sku": "287176"
          },
          {
            "image_url": null,
            "description": "S.NAT.Q/ESM.PUM.PR.LIM250",
            "sku": "277001"
          }
        ],
        "skus_found": [
          "000000",
          "000000",
          "000000",
          "000000",
          "000000",
          "000000",
          "000000",
          "000000",
          "000000",
          "000000",
          "000000"
        ],
        "dict_prod_gondola": {
          "103143": 2,
          "144301": 1,
          "160084": 1,
          "180016": 1,
          "180021": 1,
          "181003": 1,
          "181004": 1,
          "251676": 1,
          "251677": 1,
          "259365": 1,
          "261752": 1,
          "261753": 1,
          "261871": 1,
          "262028": 1,
          "267918": 1,
          "270852": 1,
          "273277": 1,
          "277001": 1,
          "277871": 1,
          "287152": 1,
          "287154": 1,
          "287158": 1,
          "287161": 1,
          "287162": 1,
          "287164": 1,
          "287167": 1,
          "287168": 1,
          "287169": 1,
          "287170": 1,
          "287176": 1,
          "287177": 1,
          "287183": 1,
          "287187": 1,
          "287188": 1,
          "293142": 2,
          "293775": 1,
          "296180": 1,
          "297827": 1,
          "297828": 1,
          "298522": 1,
          "298523": 1,
          "298524": 1,
          "394558": 1,
          "394561": 1,
          "394562": 1,
          "394566": 1,
          "394568": 1,
          "394570": 1,
          "394573": 1,
          "394574": 1,
          "394575": 1,
          "394576": 1,
          "394577": 1,
          "394582": 1,
          "394584": 1,
          "394585": 1,
          "394586": 1,
          "394587": 1,
          "394604": 1,
          "394605": 1,
          "394606": 1,
          "394631": 1,
          "394694": 1
        },
        "local": "FCV0003",
        "gondola": "ACCESORIOS BELLEZA.MRC-A",
        "intento": "0",
        "carpeta": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1",
        "savepath": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1",
        "OSA": 0.0,
        "prod_gondola": 65,
        "prod_found": 11,
        "img_names": ["0_15-5-17"]
    }
    ''';

  String successDevResponse = '''
      {
        "levels": {
          "0": [
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_0.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_0.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            },
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_1.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_1.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            },
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_2.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_2.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            },
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_3.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_3.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            }
          ],
          "1": [
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_4.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_4.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            },
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_5.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_5.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            },
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_6.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_6.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            },
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_7.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_7.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            },
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_8.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_8.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            },
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_9.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_9.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            },
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_10.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_10.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            }
          ]
        },
        "levels_not_found": {
          "0": [
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_0.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_0.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            },
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_1.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_1.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            },
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_2.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_2.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            },
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_3.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_3.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            }
          ],
          "1": [
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_4.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_4.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            },
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_5.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_5.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            },
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_6.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_6.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            },
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_7.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_7.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            },
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_8.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_8.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            },
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_9.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_9.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            },
            {
              "image_url": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found_small/000000_10.webp",
              "image_url_original": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1/out_process/imagenes/not_found/000000_10.webp",
              "description": "SKU sin descripcion",
              "sku": "000000"
            }
          ]
        },
        "levels_data": {
          "0": { "total_products": 4, "found_products": 4 },
          "1": { "total_products": 7, "found_products": 7 }
        },
        "referencia_gondola": [
          {
            "image_url": "/app/media/SKU_estandar/251676_0.webp",
            "description": "TRIM CORTAU.P/PIES+CORTAU",
            "sku": "251676"
          },
          {
            "image_url": "/app/media/SKU_estandar/261753_0.webp",
            "description": "TRIM CORTAUN.A/DESLI.PIES",
            "sku": "261753"
          },
          {
            "image_url": null,
            "description": "MAKE UP B.SACAPUNT.DOB.AQ",
            "sku": "287169"
          },
          {
            "image_url": null,
            "description": "KISS IMPRES.COLOR TRY G30",
            "sku": "394586"
          },
          {
            "image_url": "/app/media/SKU_estandar/394576_0.webp",
            "description": "KISS IMPRES.COLOR PETA.30",
            "sku": "394576"
          },
          {
            "image_url": "/app/media/SKU_estandar/394577_0.webp",
            "description": "KISS IMPRES.COLOR PEEV.30",
            "sku": "394577"
          },
          {
            "image_url": null,
            "description": "KISS IMPRES.COLOR REDD.30",
            "sku": "394606"
          },
          {
            "image_url": "/app/media/SKU_estandar/394585_0.webp",
            "description": "KISS IMPRES.COLOR NEV.T30",
            "sku": "394585"
          },
          {
            "image_url": "/app/media/SKU_estandar/180021_0.webp",
            "description": "S.NAT PET.DESMAQ.80",
            "sku": "180021"
          },
          {
            "image_url": "/app/media/SKU_estandar/394604_0.webp",
            "description": "KISS IMPRES.COLOR IM N.30",
            "sku": "394604"
          },
          {
            "image_url": null,
            "description": "SALLY H.QUITA ESM.STR.236",
            "sku": "270852"
          },
          {
            "image_url": null,
            "description": "MAKE UP B.BRO.ANGU.RUB.AA",
            "sku": "287152"
          },
          {
            "image_url": "/app/media/SKU_estandar/267918_0.webp",
            "description": "TRIM PINZA CEJA OBLICUA",
            "sku": "267918"
          },
          {
            "image_url": null,
            "description": "MAKE UP B.AP.SOM.OJ.10 AL",
            "sku": "287162"
          },
          {
            "image_url": "/app/media/SKU_estandar/273277_0.webp",
            "description": "TRIM ENCRESPA+PINZA 04125",
            "sku": "273277"
          },
          {
            "image_url": "/app/media/SKU_estandar/287164_0.webp",
            "description": "MAKE UP B.ENCR.PEST. AO",
            "sku": "287164"
          },
          {
            "image_url": "/app/media/SKU_estandar/287188_0.webp",
            "description": "ACCESS.BY.REMOV.CALLOS T",
            "sku": "287188"
          },
          {
            "image_url": "/app/media/SKU_estandar/394568_0.webp",
            "description": "KISS IMPRESS MINI ROSAD20",
            "sku": "394568"
          },
          {
            "image_url": "/app/media/SKU_estandar/394631_0.webp",
            "description": "KISS UNA.FRANC.NUD.ACRY28",
            "sku": "394631"
          },
          {
            "image_url": "/app/media/SKU_estandar/160084_0.webp",
            "description": "PONJITA ACQUA COLORES",
            "sku": "160084"
          },
          {
            "image_url": null,
            "description": "MAKE UP BROCHA APLIC.DOB.",
            "sku": "298524"
          },
          {
            "image_url": "/app/media/SKU_estandar/394558_0.webp",
            "description": "KISS PEG.UNA.PRECISION 3G",
            "sku": "394558"
          },
          {
            "image_url": "/app/media/SKU_estandar/103143_0.webp",
            "description": "S.NAT.QUITA ESM.HERB.110M",
            "sku": "103143"
          },
          {
            "image_url": null,
            "description": "MAKE UP B.SET MAQ.6PZ.AK",
            "sku": "287161"
          },
          {
            "image_url": "/app/media/SKU_estandar/394561_0.webp",
            "description": "KISS PEG.UNA.POWERFLEX 5G",
            "sku": "394561"
          },
          {
            "image_url": "/app/media/SKU_estandar/251677_0.webp",
            "description": "TRIM PINZA CEJA P/D+PINZA",
            "sku": "251677"
          },
          {
            "image_url": null,
            "description": "MAKE UP B.PINZA OBLIC.AG",
            "sku": "287158"
          },
          {
            "image_url": null,
            "description": "MAKE UP B.BRO.RETR.MAQ.AS",
            "sku": "287167"
          },
          {
            "image_url": "/app/media/SKU_estandar/298522_0.webp",
            "description": "MAKE UP SET ESPE.10X+PINZ",
            "sku": "298522"
          },
          {
            "image_url": "/app/media/SKU_estandar/287183_0.webp",
            "description": "ACCESS.BY.SET MANI.6PZ.N",
            "sku": "287183"
          },
          {
            "image_url": "/app/media/SKU_estandar/394573_0.webp",
            "description": "KISS UNA.FRANC.ACRYLIC.28",
            "sku": "394573"
          },
          {
            "image_url": null,
            "description": "MAKE UP B. BRO.BASE MAQ.Z",
            "sku": "287170"
          },
          {
            "image_url": "/app/media/SKU_estandar/394575_0.webp",
            "description": "KISS IMPRES.COLOR PRET.30",
            "sku": "394575"
          },
          {
            "image_url": "/app/media/SKU_estandar/180016_0.webp",
            "description": "S.NAT.COPO.ALGODON BX100",
            "sku": "180016"
          },
          {
            "image_url": "/app/media/SKU_estandar/259365_0.webp",
            "description": "S.NAT PET.DESMAQ. x80 x2",
            "sku": "259365"
          },
          {
            "image_url": "/app/media/SKU_estandar/293775_0.webp",
            "description": "IMAGI REM.ESM.UNAS AC.110",
            "sku": "293775"
          },
          {
            "image_url": null,
            "description": "MAKE UP B.BRO.SOMB.OJO.AC",
            "sku": "287154"
          },
          {
            "image_url": "/app/media/SKU_estandar/394694_0.webp",
            "description": "KISS QUIC.SOAK-OFF(10+20)",
            "sku": "394694"
          },
          {
            "image_url": "/app/media/SKU_estandar/262028_0.webp",
            "description": "TRIM LIMA P/SALONX2 09770",
            "sku": "262028"
          },
          {
            "image_url": null,
            "description": "MAKE UP B.SET MAQ.6PZ.AT",
            "sku": "287168"
          },
          {
            "image_url": "/app/media/SKU_estandar/287177_0.webp",
            "description": "ACCESS.BY.PIEDRA POMEZ H",
            "sku": "287177"
          },
          {
            "image_url": null,
            "description": "ACCESS.BY.LIMA PIES  S",
            "sku": "287187"
          },
          {
            "image_url": "/app/media/SKU_estandar/181004_0.webp",
            "description": "TRIM CORTAUNAS (P/PIES)",
            "sku": "181004"
          },
          {
            "image_url": "/app/media/SKU_estandar/394562_0.webp",
            "description": "KISS MED+TIJ+PEG+APL+PEST",
            "sku": "394562"
          },
          {
            "image_url": null,
            "description": "MAKE UP SET ESPEJO+PINZA",
            "sku": "298523"
          },
          {
            "image_url": "/app/media/SKU_estandar/394574_0.webp",
            "description": "KISS IMPRES.COLOR POIN.30",
            "sku": "394574"
          },
          {
            "image_url": "/app/media/SKU_estandar/277871_0.webp",
            "description": "TRIM ENCPES.BEAU.CARE X1",
            "sku": "277871"
          },
          {
            "image_url": "/app/media/SKU_estandar/181003_0.webp",
            "description": "TRIM CORTAUNAS CHICO",
            "sku": "181003"
          },
          {
            "image_url": "/app/media/SKU_estandar/261752_0.webp",
            "description": "TRIM CORTAUN.A/DESLI.MANO",
            "sku": "261752"
          },
          {
            "image_url": "/app/media/SKU_estandar/394582_0.webp",
            "description": "KISS IMPRES.COLOR SAND.30",
            "sku": "394582"
          },
          {
            "image_url": "/app/media/SKU_estandar/394605_0.webp",
            "description": "KISS IMPRES.COLOR ALL B30",
            "sku": "394605"
          },
          {
            "image_url": "/app/media/SKU_estandar/297828_0.webp",
            "description": "TANGLE TEEZE.CEP.C.STYLER",
            "sku": "297828"
          },
          {
            "image_url": "/app/media/SKU_estandar/394584_0.webp",
            "description": "KISS IMPRES.COLOR E.OUR30",
            "sku": "394584"
          },
          {
            "image_url": "/app/media/SKU_estandar/261871_0.webp",
            "description": "TRIM ENCRESP.PEST.A/DESLI",
            "sku": "261871"
          },
          {
            "image_url": null,
            "description": "S.NAT.QUIT.ESM.LIMON 110M",
            "sku": "293142"
          },
          {
            "image_url": "/app/media/SKU_estandar/297827_0.webp",
            "description": "TANGLE TEEZE.CEP.T.ORIGIN",
            "sku": "297827"
          },
          {
            "image_url": "/app/media/SKU_estandar/144301_0.webp",
            "description": "TRIM LIMA ESMERIL x10",
            "sku": "144301"
          },
          {
            "image_url": "/app/media/SKU_estandar/394587_0.webp",
            "description": "KISS IMPRES.COLOR TAUP.30",
            "sku": "394587"
          },
          {
            "image_url": null,
            "description": "BE SET MANICURE DISENO",
            "sku": "296180"
          },
          {
            "image_url": "/app/media/SKU_estandar/394566_0.webp",
            "description": "KISS EMP.CUTI.2N1 DOB.EXT",
            "sku": "394566"
          },
          {
            "image_url": "/app/media/SKU_estandar/394570_0.webp",
            "description": "KISS IMPRESS MINI CEREZ20",
            "sku": "394570"
          },
          {
            "image_url": "/app/media/SKU_estandar/287176_0.webp",
            "description": "ACCESS.BY.SET PEDI.6PZ.G",
            "sku": "287176"
          },
          {
            "image_url": null,
            "description": "S.NAT.Q/ESM.PUM.PR.LIM250",
            "sku": "277001"
          }
        ],
        "faltantes": [
          {
            "image_url": "/app/media/SKU_estandar/251676_0.webp",
            "description": "TRIM CORTAU.P/PIES+CORTAU",
            "sku": "251676"
          },
          {
            "image_url": "/app/media/SKU_estandar/261753_0.webp",
            "description": "TRIM CORTAUN.A/DESLI.PIES",
            "sku": "261753"
          },
          {
            "image_url": null,
            "description": "MAKE UP B.SACAPUNT.DOB.AQ",
            "sku": "287169"
          },
          {
            "image_url": null,
            "description": "KISS IMPRES.COLOR TRY G30",
            "sku": "394586"
          },
          {
            "image_url": "/app/media/SKU_estandar/394576_0.webp",
            "description": "KISS IMPRES.COLOR PETA.30",
            "sku": "394576"
          },
          {
            "image_url": "/app/media/SKU_estandar/394577_0.webp",
            "description": "KISS IMPRES.COLOR PEEV.30",
            "sku": "394577"
          },
          {
            "image_url": null,
            "description": "KISS IMPRES.COLOR REDD.30",
            "sku": "394606"
          },
          {
            "image_url": "/app/media/SKU_estandar/394585_0.webp",
            "description": "KISS IMPRES.COLOR NEV.T30",
            "sku": "394585"
          },
          {
            "image_url": "/app/media/SKU_estandar/180021_0.webp",
            "description": "S.NAT PET.DESMAQ.80",
            "sku": "180021"
          },
          {
            "image_url": "/app/media/SKU_estandar/394604_0.webp",
            "description": "KISS IMPRES.COLOR IM N.30",
            "sku": "394604"
          },
          {
            "image_url": null,
            "description": "SALLY H.QUITA ESM.STR.236",
            "sku": "270852"
          },
          {
            "image_url": null,
            "description": "MAKE UP B.BRO.ANGU.RUB.AA",
            "sku": "287152"
          },
          {
            "image_url": "/app/media/SKU_estandar/267918_0.webp",
            "description": "TRIM PINZA CEJA OBLICUA",
            "sku": "267918"
          },
          {
            "image_url": null,
            "description": "MAKE UP B.AP.SOM.OJ.10 AL",
            "sku": "287162"
          },
          {
            "image_url": "/app/media/SKU_estandar/273277_0.webp",
            "description": "TRIM ENCRESPA+PINZA 04125",
            "sku": "273277"
          },
          {
            "image_url": "/app/media/SKU_estandar/287164_0.webp",
            "description": "MAKE UP B.ENCR.PEST. AO",
            "sku": "287164"
          },
          {
            "image_url": "/app/media/SKU_estandar/287188_0.webp",
            "description": "ACCESS.BY.REMOV.CALLOS T",
            "sku": "287188"
          },
          {
            "image_url": "/app/media/SKU_estandar/394568_0.webp",
            "description": "KISS IMPRESS MINI ROSAD20",
            "sku": "394568"
          },
          {
            "image_url": "/app/media/SKU_estandar/394631_0.webp",
            "description": "KISS UNA.FRANC.NUD.ACRY28",
            "sku": "394631"
          },
          {
            "image_url": "/app/media/SKU_estandar/160084_0.webp",
            "description": "PONJITA ACQUA COLORES",
            "sku": "160084"
          },
          {
            "image_url": null,
            "description": "MAKE UP BROCHA APLIC.DOB.",
            "sku": "298524"
          },
          {
            "image_url": "/app/media/SKU_estandar/394558_0.webp",
            "description": "KISS PEG.UNA.PRECISION 3G",
            "sku": "394558"
          },
          {
            "image_url": "/app/media/SKU_estandar/103143_0.webp",
            "description": "S.NAT.QUITA ESM.HERB.110M",
            "sku": "103143"
          },
          {
            "image_url": null,
            "description": "MAKE UP B.SET MAQ.6PZ.AK",
            "sku": "287161"
          },
          {
            "image_url": "/app/media/SKU_estandar/394561_0.webp",
            "description": "KISS PEG.UNA.POWERFLEX 5G",
            "sku": "394561"
          },
          {
            "image_url": "/app/media/SKU_estandar/251677_0.webp",
            "description": "TRIM PINZA CEJA P/D+PINZA",
            "sku": "251677"
          },
          {
            "image_url": null,
            "description": "MAKE UP B.PINZA OBLIC.AG",
            "sku": "287158"
          },
          {
            "image_url": null,
            "description": "MAKE UP B.BRO.RETR.MAQ.AS",
            "sku": "287167"
          },
          {
            "image_url": "/app/media/SKU_estandar/298522_0.webp",
            "description": "MAKE UP SET ESPE.10X+PINZ",
            "sku": "298522"
          },
          {
            "image_url": "/app/media/SKU_estandar/287183_0.webp",
            "description": "ACCESS.BY.SET MANI.6PZ.N",
            "sku": "287183"
          },
          {
            "image_url": "/app/media/SKU_estandar/394573_0.webp",
            "description": "KISS UNA.FRANC.ACRYLIC.28",
            "sku": "394573"
          },
          {
            "image_url": null,
            "description": "MAKE UP B. BRO.BASE MAQ.Z",
            "sku": "287170"
          },
          {
            "image_url": "/app/media/SKU_estandar/394575_0.webp",
            "description": "KISS IMPRES.COLOR PRET.30",
            "sku": "394575"
          },
          {
            "image_url": "/app/media/SKU_estandar/180016_0.webp",
            "description": "S.NAT.COPO.ALGODON BX100",
            "sku": "180016"
          },
          {
            "image_url": "/app/media/SKU_estandar/259365_0.webp",
            "description": "S.NAT PET.DESMAQ. x80 x2",
            "sku": "259365"
          },
          {
            "image_url": "/app/media/SKU_estandar/293775_0.webp",
            "description": "IMAGI REM.ESM.UNAS AC.110",
            "sku": "293775"
          },
          {
            "image_url": null,
            "description": "MAKE UP B.BRO.SOMB.OJO.AC",
            "sku": "287154"
          },
          {
            "image_url": "/app/media/SKU_estandar/394694_0.webp",
            "description": "KISS QUIC.SOAK-OFF(10+20)",
            "sku": "394694"
          },
          {
            "image_url": "/app/media/SKU_estandar/262028_0.webp",
            "description": "TRIM LIMA P/SALONX2 09770",
            "sku": "262028"
          },
          {
            "image_url": null,
            "description": "MAKE UP B.SET MAQ.6PZ.AT",
            "sku": "287168"
          },
          {
            "image_url": "/app/media/SKU_estandar/287177_0.webp",
            "description": "ACCESS.BY.PIEDRA POMEZ H",
            "sku": "287177"
          },
          {
            "image_url": null,
            "description": "ACCESS.BY.LIMA PIES  S",
            "sku": "287187"
          },
          {
            "image_url": "/app/media/SKU_estandar/181004_0.webp",
            "description": "TRIM CORTAUNAS (P/PIES)",
            "sku": "181004"
          },
          {
            "image_url": "/app/media/SKU_estandar/394562_0.webp",
            "description": "KISS MED+TIJ+PEG+APL+PEST",
            "sku": "394562"
          },
          {
            "image_url": null,
            "description": "MAKE UP SET ESPEJO+PINZA",
            "sku": "298523"
          },
          {
            "image_url": "/app/media/SKU_estandar/394574_0.webp",
            "description": "KISS IMPRES.COLOR POIN.30",
            "sku": "394574"
          },
          {
            "image_url": "/app/media/SKU_estandar/277871_0.webp",
            "description": "TRIM ENCPES.BEAU.CARE X1",
            "sku": "277871"
          },
          {
            "image_url": "/app/media/SKU_estandar/181003_0.webp",
            "description": "TRIM CORTAUNAS CHICO",
            "sku": "181003"
          },
          {
            "image_url": "/app/media/SKU_estandar/261752_0.webp",
            "description": "TRIM CORTAUN.A/DESLI.MANO",
            "sku": "261752"
          },
          {
            "image_url": "/app/media/SKU_estandar/394582_0.webp",
            "description": "KISS IMPRES.COLOR SAND.30",
            "sku": "394582"
          },
          {
            "image_url": "/app/media/SKU_estandar/394605_0.webp",
            "description": "KISS IMPRES.COLOR ALL B30",
            "sku": "394605"
          },
          {
            "image_url": "/app/media/SKU_estandar/297828_0.webp",
            "description": "TANGLE TEEZE.CEP.C.STYLER",
            "sku": "297828"
          },
          {
            "image_url": "/app/media/SKU_estandar/394584_0.webp",
            "description": "KISS IMPRES.COLOR E.OUR30",
            "sku": "394584"
          },
          {
            "image_url": "/app/media/SKU_estandar/261871_0.webp",
            "description": "TRIM ENCRESP.PEST.A/DESLI",
            "sku": "261871"
          },
          {
            "image_url": null,
            "description": "S.NAT.QUIT.ESM.LIMON 110M",
            "sku": "293142"
          },
          {
            "image_url": "/app/media/SKU_estandar/297827_0.webp",
            "description": "TANGLE TEEZE.CEP.T.ORIGIN",
            "sku": "297827"
          },
          {
            "image_url": "/app/media/SKU_estandar/144301_0.webp",
            "description": "TRIM LIMA ESMERIL x10",
            "sku": "144301"
          },
          {
            "image_url": "/app/media/SKU_estandar/394587_0.webp",
            "description": "KISS IMPRES.COLOR TAUP.30",
            "sku": "394587"
          },
          {
            "image_url": null,
            "description": "BE SET MANICURE DISENO",
            "sku": "296180"
          },
          {
            "image_url": "/app/media/SKU_estandar/394566_0.webp",
            "description": "KISS EMP.CUTI.2N1 DOB.EXT",
            "sku": "394566"
          },
          {
            "image_url": "/app/media/SKU_estandar/394570_0.webp",
            "description": "KISS IMPRESS MINI CEREZ20",
            "sku": "394570"
          },
          {
            "image_url": "/app/media/SKU_estandar/287176_0.webp",
            "description": "ACCESS.BY.SET PEDI.6PZ.G",
            "sku": "287176"
          },
          {
            "image_url": null,
            "description": "S.NAT.Q/ESM.PUM.PR.LIM250",
            "sku": "277001"
          }
        ],
        "skus_found": [
          "000000",
          "000000",
          "000000",
          "000000",
          "000000",
          "000000",
          "000000",
          "000000",
          "000000",
          "000000",
          "000000"
        ],
        "dict_prod_gondola": {
          "103143": 2,
          "144301": 1,
          "160084": 1,
          "180016": 1,
          "180021": 1,
          "181003": 1,
          "181004": 1,
          "251676": 1,
          "251677": 1,
          "259365": 1,
          "261752": 1,
          "261753": 1,
          "261871": 1,
          "262028": 1,
          "267918": 1,
          "270852": 1,
          "273277": 1,
          "277001": 1,
          "277871": 1,
          "287152": 1,
          "287154": 1,
          "287158": 1,
          "287161": 1,
          "287162": 1,
          "287164": 1,
          "287167": 1,
          "287168": 1,
          "287169": 1,
          "287170": 1,
          "287176": 1,
          "287177": 1,
          "287183": 1,
          "287187": 1,
          "287188": 1,
          "293142": 2,
          "293775": 1,
          "296180": 1,
          "297827": 1,
          "297828": 1,
          "298522": 1,
          "298523": 1,
          "298524": 1,
          "394558": 1,
          "394561": 1,
          "394562": 1,
          "394566": 1,
          "394568": 1,
          "394570": 1,
          "394573": 1,
          "394574": 1,
          "394575": 1,
          "394576": 1,
          "394577": 1,
          "394582": 1,
          "394584": 1,
          "394585": 1,
          "394586": 1,
          "394587": 1,
          "394604": 1,
          "394605": 1,
          "394606": 1,
          "394631": 1,
          "394694": 1
        },
        "local": "FCV0003",
        "gondola": "ACCESORIOS BELLEZA.MRC-A",
        "intento": "0",
        "carpeta": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1",
        "savepath": "/app/media/2022/4/21/store_FCV0003/gondola_ACCESORIOS BELLEZA.MRC-A/processed/1",
        "OSA": 0.0,
        "prod_gondola": 65,
        "prod_found": 11,
        "img_names": ["0_15-5-17"]
    }
    ''';
}
