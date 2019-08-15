//
//  StateListTableViewController.swift
//  Representative
//
//  Created by Apps on 8/14/19.
//  Copyright © 2019 DevMtnStudent. All rights reserved.
//

import UIKit

class StateListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return States.all.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StateListCell", for: indexPath)
        let state = States.all[indexPath.row]
        
        cell.textLabel?.text = state
        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "StateToReperasentatives" {
            guard let selectedIndexPath = tableView.indexPathForSelectedRow,
                let destinationVC = segue.destination as? StateDetailTableViewController else { return }
            let states = States.all[selectedIndexPath.row]
            destinationVC.state = states
        }
    }
}
