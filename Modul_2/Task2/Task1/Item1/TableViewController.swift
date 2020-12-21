//
//  TableViewController.swift
//  Task1
//
//  Created by macbook on 01.11.2020.
//

import UIKit

class TableViewController: UITableViewController, UISearchResultsUpdating {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var users: [[User]] = []
    let data = createUser()
    let sections = getSection()
    var searchResults : [User] = []
    
    @IBOutlet var table_1_2: UITableView!
    
    
    func sortUser(_ items: [User]) {
        
        for crct in sections {
            var tmpItems: [User] = []
            
            for item in items {
                if crct == item.lastName.prefix(1){
                    tmpItems.append(item)
                }
            }
            users.append(tmpItems)
        }
    }
    
    func getListOfFriends() {
        let requestFriends = RequestVK.requestListFriens()
        Session.shared.requestToAPI(requestFriends)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchController.searchResultsUpdater = self
        self.definesPresentationContext = true
        self.tableView.tableHeaderView = searchController.searchBar
        
        sortUser(data)
        self.tableView.reloadData()
        
        getListOfFriends()
        
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
        searchResults = data.filter({ (user: User) -> Bool in
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

        cell.labelName.text = "\(entry)"
        cell.imageUser.image = entry.avatar
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //при такой реализации открывается 2 экрана: 1й я как понимаю "стандартный"
        //из-за наличия seque с пустым полем test user, второй - тот который пушим с
        //переданным юзером. Вопрос как отказаться от первого показа экрана?
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
