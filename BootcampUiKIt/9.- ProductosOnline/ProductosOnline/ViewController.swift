//
//  ViewController.swift
//  ProductosOnline
//
//  Created by HEBER JIMENEZ on 11/10/23.
//

// https://dummyjson.com/products
// https://youtu.be/fiuXpdq_56E
// 1:05

// segue = goDetalle

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tablaProductos: UITableView!
    
    var manager = ProductosManager()
    var productos: [Product] = []
    var productoEnviar: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.obtenerProdcutos()
        
        tablaProductos.dataSource = self
        tablaProductos.delegate = self
        
        // Registro de la Celda Customizada
        tablaProductos.register(UINib(nibName: "ProductoCell", bundle: nil), forCellReuseIdentifier: "celda")
        
        view.backgroundColor = .red
    }
    
    func obtenerProdcutos() {
        manager.obtenerProductos { listaProductos in
            print("Existen: \(listaProductos.count)")
            
            self.productos = listaProductos
            DispatchQueue.main.async {
                self.tablaProductos.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! ProductoCell
        
        celda.configurarCelda(producto: productos[indexPath.row], index: indexPath.row)
        
        return celda
    }
    
    // Identificar que celda se selecciono para que permita la navegacion
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Se de-selecciona la celda
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Se crea segue para la navegacion
        performSegue(withIdentifier: "goDetalle", sender: self)
        self.productoEnviar = productos[indexPath.row]
    }
    
    // Enviar informacion por medio del segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Se recupera el segue
        if segue.identifier == "goDetalle" {
            // Se notifica el destino
            let objetoProducto = segue.destination as! DetalleProductoViewController
            // Se envia la informacion
            objetoProducto.recibirProducto = self.productoEnviar
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

