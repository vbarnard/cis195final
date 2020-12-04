//
//  CTVC.swift
//  app4-Vanessa-Barnard
//
//  Created by Vanessa Barnard on 10/22/20.
//

import UIKit

class Table: UITableViewController{

    var data : String?
    var avg : Int?
    var tb = [String]()
    var s : [String: [String]]?
    var m : Markov?
    
    @IBOutlet var table: UITableView!
    
    var parks : APIdata?
    
    func didCreate(_ contact: Contact) {
        dismiss(animated: true, completion: nil)
        table.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.m = Markov.init()
        self.s = self.m!.makeRule(input: data!, keyLength: 1)
        predict()
        //print("SUP")
        //dump(tb)
        configureRefreshControl()
        
    }
    
    func predict(){
        let string = self.m!.makeString(rule: s!, length: avg!)
        tb.append(string)
    }
    
    func configureRefreshControl () {
       // Add the refresh control to your UIScrollView object.
       refreshControl = UIRefreshControl()
       refreshControl?.addTarget(self, action:
                                          #selector(handleRefreshControl),
                                          for: .valueChanged)
    }
        
    @objc func handleRefreshControl() {
        
        predict()
        DispatchQueue.main.async {
                  self.table.reloadData()
               }
        refreshControl?.endRefreshing()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tb.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "1")!

        cell.textLabel?.text = tb[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "single", sender: tb[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?) {
        
        //dump(sender)
        
        if let str = sender as? String {
            //print(contact)
            if (segue.identifier == "single") {
                let vc = segue.destination as! Single
                vc.str = str
            }
        }
    }
    
    
}

//extension UIImageView {
//    func loadImge(withUrl url: URL) {
//           DispatchQueue.global().async { [weak self] in
//               if let imageData = try? Data(contentsOf: url) {
//                   if let image = UIImage(data: imageData) {
//                       DispatchQueue.main.async {
//                        self?.image = image
//                       }
//                   }
//               }
//           }
//       }
//}
