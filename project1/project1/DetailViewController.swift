//
//  DetailViewController.swift
//  project1
//
//  Created by Wouter on 17/07/2022.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var selectedPictureNumber = 0
    var totalPictures = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //unwrapping not necessary because optional is assigned to optional
        title = "Picture \(selectedPictureNumber + 1) of \(totalPictures)"//selectedImage
        navigationItem.largeTitleDisplayMode = .never
        
        //unwrap optional selectedImage
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
}
