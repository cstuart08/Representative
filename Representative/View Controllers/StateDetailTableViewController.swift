//
//  StateDetailTableViewController.swift
//  Representative
//
//  Created by Apps on 8/14/19.
//  Copyright © 2019 DevMtnStudent. All rights reserved.
//

import UIKit

class StateDetailTableViewController: UITableViewController {
    
    var state: String?
    
    var representative: [Representative] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let state = state else { return }
        RepresentativeController.searchRepresentatives(forState: state) { (representative) in
            self.representative = representative
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return representative.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RepCELL", for: indexPath) as? stateRepresentativeTableViewCell else { return UITableViewCell() }
        let rep = representative[indexPath.row]
    
        cell.representative = rep
        
        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}
