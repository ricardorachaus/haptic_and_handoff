//
//  TableViewController.swift
//  HapticEngineAndHandoff
//
//  Created by Rachaus on 17/09/17.
//  Copyright © 2017 Rachaus. All rights reserved.
//

import UIKit
import WatchConnectivity

class TableViewController: UITableViewController {
    
    let haptics = ["Start", "Stop", "Click", "Notification", "DirectionUp", "DirectionDown", "Success", "Failure", "Retry"]

    
    // MARK: - Table view

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return haptics.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        cell.textLabel?.text = haptics[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "InformationSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            
            let destination = segue.destination as! InformationViewController
            
            switch indexPath.row {
            case 0:
                destination.haptic = haptics[0]
                
            case 1:
                destination.haptic = haptics[1]
                
            case 2:
                destination.haptic = haptics[2]
                
            case 3:
                destination.haptic = haptics[3]
                
            case 4:
                destination.haptic = haptics[4]
                
            case 5:
                destination.haptic = haptics[5]
                
            case 6:
                destination.haptic = haptics[6]
                
            case 7:
                destination.haptic = haptics[7]
                
            case 8:
                destination.haptic = haptics[8]
                
            default:
                print("Nenhum dos casos")
                break
            }
            
        }
    
    }
    
}
