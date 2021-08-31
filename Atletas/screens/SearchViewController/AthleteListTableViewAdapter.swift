//
//  AthleteListTableViewAdapter.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 31/08/21.
//
import UIKit

class AthleteListTableViewAdapter: NSObject, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "athleteCell", for: indexPath) as! AthleteListItemCell
        cell.configure(name: "name", description: "desc")
        return cell
    }
}
