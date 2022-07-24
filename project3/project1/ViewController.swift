//
//  ViewController.swift
//  project1
//
//  Created by Wouter on 16/07/2022.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //watch the '!'. For now it's safe but in future appliances not recommended!
        //remember '!' is force unwrapping of optionals. If it fails, the app crashes.
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
                //sort the list based on numbers ascending
                //https://developer.apple.com/documentation/foundation/nsstring/1409742-localizedstandardcompare
                //
                
                pictures.sort { $0.localizedStandardCompare($1) == .orderedAscending }
            }
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            
            // 2: success! Set its selectedImage property
            vc.selectedImage = pictures[indexPath.row]
            vc.totalPictures = pictures.count
            vc.selectedPictureNumber = pictures.firstIndex(of: pictures[indexPath.row]) ?? 0
            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    //https://stackoverflow.com/questions/37938722/how-to-implement-share-button-in-swift
    @objc func shareTapped() {
        let shareMessage = "Download this app!"
        
        //create UIActivityViewController
        let vc = UIActivityViewController(activityItems: [shareMessage], applicationActivities: [])
        //without this code it will crash on Ipad.
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}


