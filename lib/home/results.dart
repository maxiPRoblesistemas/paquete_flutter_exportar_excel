class Results {
  Map<String, dynamic> esquema = {
    "type": "object",
    "properties": {
      "idCiudadano": {
        "type": "string",
        "required": true,
        "label": "Ciudadano",
        "dynamicListValue": {
          "coleccion": "pais",
          "campoVisualizacion": ["nombre", "apellido"],
          "valoresDeFiltrado": {"A": "Activo", "B": "Bloqueado"}
        },
      },
      "nombre": {
        "type": "string",
        "required": true,
        "label": "Nombre",
      },
      "apellido": {
        "type": "string",
        "required": true,
        "label": "Apellido",
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

  List<Map<String, dynamic>> baseData = [
    {
      "idCiudadano": "1",
      "nombre": "Fulano",
      "apellido": "Cosme",
      "latitud": "-34.6037",
      "longitud": "-58.3816",
      "codigoAfip": 12345,
      "creadoEl": "2024-07-22"
    },
    {
      "idCiudadano": "2",
      "nombre": "Mengano",
      "apellido": "Menganito",
      "latitud": "-34.6044",
      "longitud": "-58.3817",
      "codigoAfip": 12346,
      "creadoEl": "2024-07-02"
    },
    {
      "idCiudadano": "3",
      "nombre": "Ardulio",
      "apellido": "Lopez",
      "latitud": "-34.6558",
      "longitud": "-58.3411",
      "codigoAfip": 12347,
      "creadoEl": "2024-07-05"
    },
    {
      "idCiudadano": "4",
      "nombre": "Fichinilo",
      "apellido": "alvarez",
      "latitud": "-34.7894",
      "longitud": "-58.7779",
      "codigoAfip": 12348,
      "creadoEl": "2024-07-15"
    },
  ];
}
