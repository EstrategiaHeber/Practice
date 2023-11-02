
//
//  ProductoCell.swift
//  ProductosOnline
//
//  Created by HEBER JIMENEZ on 11/10/23.
//

import UIKit

class ProductoCell: UITableViewCell {
    
    var manager = ProductosManager()
    
    // Stack para cambiar el color de cada renglon
    @IBOutlet weak var fondoStack: UIStackView!
    
    // Propiedades para llenar la celda
    @IBOutlet weak var imagenProducto: UIImageView!
    @IBOutlet weak var nombreProducto: UILabel!
    @IBOutlet weak var precioProducto: UILabel!
    @IBOutlet weak var stockProducto: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configurarCelda(producto: Product, index: Int) {
        
        // Color de celda
        
        //print("El index es: \(index)")
        //let resultado = index%2
        //print("La division es: \(resultado)")
        if (index%2) == 0 {
            fondoStack.backgroundColor = .gray
        } else {
            fondoStack.backgroundColor = .green
        }
        
        nombreProducto.text = producto.title
        precioProducto.text = "$ \(producto.price)"
        stockProducto.text = "Existen: \(producto.stock)"
        
        // Imagen desde url
        manager.obtenerImagenCompletion(urlString: producto.thumbnail) { image, error in
            DispatchQueue.main.async {
                self.imagenProducto.image = image
                self.imagenProducto.layer.cornerRadius = 10
            }
        }
//        guard let urlImagen = URL(string: producto.thumbnail) else {return}
//        URLSession.shared.dataTask(with: urlImagen) { data, _, _ in
//            
//            guard let dataImagen = data else {return}
//            
//            // Crear una imagen con la data resultante
//            let imagen = UIImage(data: dataImagen)
//            
//            DispatchQueue.main.async {
//                self.imagenProducto.image = imagen
//                self.imagenProducto.layer.cornerRadius = 10
//            }
//            
//        }
//        .resume()
    }
    
}
