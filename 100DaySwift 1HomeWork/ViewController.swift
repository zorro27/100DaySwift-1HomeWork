//
//  ViewController.swift
//  100DaySwift 1HomeWork
//
//  Created by Роман Зобнин on 28.03.2022.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        let fm = FileManager.default
        let patch = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: patch)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let newArray = rename(array: pictures)
        cell.textLabel?.text = newArray[indexPath.row]
        return cell 
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController{
            vc.selectedImage = pictures[indexPath.row]
            vc.numberImage = indexPath.row + 1
            vc.totalNumber = pictures.count
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    func rename(array: [String]) -> [String] {
        var newArray = [String]()
        let sortedArray = array.sorted()
        for (index, value) in sortedArray.enumerated() {
            newArray.append("Изображение \(index + 1), значением \(value) из \(array.count)")
        }
        return newArray
    }
}

