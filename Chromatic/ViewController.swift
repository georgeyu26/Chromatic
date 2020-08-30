//
//  ViewController.swift
//  Chromatic
//
//  Created by George Yu on 2019-01-12.
//  Copyright © 2019 George Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var Camera: UIButton!
    @IBOutlet weak var Photos: UIButton!
    @IBOutlet weak var ImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func CameraAction(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .camera
        present(picker, animated: true, completion: nil)
    }
    
    @IBAction func PhotosAction(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
    @IBAction func ShareAction(_ sender: UIButton) {
        let activityVC = UIActivityViewController(activityItems: [self.ImageView.image!], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        ImageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage; dismiss(animated: true, completion: nil)
    }
    
}
