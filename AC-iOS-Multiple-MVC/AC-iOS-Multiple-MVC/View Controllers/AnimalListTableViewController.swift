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
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return animals.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let selectedAnimal = animals[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "animalListCell", for: indexPath) as? AnimalListCell {
            cell.nameLabel.text = selectedAnimal.name
            cell.originLabel.text = selectedAnimal.origin
            cell.animalImage.image = UIImage(named: selectedAnimal.imageNumber.description)
            
            return cell
        }
        
        

        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = storyBoard.instantiateViewController(withIdentifier: "animalDetailViewController") as? AnimalDetailViewController {
            viewController.zooAnimal = animals[indexPath.row]
            navigationController?.pushViewController(viewController, animated: true)
        }
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
