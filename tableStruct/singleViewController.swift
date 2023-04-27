//
//  singleViewController.swift
//  tableStruct
//
//  Created by Mohan K on 20/02/23.
//

import UIKit

protocol showDelegate {
    func shine(_ input: Item?)
}
class singleViewController: UIViewController {
    
var allItems = [Item]()
    @IBOutlet weak var textHere: UITextField!
    
    var delegate : showDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func updateBtn(_ sender: Any) {
        
        if let index = allItems.firstIndex(where: {$0.id == 1})
        {
            allItems[index].title = textHere.text!
            allItems[index].topic = "done"
            allItems[index].color = .magenta
            
            self.delegate?.shine(allItems[index])
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
