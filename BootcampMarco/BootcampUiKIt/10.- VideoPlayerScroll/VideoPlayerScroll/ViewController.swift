//
//  ViewController.swift
//  VideoPlayerScroll
//
//  Created by HEBER JIMENEZ on 17/10/23.
//

import UIKit
import Kingfisher
// Permite reproducir videos al seleccionarlos
import AVKit

class ViewController: UIViewController {
    
    @IBOutlet weak var categoriasVideos: UISegmentedControl!
    @IBOutlet weak var videosCollection: UICollectionView!
    
    // Instancia del manager
    var manager = VideoManager()
    
    // Propiedad para almacenar los elementos en esta vista
    var videos: [Video] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegado = self
        videosCollection.delegate = self
        videosCollection.dataSource = self
        
        self.setupCollection()
        self.obtenerVideos(categoria: "playa")
        
        
    }
    
//    func customSegmentedController() {
//
//    }
    
    // Funcion para establecer la orientacion de la collection
    private func setupCollection() {
        videosCollection.collectionViewLayout = UICollectionViewFlowLayout()
        
        if let flowLayout = videosCollection.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
        }
    }
    
    // Obtiene los videos
    func obtenerVideos(categoria: String){
        Task {
            await manager.encontrarVideos(categoria: categoria)
        }
    }
    
    @IBAction func buscarButton(_ sender: Any) {
        
        // Se crea alerta
        let alerta = UIAlertController(title: "Buscar videos", message: "Escribe una categoria", preferredStyle: .alert)
        
        // Se crea el textField
        alerta.addTextField { categoriaTF in
            categoriaTF.placeholder = "Ingresa una categoria"
            categoriaTF.textColor = .orange
            categoriaTF.font = UIFont(name: "Avenir", size: 18)
        }
        
        // Se crean botones
        let botonBuscar = UIAlertAction(title: "Buscar", style: .default) { _ in
            
            //Extraer texto de textField y mandar a llamar funcion que buscara videos en api
            guard let categoria = alerta.textFields?.first?.text else {return}
            self.obtenerVideos(categoria: categoria)
        }
        let botonCancelar = UIAlertAction(title: "Cancelar", style: .destructive)
        
        // Se agregan los botones(acciones) a la alerta
        alerta.addAction(botonBuscar)
        alerta.addAction(botonCancelar)
        
        // Se presenta la alerta
        present(alerta, animated: true)
    }
    
    // Metodo que detectara cada interaccion del usuario
    @IBAction func categoriaSeleccionada(_ sender: UISegmentedControl) {
        var categoria = ""
        //print("Se selecciono: \(sender.selectedSegmentIndex)")
        
        switch sender.selectedSegmentIndex {
        case 0:
            categoria = sender.titleForSegment(at: 0) ?? ""
        case 1:
            categoria = sender.titleForSegment(at: 1) ?? ""
        case 2:
            categoria = sender.titleForSegment(at: 2) ?? ""
        case 3:
            categoria = sender.titleForSegment(at: 3) ?? ""
        case 4:
            categoria = sender.titleForSegment(at: 4) ?? ""
        default:
            categoria = "musica"
        }
        
        obtenerVideos(categoria: categoria)
    }
    
}

// MARK: - Obtener informacion para llenar la vista, por medio del delegado
extension ViewController: VideoManagerProtocol {
    // Metodo que se debe implementar obligatoriamente por medio del delegado
    func mostrarVideos(listaVideos: [Video]) {
        //print(listaVideos)
        // Se le pasa informacion al viewControler por medio del delegado
        self.videos = listaVideos
        
        DispatchQueue.main.async {
            self.videosCollection.reloadData()
        }
    }
}

// MARK: - Metodos ha implementar por haber adoptado delegados
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // Cuantos elementos se van a mostrar
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.videos.count
    }
    
    // Configuracion de la celda a mostrar
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Se crea la celda
        let celda = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoCell", for: indexPath) as! VideoCell
        
        // Obtener la imagen desde una url
        //celda.imagenVideo.image = UIImage(systemName: "person.fill")
        
        if let url = URL(string: videos[indexPath.row].image) {
            celda.imagenVideo.kf.setImage(with: url)
            
            // Customizacion de la apariencia de las imagenes (esquinas redondeadas)
            celda.imagenVideo.layer.cornerRadius = 20
        }
        
        // Se regresa la celda ya configurada
        return celda
    }
    
    // Detectar cual celda (video fue seleccionado)
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Reproducir video
        
        // Se recuper la url desde donde se va a reproducir el video
        let urlString = videos[indexPath.row].videoFiles.first?.link ?? ""
        guard let url = URL(string: urlString) else {return}
        
        // Se crea el reproductor
        let reproductor = AVPlayer(url: url)
        
        // View Controller que se mostrara para reproducir el video
        let viewController = AVPlayerViewController()
        // Se le asigna quien sera el reproductor del view controller
        viewController.player = reproductor
        // Presentar ese ViewCoontroller, y cuando eso pase que comience a reproducir el video 
        present(viewController, animated: true) {
            reproductor.play()
        }
    }
}

// MARK: - Asignacion de medidas de celda alto y ancho
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 150)
    }
}

