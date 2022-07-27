//
//  TableViewController.swift
//  project4.5
//
//  Created by Wouter on 27/07/2022.
//

import UIKit
import WebKit

class TableViewController: UITableViewController, WKNavigationDelegate{
    var websitesAllowed = ["apple.com", "hackingwithswift.com", "nu.nl"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Siteselector!"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websitesAllowed.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = websitesAllowed[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let webViewController = storyboard?.instantiateViewController(withIdentifier: "WebView") as? ViewController {
            webViewController.loadWebsite = websitesAllowed[indexPath.row]
            navigationController?.pushViewController(webViewController, animated: true)
        }
    }
}
