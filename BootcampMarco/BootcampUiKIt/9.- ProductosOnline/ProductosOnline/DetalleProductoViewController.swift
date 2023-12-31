//
//  DetalleProductoViewController.swift
//  ProductosOnline
//
//  Created by HEBER JIMENEZ on 12/10/23.
//

import UIKit

class DetalleProductoViewController: UIViewController {
    
    var manager = ProductosManager()
    
    // Arreglo para llenar el collection
    var imagenesProducto : [UIImage] = []
    
    // Propiedad que recibe la informacion a mostrar, desde el segue
    var recibirProducto: Product?

    // Elementos visibles de la vista
    @IBOutlet weak var productosCollection: UICollectionView!
    @IBOutlet weak var imagenProducto: UIImageView!
    @IBOutlet weak var descripcionProducto: UILabel!
    @IBOutlet weak var marcaProducto: UILabel!
    @IBOutlet weak var categoriaProducto: UILabel!
    @IBOutlet weak var descuentoProducto: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configurarUI()
        
        productosCollection.delegate = self
        productosCollection.dataSource = self
        
        descargarImagenes()
    }
    
    func configurarUI() {
        // Título de la pagina
        self.navigationItem.title = recibirProducto?.title
        
        //
        descripcionProducto.text = recibirProducto?.description
        marcaProducto.text = recibirProducto?.brand
        categoriaProducto.text = recibirProducto?.category
        descuentoProducto.text = "\(recibirProducto?.discountPercentage ?? 0.0)% de descuento"
        
        // Metodo 1 para descargar imagen desde url
//        manager.obtenerImagenCompletion(urlString: recibirProducto?.thumbnail ?? "") { image, error in
//            
//            DispatchQueue.main.async {
//                self.imagenProducto.image = image
//                self.imagenProducto.layer.cornerRadius = 40
//            }
//        }
        
        // Metodo 2 para descargar imagen desde url
        DispatchQueue.main.async {
            self.imagenProducto.loadFrom(URLAddress: self.recibirProducto?.thumbnail ?? "")
        }
    }
    
    func descargarImagenes() {
        
        guard let arregloImagenes = recibirProducto?.images else {return}
        for urlImagen in arregloImagenes {
            //print(urlImagen)
            manager.obtenerImagenCompletion(urlString: urlImagen) { image, error in
                
                if let imagenDescargada = image {
                    self.imagenesProducto.append(imagenDescargada)
                    //print("Existen \(self.imagenesProducto.count) guardadas")
                    DispatchQueue.main.async {
                        self.productosCollection.reloadData()
                    }
                }
                
            }
        }
    }

}

extension DetalleProductoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //print(self.imagenesProducto.count)
        //return self.imagenesProducto.count
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let celda = collectionView.dequeueReusableCell(withReuseIdentifier: "ImagenProductoCell", for: indexPath) as! ImagenProductoCell
        
        // Pintar celda
        celda.imagenProducto.image = UIImage(systemName: "car")
//        for imagen in imagenesProducto {
//            DispatchQueue.main.async {
//                celda.imagenProducto.image = imagen //UIImage(systemName: "car")
//            }
//        }
        return celda
    }
}
