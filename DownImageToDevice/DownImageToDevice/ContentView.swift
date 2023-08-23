//
//  ContentView.swift
//  DownImageToDevice
//
//  Created by ALAN CARO on 23/08/23.
//

///En este ejemplo, se utiliza un botón para iniciar la descarga de la imagen. Al hacer clic en el botón, se llama a la función downloadImage() que descarga la imagen desde la URL proporcionada.

///La función downloadImage() utiliza URLSession.shared.dataTask(with:completionHandler:) para descargar los datos de la imagen desde la URL. Luego, crea una instancia de UIImage a partir de los datos descargados y llama a saveImageToDisk(_:) para guardar la imagen en el sistema de archivos.

///La función saveImageToDisk(_:) toma la imagen descargada, la convierte en datos JPEG y la guarda en el directorio de documentos del usuario con el nombre "image.jpg". Puedes personalizar el nombre del archivo y el directorio de destino según tus necesidades.

///Una vez que se guarda la imagen en el sistema de archivos, se establece la propiedad image con la imagen descargada para mostrarla en la interfaz de usuario.

///Recuerda reemplazar "https://example.com/image.jpg" con la URL real de la imagen que deseas descargar.

import SwiftUI

struct ContentView: View {
    
    @State private var image: UIImage? = nil

    var body: some View {
        VStack {
            if let downloadedImage = image {
                Image(uiImage: downloadedImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                Button("Descargar imagen") {
                    downloadImage()
                }
            }
        }
    }
    
    func downloadImage() {
        guard let url = URL(string: "https://tdushots.blob.core.windows.net/media/Images/Comercios/525/image_cd6392ae-7bef-4093-b4c4-70d6092b97dc.jpg") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data, let downloadedImage = UIImage(data: data) else {
                return
            }
            
            saveImageToDisk(downloadedImage)
            DispatchQueue.main.async {
                self.image = downloadedImage
            }
        }.resume()
    }
    
    func saveImageToDisk(_ image: UIImage) {
        guard let data = image.jpegData(compressionQuality: 1.0),
              let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("image.jpg") else {
            return
        }
        
        do {
            try data.write(to: fileURL)
        } catch {
            print("Error al guardar la imagen: \(error.localizedDescription)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
