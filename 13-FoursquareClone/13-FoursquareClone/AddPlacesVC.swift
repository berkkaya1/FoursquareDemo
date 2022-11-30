//
//  AddPlacesVC.swift
//  13-FoursquareClone
//
//  Created by Berk Kaya on 26.11.2022.
//

import UIKit

class AddPlacesVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var placeNameField: UITextField!
    
    @IBOutlet weak var placeAtmosphereField: UITextField!
    @IBOutlet weak var placeTypeField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(title: "Next", style: UIBarButtonItem.Style.plain, target: self, action: #selector(nextButtonClicked))
        
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(cancelButtonClicked))
        
        
        placeImageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        placeImageView.addGestureRecognizer(gestureRecognizer)
        
    }
    
    @objc func selectImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        self.present(picker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        placeImageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    

    @objc func nextButtonClicked() {
        if placeNameField.text != "" && placeTypeField.text != "" && placeAtmosphereField.text != "" {
            if let chosenImage = placeImageView.image {
                //Singletondan obje olusturduk
                let placeModel = PlaceModel.sharedInstance
                placeModel.placeName = placeNameField.text!
                placeModel.placeType = placeTypeField.text!
                placeModel.placeAtmosphere = placeAtmosphereField.text!
                placeModel.placeImage = chosenImage
                
            }
            performSegue(withIdentifier: "toMapVC", sender: nil)
        } else {
            let alert = UIAlertController(title: "Error", message: "Please fill all the lines", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default)
            alert.addAction(okButton)
            present(alert, animated: true)
        }
         
    }
    
    @objc func cancelButtonClicked(){
        //navigationController?.popViewController burda calismaz cunku yeni bir navigation controller ekledik
        self.dismiss(animated: true)
    }
    

}
