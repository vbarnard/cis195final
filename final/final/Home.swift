//
//  CTVC.swift
//  app4-Vanessa-Barnard
//
//  Created by Vanessa Barnard on 10/22/20.
//

import UIKit

class Home: UIViewController {
    
    var parks : APIdata?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let session = URLSession.shared
                let url = URL(string: "https://developer.nps.gov/api/v1/parks?&api_key=CiNVeCFCAXobJRNSAzadDNEAKxAcQuJnNAog2hB9")!
                let task = session.dataTask(with: url, completionHandler: { data, response, error in

                    if error != nil {
                        return
                    }

                    do {
                        //dump(data)
                        let json = try JSONDecoder().decode(APIdata.self, from: data! )
                        self.parks = json
                        //dump(self.parks)
                        //self.db.collection("parks").addDocument(data: ["data" : json])
                        //print(json)
                        DispatchQueue.main.async {
                            //self.table.reloadData()
                        }


                    } catch {
                        print("Error during JSON serialization: \(error.localizedDescription)")
                    }

                })

                task.resume()

       DispatchQueue.main.async {

       }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?) {
        
        if (segue.identifier == "fullname") {
            let vc = segue.destination as! Table
            var avg = 0
            var data = ""
            for park in parks!.data {
                data.append(park.fullName)
                if avg == 0 {
                    avg = park.fullName.split(separator: " ").count
                } else {
                    avg += park.fullName.split(separator: " ").count
                    avg = avg/2
                }
                
            }
            vc.data = data
            vc.avg = avg
            
        }
        
        if (segue.identifier == "description") {
            let vc = segue.destination as! Table
            var avg = 0
            var data = ""
            for park in parks!.data {
                data.append(park.description)
                if avg == 0 {
                    avg = park.description.split(separator: " ").count
                } else {
                    avg += park.description.split(separator: " ").count
                    avg = avg/2
                }
                
            }
            vc.data = data
            vc.avg = avg
        }

    }

}
