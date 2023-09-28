//
//  UsuarioModel.swift
//  BenefitsUIKIT
//
//  Created by HEBER JIMENEZ on 27/09/23.
//

import Foundation

struct ResponseUser: Decodable {
    
    var StatusCode: Int
    var Status: String
    var version: Double?
    var EmpleadoEmpresa: Empleado?
    //var Empleado: String?
    var Beneficios: [Beneficio]?
    //"Productos":null,
    //"RedMedica":null,
    //"ProductosMedicos":null,
    //"Medicos":null,
    var EmpresasRC: [EmpresasTDC]?
    
}

struct Empleado: Decodable {
    
    var IdEmpleado: String
    var Nombre: String
    var ApellidoPaterno: String
    var ApellidoMaterno: String
    var PIN: Int
    var MembresiaVRIM: String?
    var MembresiaTDU: String?
    var IdEmpresa: String?
    var Empresa: String?
    var Logo: String
    var PrimaryColor: String?
    var SecondaryColor: String?
    var AccentColor: String?
    var Email: String?
    
}

// MARK: Estructuras para respuesta a login

struct Beneficio: Decodable {
    
    let BeneficiosDetalle: [BeneficiosDetails]
    let IdBeneficio: Int
    let Beneficio: String
    let Activo: Bool
    let Img: String
}

// **********
struct BeneficiosDetails: Decodable {
    
    let IdBeneficioDetalle: Int
    let IdBeneficio: Int
    let Titulo: String
    let Descripcion: String
    let Tipo: String
    let IdProveedor: Int
    let Activo: Bool
    let Icon: String
    let FUA: String
    let DescripcionExtendida: String
    
}

struct BienestarVida: Hashable {
    
    var titulo: String
    var imagen: String
    var contenido: String
    var condiciones: String?
}

// * Comineza Red Comercial TDC

struct EmpresasTDC: Decodable {
    var ConveniosRC: [ConvenioTDC]
    var SucursalesRC: [SucursalesTDC]
    var IdEmpresaRC: Int
    var NombreComercial: String
    var Logo: String
    var Activa: Bool
}

struct SucursalesTDC: Decodable {
    var IdSucursalRC: Int
    var IdEmpresaRC: Int
    var Sucursal: String
    var Direccion: String
    var Estado: String
    var Municipio: String
    var Latitud: Double
    var Longitud: Double
    var Tel1: String
    var Tel2: String
    var WhatsApp: String
    var Horarios: String
    var Activa: Bool
    var FUA: String
    var IdCodigo: String
    var IdConvenio: Int
}

struct ConvenioTDC: Decodable {
    var IdConvenioRC: Int
    var IdEmpresaRC: Int
    var Descuento: String
    var Reestricciones: String
    var Categoria: String
    var FUA: String
    var IdCodigo: String
}

struct objetoTDC: Hashable{
    
    var imagen: String
    var nombre: String
    var categoria: String
    var promocion: String
    var condiciones: String
}


