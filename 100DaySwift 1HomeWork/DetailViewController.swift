//
//  DetailViewController.swift
//  100DaySwift 1HomeWork
//
//  Created by Роман Зобнин on 28.03.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var selectedImage: String?
    var numberImage: Int = 0
    var totalNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let image = selectedImage {
            imageView.image =  UIImage(named: image )
        }
        self.title = "Изображение \(numberImage) из \(totalNumber)"
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
