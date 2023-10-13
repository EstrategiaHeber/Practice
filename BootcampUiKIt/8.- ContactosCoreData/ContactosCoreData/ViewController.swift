//
//  ViewController.swift
//  ContactosCoreData
//
//  Created by HEBER JIMENEZ on 09/10/23.
//
// https://www.youtube.com/watch?v=rFmK7qaBo20&ab_channel=MarcoAlonso
// minuto 1:50:46

import UIKit
import CoreData
import MessageUI

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tablaContactos: UITableView!
    
    // Referencia al contexto (Base de Datos) que se encuentra en el AppDelegate
    let contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // Arreglo para llenar la tabla y mostrar contactos, recuperar los datos de la tabla de datos y mostrarlos
    var contactos : [ContactoTable] = []
    
    var contactoEditar: ContactoTable?
    
    
    /// Cuando la vista ya existe ya no se ejecutara "viewDidLoad", en automatico se pasa a "viewWillAppear"
    
    // 1
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Ejecutando: viewDidLoad")
        
        tablaContactos.dataSource = self
        tablaContactos.delegate = self
        
        recuperarContactos()
        
        // Registro de la celda customizada "ContactoCell"
        tablaContactos.register(UINib(nibName: "ContactoCell", bundle: nil), forCellReuseIdentifier: "celda")
    }
    
    // 2
    override func viewWillAppear(_ animated: Bool) {
        /// Si se desea hacer algo antes de que la vista aparezca, es en este metodo,
        /// donde se debe implementar ejemplo consulta de base de datos, descargar algo, actualizar borrar algo
        print("Ejecutando: viewWillAppear")
        recuperarContactos()
    }
    
    // 3
    override func viewDidAppear(_ animated: Bool) {
        /// Hacer algo despues de que la visat ya aparecio, animacion, crear tabal, borrar texto etc
        print("Ejecutando: viewDidAppear")
    }
    
    // 4
    override func viewWillDisappear(_ animated: Bool) {
        print("Ejecutando: viewWillDisappear")
    }
    
    // 5
    override func viewDidDisappear(_ animated: Bool) {
        print("Ejecutando: viewDidDisappear")
    }
    
    // TODO: RECUPERAR ELEMENTOS DE BASE DE DATOS
    func recuperarContactos() {
        let solicitud: NSFetchRequest <ContactoTable> = ContactoTable.fetchRequest()
        do {
            // Se asigna los datos recuperados a el arreglo global
            contactos = try contexto.fetch(solicitud)
            
            // Se recarga la tabla para poderla pintar en nuestra vsita
            tablaContactos.reloadData()
        } catch {
            print("Error al recuperar elementos")
        }
    }
    
    @IBAction func agregarButton(_ sender: Any) {
        
        // Creacion de alerta
        let alerta = UIAlertController(title: "Agregar", message: "Contacto", preferredStyle: .alert)
        
        // Agregar testFields a la alerta
        alerta.addTextField { nombreTF in
            nombreTF.placeholder = "Nombre"
            nombreTF.textColor = .red
            nombreTF.font = UIFont(name: "Avenir", size: 22)
        }
        
        alerta.addTextField { telefonoTF in
            telefonoTF.placeholder = "Telefono"
            telefonoTF.keyboardType = .numberPad
            telefonoTF.textColor = .red
            telefonoTF.font = UIFont(name: "Avenir", size: 22)
        }
        
        alerta.addTextField { direccionTF in
            direccionTF.placeholder = "Direccion"
            direccionTF.textColor = .red
            direccionTF.font = UIFont(name: "Avenir", size: 22)
        }
        
        alerta.addTextField { correoTF in
            correoTF.placeholder = "Correo"
            correoTF.keyboardType = .emailAddress
            correoTF.textColor = .red
            correoTF.font = UIFont(name: "Avenir", size: 22)
        }
        
        // Boton guardar
        let guardar = UIAlertAction(title: "Aceptar", style: .default) { _ in
            // Guardar el contacto en BaseDatos (CoreData)
            //print("Guardar Contacto")
            
            guard let nombreAlerta = alerta.textFields?[0].text else {return}
            guard let telefonoAlerta = alerta.textFields?[1].text else {return}
            guard let direccionAlerta = alerta.textFields?[2].text else {return}
            guard let emailAlerta = alerta.textFields?[3].text else {return}
            
            let imagenTemporal = UIImageView(image: UIImage(systemName: "person"))
            
            // TODO: GUARDAR ELEMENTO A BASE DE DATOS
            
            // Se crea un nuevo objeto para guardarlo
            let contactoGuardar = ContactoTable(context: self.contexto)
            contactoGuardar.nombre = nombreAlerta
            contactoGuardar.telefono = Int64(telefonoAlerta) ?? 0
            contactoGuardar.direccion = direccionAlerta
            contactoGuardar.email = emailAlerta
            contactoGuardar.imagen = imagenTemporal.image?.pngData()
            
            do {
                try self.contexto.save()
                print("Contacto guardaro: \(contactoGuardar.nombre)")
            } catch {
                print("Erros al guardar en BD: \(error.localizedDescription)")
            }
            
            self.contactos.append(contactoGuardar)
            self.tablaContactos.reloadData()
            
        }
        
        // Boton cancelar 
        let cancelar = UIAlertAction(title: "Cancelar", style: .destructive)
        
        alerta.addAction(guardar)
        alerta.addAction(cancelar)
        
        present(alerta, animated: true)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Se castea la celda
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! ContactoCell
        
        celda.nombreLabel.text = contactos[indexPath.row].nombre
        celda.telefonoLabel.text = String(contactos[indexPath.row].telefono)
        celda.direccionLabel.text = contactos[indexPath.row].direccion
        celda.correoLabel.text = contactos[indexPath.row].email
        celda.imagenContacto.image = UIImage(data: contactos[indexPath.row].imagen!)
        return celda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(contactos[indexPath.row])
        
        self.contactoEditar = contactos[indexPath.row]
        
        performSegue(withIdentifier: "goEditar", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Se recupera el segue
        if segue.identifier == "goEditar" {
            
            // Se recupera el ViewController
            let editarContacto = segue.destination as! EditarContactoViewController
            
            // Se tiene acceso a propiedades de EditarContactoViewController
            editarContacto.contactoEditar = self.contactoEditar
            
        }
    }
    
    // Metodo que indica tamaño de alto de celda
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    // Acciones derechas
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // 1 - Se crea accion
        let accionEliminar = UIContextualAction(style: .normal, title: "Borrar") { _, _, _ in
            
            self.contexto.delete(self.contactos[indexPath.row])
            
            self.guardarContexto()
            
            self.recuperarContactos()
        }
        
        accionEliminar.image = UIImage(systemName: "trash")
        accionEliminar.backgroundColor = .red
        
        // Accion editar
        let accionEditar = UIContextualAction(style: .normal, title: "Editar") { _, _, _ in
            
            self.performSegue(withIdentifier: "goEditar", sender: self)
        }
        
        accionEditar.image = UIImage(systemName: "pencil")
        accionEditar.backgroundColor = .orange
        
        // Accion mapa
        let accionMapa = UIContextualAction(style: .normal, title: "Direccion") { _, _, _ in
            
            //self.performSegue(withIdentifier: "goEditar", sender: self)
            print("Quiero ir a mapa")
        }
        
        accionMapa.image = UIImage(systemName: "mappin.and.ellipse")
        accionMapa.backgroundColor = .blue
        
        return UISwipeActionsConfiguration(actions: [accionEliminar, accionEditar, accionMapa])
    }
    
    private func guardarContexto() {
        do {
            try self.contexto.save()
        } catch {
            print("No se pudo eliminar contacto")
        }
    }
    
    // Acciones izquierdas
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // Accion Llamar
        let accionLLamar = UIContextualAction(style: .normal, title: "Llamar") { _, _, _ in
            
            print("Llamando")
            
            // Hacer llamada telefonica
            
            let numero: Int64 = self.contactos[indexPath.row].telefono
                
            let numString = String(numero)
        
            
            if let llamadaURL = URL(string: "TEL://\(numString)") {
                
                let aplicacionLllamda : UIApplication = UIApplication.shared
                
                if (aplicacionLllamda.canOpenURL(llamadaURL)) {
                    
                    aplicacionLllamda.open(llamadaURL, options: [:], completionHandler: nil)
                }
            }
        }
        
        accionLLamar.image = UIImage(systemName: "phone.arrow.right")
        accionLLamar.backgroundColor = .orange
        
        // Accion Email
        let accionCorreo = UIContextualAction(style: .normal, title: "Correo") { _, _, _ in
            
            print("Correo")
            guard let email = self.contactos[indexPath.row].email else {return}
            guard let nombre = self.contactos[indexPath.row].nombre else {return}
            self.showMail(correo: email, nombre: nombre)
        }
        
        accionCorreo.image = UIImage(systemName: "mail")
        accionCorreo.backgroundColor = .gray
        
        return UISwipeActionsConfiguration(actions: [accionLLamar, accionCorreo])
    }
    
}

// MARK: - Enviar Email Protocol
extension ViewController: MFMailComposeViewControllerDelegate {
    
    func showMail(correo: String, nombre: String){
        if !MFMailComposeViewController.canSendMail() {
            print("No esta configurada ninguna cuenta de correo")
        } else {
            //Si se pueda enviar
            let composeVC = MFMailComposeViewController()
            composeVC.mailComposeDelegate = self
            
            //Configurar el cueroo del correo
            
            // A quien se envia el correo
            composeVC.setToRecipients(["\(correo)"])
            // Titulo de correo
            composeVC.setSubject("Hola \(nombre)")
            composeVC.setMessageBody("", isHTML: false)
            self.present(composeVC, animated: true)
        }
        
        
    }
    
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if error != nil {
            controller.dismiss(animated: true)
            return
        }
        
        switch result {
        case .cancelled:
            print("Cancelado")
            DispatchQueue.main.async {
                
                self.mostrarMSJUsuario(msj: "Cancelado")
            }
            
        case .saved:
            print("saved")
            DispatchQueue.main.async {
                self.mostrarMSJUsuario(msj: "Se Guardado en borradores")
            }
        case .sent:
            print("sent")
            DispatchQueue.main.async {
                self.mostrarMSJUsuario(msj: "Ah sido enviado")
            }
        case .failed:
            mostrarMSJUsuario(msj: "Fallo")
        }
        
        controller.dismiss(animated: true)
    }
    
    func mostrarMSJUsuario(msj: String){
        let alerta = UIAlertController(title: "TU CORREO:", message: msj, preferredStyle: .alert)
        let accionAceptar = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        alerta.addAction(accionAceptar)
        present(alerta, animated: true, completion: nil)
    }
    
    
}

