class Results {
  Map<String, dynamic> esquema = {
    "type": "object",
    "properties": {
      "idPais": {
        "type": "string",
        "required": true,
        "label": "Pais",
        "dynamicListValue": {
          "coleccion": "pais",
          "campoVisualizacion": ["nombre", "apellido"],
          "valoresDeFiltrado": {"A": "Activo", "B": "Bloqueado"}
        },
      },
      "descripcion": {
        "type": "string",
        "required": true,
        "label": "Descripcion",
      },
      "latitud": {
        "type": "string",
        "required": false,
      },
      "longitud": {
        "type": "string",
        "required": false,
      },
      "codigoAfip": {
        "type": "number",
        "required": true,
        "label": "Codigo Afip",
      },
      "creadoEl": {
        "type": "string",
        "required": false,
        "label": "Fecha modificacion",
      }
    },
    "required": true
  };

  List<Map<String, dynamic>> generateData(int count) {
    List<Map<String, dynamic>> baseData = [
      {
        "idPais": "ARG",
        "descripcion": "Argentina",
        "latitud": "-34.6037",
        "longitud": "-58.3816",
        "codigoAfip": 12345,
        "creadoEl": "2024-06-22"
      },
      {
        "idPais": "BRA",
        "descripcion": "Brasil",
        "latitud": "-15.8267",
        "longitud": "-47.9218",
        "codigoAfip": 67890,
        "creadoEl": "2024-07-22"
      },
      {
        "idPais": "PRY",
        "descripcion": "Paraguay",
        "latitud": "-15.8263",
        "longitud": "-47.9222",
        "codigoAfip": 64158,
        "creadoEl": "2024-08-22"
      }
    ];

    List<Map<String, dynamic>> largeData = [];
    for (int i = 0; i < count; i++) {
      var record = baseData[i % baseData.length];
      largeData.add({
        "idPais": record["idPais"],
        "descripcion": record["descripcion"],
        "latitud": record["latitud"],
        "longitud": record["longitud"],
        "codigoAfip": record["codigoAfip"] + i,
        "creadoEl": record["creadoEl"]
      });
    }
    return largeData;
  }
}
