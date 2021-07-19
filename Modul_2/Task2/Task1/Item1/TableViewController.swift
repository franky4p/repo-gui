//
//  TableViewController.swift
//  Task1
//
//  Created by macbook on 01.11.2020.
//

import UIKit
import Unrealm

class TableViewController: UITableViewController, UISearchResultsUpdating {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var users: [[Friend]] = []
    var data: [Friend] = []
    var sections: [String] = []
    var searchResults : [Friend] = []
    var token: NotificationToken?
    
    
    @IBOutlet var table_1_2: UITableView!
    
    
    func sortUser(_ items: [Friend]) {
        
        for crct in sections {
            var tmpItems: [Friend] = []
            
            for item in items {
                if crct == item.lastName.prefix(1){
                    tmpItems.append(item)
                }
            }
            users.append(tmpItems)
        }
    }
    
    func loadFriends() {
        let dataRealm = Session.shared.loadData(Friend.self)
//        token = dataRealm.observe{ [weak self] (changes) in
//            guard let tableView = self?.tableView else { return }
//            switch changes {
//            case .initial:
//                //tableView.reloadData()
//            print("init friends")
//            case .update(_, let deletions, let insertions, let modifications):
//                tableView.beginUpdates()
//                tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }), with: .automatic)
//                tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}), with: .automatic)
//                tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }), with: .automatic)
//                tableView.endUpdates()
//            case .error(let error):
//                fatalError("\(error)")
//            }
//        }
        
        dataRealm.forEach{el in
            data.append(el)
        }
        self.sections = arrayFirstCaracterName(self.data)
        self.sortUser(self.data)
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadFriends()
        
        searchController.searchResultsUpdater = self
        self.definesPresentationContext = true
        self.tableView.tableHeaderView = searchController.searchBar
        
        
        //self.tableView.reloadData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            filterContent(for: searchText)
                    
            tableView.reloadData()
            
            //request to VK
//            let requestGroup = RequestVK.requestGroupsSearch(searchText)
//            Session.shared.requestToAPI(requestGroup)
        }
    }
    
    func filterContent(for searchText: String) {
        searchResults = data.filter({ (user: Friend) -> Bool in
        let match = user.firstName.range(of: searchText, options: .caseInsensitive)
            return match != nil
            
        })
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return searchController.isActive ? 1 : self.users.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return searchController.isActive ? searchResults.count : self.users[section].count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let entry = searchController.isActive ? searchResults[indexPath.row] : users[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell_1_1", for: indexPath) as! TableViewCell

        cell.labelName.text = "\(entry.firstName) \(entry.lastName)"
        cell.imageUser.setCustomImage(entry.photo)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vController = storyboard.instantiateViewController(identifier: "details") as! CollectionViewController
        
        vController.testUser = self.users[indexPath.section][indexPath.row]
        self.navigationController?.pushViewController(vController, animated: true)
    
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionLine = sections[section]
        
        return sectionLine
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
