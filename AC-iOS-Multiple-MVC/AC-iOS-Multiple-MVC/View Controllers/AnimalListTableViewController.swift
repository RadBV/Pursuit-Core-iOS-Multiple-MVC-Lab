//
//  AnimalListTableViewController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Radharani Ribas-Valongo on 8/13/19.
//  Copyright © 2019 AC-iOS. All rights reserved.
//

import UIKit

class AnimalListTableViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Properties
    let animals = ZooAnimalData.zooAnimals
    let mammals = ZooAnimalData.mammals
    let amphibians = ZooAnimalData.amphibians
    let reptiles = ZooAnimalData.reptiles
    let birds =  ZooAnimalData.birds
    let insects = ZooAnimalData.insects
    
    // MARK: - Table view data source / delegates

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 5
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Mammals"
        case 1:
            return "Amphibians"
        case 2:
            return "Reptiles"
        case 3:
            return "Birds"
        case 4:
            return "Insects"
        default:
            return "Uhhhhh"
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch  section {
        case 0:
            return mammals.count
        case 1:
            return amphibians.count
        case 2:
            return reptiles.count
        case 3:
            return birds.count
        case 4:
            return insects.count
        default:
            return animals.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let mammalAnimal = mammals[indexPath.row]
        
        let amphibAnimal = amphibians[indexPath.row]
        
        let reptileAnimal = reptiles[indexPath.row]
        let birdAnimal = birds[indexPath.row]
        let insectAnimal = insects[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "animalListCell", for: indexPath) as? AnimalListCell {
            
            switch indexPath.section {
            case 0:
                cell.nameLabel.text = mammalAnimal.name
                cell.originLabel.text = mammalAnimal.origin
                cell.animalImage.image = UIImage(named: mammalAnimal.imageNumber.description)
            case 1:
                cell.nameLabel.text = amphibAnimal.name
                cell.originLabel.text = amphibAnimal.origin
                cell.animalImage.image = UIImage(named: amphibAnimal.imageNumber.description)
            case 2:
                cell.nameLabel.text = reptileAnimal.name
                cell.originLabel.text = reptileAnimal.origin
                cell.animalImage.image = UIImage(named: reptileAnimal.imageNumber.description)
            case 3:
                cell.nameLabel.text = birdAnimal.name
                cell.originLabel.text = birdAnimal.origin
                cell.animalImage.image = UIImage(named: birdAnimal.imageNumber.description)
            case 4:
                cell.nameLabel.text = insectAnimal.name
                cell.originLabel.text = insectAnimal.origin
                cell.animalImage.image = UIImage(named: insectAnimal.imageNumber.description)
            default:
                print("sorry buddy")
            }
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else { fatalError("No identifier in segue") }
     
         switch segueIdentifier {
         case "listToDetailSegue":
            guard let animalDetailVC = segue.destination as? AnimalDetailViewController else {
                fatalError("Unexpected segue VC")
            }
            guard let selectedIndexPath = tableView.indexPathForSelectedRow else {
                fatalError("No row was selected")
            }
            animalDetailVC.zooAnimal = animals[selectedIndexPath.row]
        default:
            fatalError("Unexpected segue identifier")
         }

     }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller
 

}
