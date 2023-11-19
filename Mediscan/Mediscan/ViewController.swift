//
//  ViewController.swift
//  Mediscan
//
//  Created by Alok Sahay on 18.11.2023.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var profilePickerController: UISegmentedControl!
    let imagePicker = UIImagePickerController()
    var shouldCheckForImage = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    
    @IBAction func takePicture(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.originalImage] as? UIImage else { return }
        
        DataManager.fetchRecord(image: image)
        loadEMR()
    }
    
    func loadEMR() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.performSegue(withIdentifier: "showResults", sender: nil)
        }
    }
    
    func findAllTextViewsInView(_ view: UIView) -> [UITextView] {
        var textViews = [UITextView]()
        
        for subview in view.subviews {
            if let textView = subview as? UITextView {
                textViews.append(textView)
            } else {
                // Recursively search in this subview
                textViews += findAllTextViewsInView(subview)
            }
        }
        
        return textViews
    }
    
    func findAllLabelsInView(_ view: UIView) -> [UILabel] {
        var textViews = [UILabel]()
        
        for subview in view.subviews {
            if let textView = subview as? UILabel {
                textViews.append(textView)
            } else {
                // Recursively search in this subview
                textViews += findAllLabelsInView(subview)
            }
        }
        return textViews
    }
    
    func findAllImagesInView(_ view: UIView) -> [UIImageView] {
        var textViews = [UIImageView]()
        
        for subview in view.subviews {
            if let textView = subview as? UIImageView {
                textViews.append(textView)
            } else {
                // Recursively search in this subview
                textViews += findAllImagesInView(subview)
            }
        }
        return textViews
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResults" {
            let detailViewController = segue.destination
            if let textview = findAllTextViewsInView(detailViewController.view).first, let label = findAllLabelsInView(detailViewController.view).first, let image = findAllImagesInView(detailViewController.view).first {
                
                switch profilePickerController.selectedSegmentIndex {
                case 0:
                    textview.text = ""
                    label.text = "N/A"
                    image.image = UIImage.init(named: "jonDoe")
                case 1:
                    textview.text = DataManager.fetchData
                case 2:
                    if shouldCheckForImage {
                        textview.text = ""
                        label.text = "N/A"
                        image.image = UIImage.init(named: "jonDoe")
                    } else {
                        shouldCheckForImage = true
                    }
                default:
                    break
                }
            }
        }
    }
}


