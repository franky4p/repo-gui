//
//  TableViewControllerGroup.swift
//  Task1
//
//  Created by macbook on 01.11.2020.
//

import UIKit

class TableViewControllerGroup: UITableViewController {

    @IBOutlet var table_2_2: UITableView!
    
    //var data = createGroup()
    var data: [MyGroup] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getListGroup()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    func getListGroup() {
        let request = RequestVK.requestListGroupsUser()
        Session.shared.requestToAPI(url: request, typeReceiver: Root<MyGroup>.self) {
            results in
            switch results {
            case .success(let response):
                response.response.items.forEach {
                 self.data.append($0)
                }
                self.tableView.reloadData()
                
                Session.shared.saveData(self.data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell_2_1", for: indexPath) as! TableViewCellGroup

        cell.labelName.text = "\(self.data[indexPath.row].name)"
        cell.imageGroup.setCustomImage(self.data[indexPath.row].photo)

        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editGroup = UITableViewRowAction(style: .normal, title: "Выйти из группы") { [self] action, index in data.remove(at: indexPath.row); tableView.reloadData()}
        
        return [editGroup]
    }

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
