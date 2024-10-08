//
//  AddEditTableViewController.swift
//  emojiDictionary
//
//  Created by user@89 on 07/10/24.
//

import UIKit

class AddEditTableViewController: UITableViewController {
    var emoji:Emoji?
    init?(coder:NSCoder, emoji:Emoji?) {
        self.emoji = emoji
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    
    @IBOutlet weak var symbolTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var usageTextField: UITextField!
    
    func updatesaveButtonState(){
            let symbolText = symbolTextField.text ?? ""
            let nameText = nameTextField.text ?? ""
            let descriptionText = descriptionTextField.text ?? ""
            let usageText = usageTextField.text ?? ""
            saveBarButton.isEnabled = !symbolText.isEmpty && !nameText.isEmpty && !descriptionText.isEmpty && !usageText.isEmpty
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard segue.identifier == "saveunwind"
                else{return}
            
            let symbol = symbolTextField.text!
            let name = nameTextField.text!
            let description = nameTextField.text!
            let usage = usageTextField.text!
            
            emoji = Emoji(symbol: symbol, name: name, description: description, usage: usage)
            
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            if let emoji = emoji{
                title = "Edit Emoji"
                symbolTextField.text = emoji.symbol
                nameTextField.text = emoji.name
                nameTextField.text = emoji.description
                usageTextField.text = emoji.usage
                
            }else{
                title = "Add Emoji"
            }
            updatesaveButtonState()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
