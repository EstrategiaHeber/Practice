//
//  EditarContactoViewController.swift
//  ContactosCoreData
//
//  Created by ALAN CARO on 10/10/23.
//

import UIKit
import CoreData

class EditarContactoViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    var contactoEditar: ContactoTable?
    
    // Referencia al contexto (Base de Datos) que se encuentra en el AppDelegate
    let contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var imagenEditar: UIImageView!
    @IBOutlet weak var nombreTextField: UITextField!
    @IBOutlet weak var telefonoTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var direccionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configurarUI()
        self.gestoImagen()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func configurarUI() {
        self.nombreTextField.text = contactoEditar?.nombre
        self.telefonoTextField.text = String(contactoEditar?.telefono ?? 0)
        self.emailTextField.text = contactoEditar?.email
        self.direccionTextView.text = contactoEditar?.direccion
        self.imagenEditar.image = UIImage(data: (contactoEditar?.imagen)!)
        
        // Esquinas redondeadas
        imagenEditar.layer.cornerRadius = imagenEditar.frame.width / 2
        imagenEditar.layer.masksToBounds = true
    }
    
    // Detectara un gesto de la imagen
    func gestoImagen() {
        
        let gestura = UITapGestureRecognizer(target: self, action: #selector(clickImagen))
        
        // Cuantos toques son requeridos para activar funcionalidad
        gestura.numberOfTapsRequired = 1
        gestura.numberOfTouchesRequired = 1
        
        // A la imagen se le agrega la gestura que se acaba de crear
        imagenEditar.addGestureRecognizer(gestura)
        // Se le activa la interaccion de usuario
        imagenEditar.isUserInteractionEnabled = true
        
    }
    
    @objc func clickImagen() {
        print("La imagen se ha seleccionado")
        editarImagen()
    }
    
    func editarImagen() {
        
        // * Creacion de ViewController
        
        let vc = UIImagePickerController()
        vc.delegate = self
        // Permite la edicion de la imagen
        vc.allowsEditing = true
        
        
        // * Creacion de botones alerta
        
        // Se crea alerta
        let alerta = UIAlertController(title: "Seleccionar foto", message: "Elige de donde queires seleccionar la foto", preferredStyle: .actionSheet)
        
        let camara = UIAlertAction(title: "Camara", style: .default) { _ in
            // El origen sera la camara y presentar el picker
            
            // De donde se mostraran las fotos
            vc.sourceType = .camera
            self.present(vc, animated: true)
        }
        
        let fotos = UIAlertAction(title: "Fotos", style: .default) { _ in
            // El origen sera la galeria de fotos y presentar el picker
            
            // De donde se mostraran las fotos
            vc.sourceType = .photoLibrary
            self.present(vc, animated: true)
        }
        
        let cancelar = UIAlertAction(title: "Cancelar", style: .destructive)
        
        // Se agregan los botonesAlerta
        alerta.addAction(camara)
        alerta.addAction(fotos)
        alerta.addAction(cancelar)
        
        // Presentar el alerta
        present(alerta, animated: true)
    }
    
    @IBAction func editarFotoButton(_ sender: Any) {
        editarImagen()
    }
    
    // Esta funcion le dice al delegado que el usuario seleccioando una imagen o video
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let imagenSeleccionada = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            self.imagenEditar.image = imagenSeleccionada
        }
        // Oculta el picker
        picker.dismiss(animated: true)
    }
    
    @IBAction func cancelarButton(_ sender: UIButton) {
        
        // Regresa una vista anterior
        navigationController?.popViewController(animated: true)
        
        // Regresa a la vista padre, vista raiz
        //navigationController?.popToRootViewController(animated: true)
        
        // Regresa a una vista en especifico
        //navigationController?.popToViewController(<#T##viewController: UIViewController##UIViewController#>, animated: true)
    }
    
    @IBAction func guardarButton(_ sender: UIButton) {
        contactoEditar?.nombre = nombreTextField.text
        contactoEditar?.telefono = Int64(telefonoTextField.text ?? "0") ?? 0
        contactoEditar?.direccion = direccionTextView.text
        contactoEditar?.email = emailTextField.text
        contactoEditar?.imagen = imagenEditar.image?.pngData()
        
        do {
            try contexto.save()
            // Regresar
            navigationController?.popViewController(animated: true)
        } catch {
            print("No se pudo actualizar el contacto")
        }
    }
}
