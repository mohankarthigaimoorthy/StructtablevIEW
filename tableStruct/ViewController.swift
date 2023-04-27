//
//  ViewController.swift
//  tableStruct
//
//  Created by Mohan K on 20/02/23.
//

import UIKit

struct Item {
    var id : Int
    var title : String
    var topic : String
    var status : Int
    var priority: Int
    var color: UIColor
}
class tableCell : UITableViewCell {
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
}
class ViewController: UIViewController {
    
    @IBOutlet weak var myTable: UITableView!
    
    var allItems = [Item(id: 1, title: "do", topic: "challenge", status: 1, priority: 1, color: .brown), Item(id: 2, title: "does", topic: "work", status: 2, priority: 2,  color: .lightGray), Item(id: 3, title: "did", topic: "domain", status: 3, priority: 3, color: .cyan), Item(id: 4, title: "done", topic: "dark", status: 4, priority: 4, color: .gray), Item(id: 5, title: "redo", topic: "white", status: 5, priority: 5, color: .magenta) ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func plan () {
        myTable.dataSource = self
        myTable.delegate = self
        DispatchQueue.main.async {
            self.myTable.reloadData()
        }
    }
    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = myTable.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! tableCell
        cell.label1.text  = allItems[indexPath.row].title
        cell.label2.text = "\(allItems[indexPath.row].status)"
        cell.label3.text = "\(allItems[indexPath.row].priority)"
        cell.label4.text = allItems[indexPath.row].topic
        cell.backgroundColor = allItems[indexPath.row].color
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "View", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "View"
        {
            let ViewController = segue.destination as! singleViewController
            ViewController.delegate = self
            ViewController.allItems = allItems
        }
    }
}

extension ViewController: showDelegate {
    func shine(_ input: Item?) {
        guard let item = input else{return}
        
        if let index = allItems.firstIndex(where: {$0.id == item.id})
        {
            allItems[index] = item
            DispatchQueue.main.async {
                self.myTable.reloadData()
            }
        }
    }
    
    
}
