//
//  AnimalDetailViewController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Radharani Ribas-Valongo on 8/13/19.
//  Copyright © 2019 AC-iOS. All rights reserved.
//

import UIKit

class AnimalDetailViewController: UIViewController {

    var zooAnimal: ZooAnimal!
    
    
    @IBOutlet weak var animalNameLabel: UILabel!
    @IBOutlet weak var animalOrigin: UILabel!
    @IBOutlet weak var animalClassification: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    
    
    @IBOutlet weak var animalDescription: UITextView!
    
    
    
    func setUpScreen() {
        animalNameLabel.text = zooAnimal.name
        animalClassification.text = zooAnimal.classification
        animalOrigin.text = zooAnimal.origin
        image.image = UIImage(named: zooAnimal.imageNumber.description)
        animalDescription.text = zooAnimal.info
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpScreen()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
