//
//  ViewController.swift
//  2210992229_test2
//
//  Created by student-2 on 23/11/24.
//

import UIKit

class ViewController: UIViewController , UIImagePickerControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func SaveButton(_ sender: Any) {
        
    }
    
    
    
    @IBAction func uploadPhotoButtonTapped(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        let allertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel , handler: nil)
        allertController.addAction(cancelAction)
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title : "Camera" , style: .default , handler: {action in
                print("User has choosen camera")
                imagePicker.sourceType = .camera
                self.present(imagePicker , animated: true , completion: nil)
            })
            allertController.addAction(cameraAction)
        }
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title : "Photo Library" , style: .default , handler: {action in
                print("User has chosen photo Library")
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker , animated: true , completion: nil)
            })
            allertController.addAction(photoLibraryAction)
        }
        present(allertController , animated: true , completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {return}
        imageView.image = selectedImage
        dismiss(animated: true , completion: nil)
    }
    
    
}

