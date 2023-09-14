//
//  ContentView.swift
//  CargarFotos
//
//  Created by ALAN CARO on 06/09/23.
//

//import SwiftUI
//
//// MARK: VIEW
//
///// 1.- Importar PhotosUI
//import PhotosUI
//
//struct ContentView: View {
//
//    /// 3.- Se crea la instancia del ViewModel
//    @StateObject var viewModel = ViewModel()
//
//    var body: some View {
//        Form {
//            Section("Select Photo") {
//                VStack {
//                    viewModel.imagenDefecto
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 120, height: 120)
//                    Divider()
//                    PhotosPicker(selection: $viewModel.photoSelection, matching: .images, photoLibrary: .shared()) {
//                        Label("Selecciona un foto", systemImage: "photo.on.rectangle.angled")
//                    }
//                }
//            }
//        }
//    }
//}
//
//// MARK: VIEWMODEL
//
//class ViewModel: ObservableObject {
//
//    @Published var imagenDefecto = Image(systemName: "photo.on.rectangle.angled")
//    /// 2.- Declarar la variable con la que se cargara la imagen
//    @Published var photoSelection: PhotosPickerItem? {
//        didSet {
//            if let photoSelection {
//                loadTransferable(from: photoSelection)
//            }
//        }
//    }
//
//    func loadTransferable(from photoSelection: PhotosPickerItem) {
//        photoSelection.loadTransferable(type: Data.self) { result in
//            DispatchQueue.main.async {
//                guard photoSelection == self.photoSelection else {return}
//
//                switch result {
//                case .success(let data):
//                    let uiImage = UIImage(data: data!)
//                    self.imagenDefecto = Image(uiImage: uiImage!)
//                case .failure(let error):
//                    print("Error load transferable \(error)")
//                    self.imagenDefecto = Image(systemName: "multiply.circle.fill")
//                }
//            }
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

// MARK: 2

import SwiftUI
import UIKit

struct ContentView: View {

    @State private var isImagePickerPresented = false
    @State private var image: UIImage?

    var body: some View {

        VStack {

            Button {
                print("Hola puto")
            } label: {
                Image(systemName: "person.fill")
            }


            if let image = image {

                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .padding()

                Button("Guardar en la galería") {
                    saveImageToGallery(image)
                }
            } else {
                Button("Tomar Foto") {
                    isImagePickerPresented.toggle()
                }
            }
        }
        .sheet(isPresented: $isImagePickerPresented) {
            ImagePicker(image: $image)
        }
    }

    private func saveImageToGallery(_ image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            picker.dismiss(animated: true)
        }
    }


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: 3

//import SwiftUI
//
//struct ContentView: View {
//    @State private var image: UIImage?
//    @State private var isImagePickerPresented = false
//
//    var body: some View {
//        VStack {
//            if let image = image {
//                Image(uiImage: image)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 200, height: 200)
//                    .padding()
//
//                Button("Guardar Foto") {
//                    savePhotoToApp(image)
//                }
//            } else {
//                Button("Tomar Foto") {
//                    isImagePickerPresented.toggle()
//                }
//            }
//        }
//        .sheet(isPresented: $isImagePickerPresented) {
//            ImagePicker(image: $image)
//        }
//    }
//
//    private func savePhotoToApp(_ image: UIImage) {
//        // Aquí puedes guardar la imagen en la ubicación de documentos de tu aplicación
//        // y realizar cualquier otra lógica que necesites para administrar la imagen.
//        // Por ejemplo, puedes guardarla en Core Data o en UserDefaults.
//
//        // A modo de ejemplo, imprimiremos el tamaño de la imagen.
//        let imageSize = image.size
//        print("Tamaño de la imagen: \(imageSize)")
//    }
//}
//
//struct ImagePicker: UIViewControllerRepresentable {
//    @Binding var image: UIImage?
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    func makeUIViewController(context: Context) -> UIImagePickerController {
//        let picker = UIImagePickerController()
//        picker.delegate = context.coordinator
//        picker.sourceType = .camera
//        return picker
//    }
//
//    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
//
//    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//        var parent: ImagePicker
//
//        init(_ parent: ImagePicker) {
//            self.parent = parent
//        }
//
//        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//            if let uiImage = info[.originalImage] as? UIImage {
//                parent.image = uiImage
//            }
//            picker.dismiss(animated: true)
//        }
//    }
//}

