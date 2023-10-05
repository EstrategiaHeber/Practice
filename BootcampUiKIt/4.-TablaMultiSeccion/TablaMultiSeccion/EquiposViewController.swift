//
//  ViewController.swift
//  TablaMultiSeccion
//
//  Created by HEBER JIMENEZ on 03/10/23.
//
// https://www.youtube.com/watch?v=OPwsvkunP2A&ab_channel=MarcoAlonso
//
// goDetalle


import UIKit

/// * Protocolo es como un contrato donde establecen aquellos metodos que se deben implementar.


enum Objetos {
    
    case equipoSeleccionado
    case alumnoSeleccionado
}

class EquiposViewController: UIViewController {
    
    // Propiedades globales que almacenaran los objetos seleccionados
    
    //var equipoSeleccionado: EquipoModel?
    //var alumnoSeleccionado: AlumnoModel?
    
    var equipoSeleccionado: Objetos = .equipoSeleccionado
    var alumnoSeleccionado: Objetos = .alumnoSeleccionado
    
    // Arreglo que brindara la información a "tablaEquipos", seccion "Equipos Fotbal"
    var equipos = [
        EquipoModel(nombre: "America", titulosGanados: 13, logo: UIImage(named: "america")!),
        EquipoModel(nombre: "Chivas", titulosGanados: 12, logo: UIImage(named: "chivas")!),
        EquipoModel(nombre: "Toluca", titulosGanados: 8, logo: UIImage(named: "toluca")!),
        EquipoModel(nombre: "Cruz Azul", titulosGanados: 11, logo: UIImage(named: "cruz")!),
        EquipoModel(nombre: "Pumas", titulosGanados: 9, logo: UIImage(named: "pumas")!),
        EquipoModel(nombre: "Tigres", titulosGanados: 6, logo: UIImage(named: "tigres")!)
    ]
    
    // Arreglo que brindara la información a "tablaEquipos", seccion "Alumnos"
    var alumnos = [
        AlumnoModel(nombre: "Emiliano"),
        AlumnoModel(nombre: "Evan"),
        AlumnoModel(nombre: "Karina"),
        AlumnoModel(nombre: "Abigail")
    ]
    
    
    @IBOutlet weak var tablaEquipos: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hay que llenar la tabla con información
        /// La informacion con la que se llenara la tabla puede venir de cualquier clase o ViewController
        /// En este caso, self indica que la clase "EquiposViewController" sera quien le brinde la informacion a "tablaEquipos" para llenarla
        
        tablaEquipos.dataSource = self
        
        // Hay que indicar quien sera el delegado que informe que celda esta seleccionada
        /// Se indica que la clase "EquiposViewController" sera el delegado de "tablaEquipos"
        tablaEquipos.delegate = self
    }
}

// - MARK: * Métodos que se deben implementar al adoptar el protocolo "UITableViewDataSource"
// Este metodo es el protocolo que se debe adoptar para llenar y configurar las celdas que contendra
// la tableView

extension EquiposViewController: UITableViewDataSource {
    
    // Indica cuantos rebglones(celdas) va a tener la tabla
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        /// Cantidad de celdas deseadas, en este caso, el numero de celdas sera igual al numero de elementos
        /// que contenga el arreglo "equipos"
        //return equipos.count
        
        switch section {
        case 0:
            return equipos.count
        case 1:
            return alumnos.count
        default:
            return 0
        }
    }
    
    // Indica el número de secciones deseadas en la tabla
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // Indica que es lo que la celda contendra.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 1.- Se crea la celda, con el identificador establecido previamente
        let celda = tablaEquipos.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        
        // 2.- Configuración de celda (título y subtitulo)
        
        switch indexPath.section {
            
        // Caso Equipos
        case 0:
            // Titulo de la celda, pintara y recorrera cada elemento del arreglo "equipos"
            celda.textLabel?.text = equipos[indexPath.row].nombre
            // Subtítulo de la celda
            celda.detailTextLabel?.text = "Títulos ganados: \(equipos[indexPath.row].titulosGanados)"
            // Imagen de la celda
            celda.imageView?.image = equipos[indexPath.row].logo
        
        // Caso de Alumnos
        case 1:
            // Titulo de la celda, pintara y recorrera cada elemento del arreglo "alumnos"
            celda.textLabel?.text = alumnos[indexPath.row].nombre
            celda.detailTextLabel?.text = ""
            celda.imageView?.image = UIImage(systemName: "person.circle.fill")
        
        default:
            celda.textLabel?.text = "Desconocido"
        }
        
        // Se retorna la celda ya configurada
        return celda
    }
    
    // Indica el o los titulos que se desean, dependiendo el número de secciones obtenidas
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
            
        case 0:
            return "Seccion 1: Equipos Futbol"
        case 1:
            return "Seccion 2: Alumnos"
        default:
            return "Desconocido"
        }
    }
}

// - MARK: * Identificar cuando un usuario selecciona una celda o row especifica
// Se debe adoptar el protocolo UITableViewDelegate

extension EquiposViewController: UITableViewDelegate {
    
    // Metodo que indica que elemento fue seleccionado
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("El elemento seleccionado es: \(indexPath)")
        //print("El elemento seleccionado row es: \(indexPath.row)")
        //print("El elemento seleccionado section es: \(indexPath.section)")
        
        switch indexPath.section {
            
        case 0:
            print(equipos[indexPath.row].nombre)
            self.equipoSeleccionado = equipos[indexPath.row]
        case 1:
            print(alumnos[indexPath.row].nombre)
        default:
            print("ES desconocido")
        }
        
        // Mandar información por medio del segue
        /// En el sender, se indica que la clase "EquiposViewController"  sera la encargada de ejecutar este metodo
        /// Este metodo solo hace la navegacion
        performSegue(withIdentifier: "goDetalle", sender: self)
    }
    
    // Metodo complementario a "performSegue", que es el que envia la informacion
    // a traves del segue
    // Este metodo notifica al ViewController que tiene un segue que esta a punto
    // de ser inicializado
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goDetalle" {
            
            let objetoDestino = segue.destination as! DetalleViewController
            
//            switch Objetos {
//            equipoSeleccionado:
//                objetoDestino.recibirEquipo = equipoSeleccionado
//            case alumnoSeleccionado:
//                objetoDestino.recibirAlumno = alumnoSeleccionado
//            default:
//                print("No hay nada")
//            }
        }
    }
}

