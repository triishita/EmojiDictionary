//
//  EmojiTableViewController.swift
//  emojiDictionary
//
//  Created by Gunjan Mishra on 01/10/24.
//

import UIKit

class EmojiTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationItem.leftBarButtonItem = self.editButtonItem

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @IBAction func editButtonTapped(_ sender: UIBarButtonItem) {
        let editstatus = tableView.isEditing
        tableView.setEditing(!editstatus, animated: true)
        
        
    }
    
    @IBAction func unwindToEmojiTVC(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveunwind", let sourceVC = segue.source as? AddEditTableViewController, let emoji = sourceVC.emoji else {return}
        
        if let indexPath = tableView.indexPathForSelectedRow{
            emojis[indexPath.row] = emoji
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        else {
            let newIndexPath = IndexPath(row: emojis.count, section: 0)
            emojis.append(emoji)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return emojis.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath) as! CustomTableViewCell
        let emoji = emojis[indexPath.row]
        //var content = cell.defaultContentConfiguration()
       // content.text = "\(emoji.symbol) - \(emoji.name)"
       // content.secondaryText = emoji.description
        //cell.contentConfiguration = content
       // cell.accessoryType = .detailButton
            // Configure the cell...
        cell.updateCell(with: emoji)
        cell.showsReorderControl = true
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        //print(indexPath)
        let emoji = emojis[indexPath.row]
        let alert = UIAlertController(title: emoji.symbol, message: emoji.usage, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK but red", style: .destructive)
        let alertAction2 = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(alertAction)
        alert.addAction(alertAction2)
        present(alert, animated: true)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            emojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .middle)
            print(emojis)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    


    // Override to support rearranging the table view.
    //Gunjan - to change the corresponding emoji data
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let removedEmoji = emojis.remove(at: fromIndexPath.row)
        emojis.insert(removedEmoji, at: to.row)
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .delete
    }

    
    @IBSegueAction func addEditEmoji(_ coder: NSCoder, sender: Any?) -> AddEditTableViewController? {
        if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell){
            let emojiToEdit = emojis[indexPath.row]
            return AddEditTableViewController(coder: coder, emoji: emojiToEdit)
        }
        else {
            return AddEditTableViewController(coder: coder, emoji: nil)
        }
    }
    

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
