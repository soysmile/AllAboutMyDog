//
//  ViewController.swift
//  MoreAboutYourDog
//
//  Created by George Heints on 15.01.2018.
//  Copyright © 2018 George Heints. All rights reserved.
//

import UIKit

struct info : Decodable {
    let dogs : dogs?
}
struct dogs : Decodable{
    let name_ru : String
    let name_en : String
    let descr_ru : String
    let descr_en : String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://raw.githubusercontent.com/dariusk/corpora/master/data/animals/dogs.json"
        guard let urlPath = URL(string: url) else {return}
        URLSession.shared.dataTask(with: urlPath) { (data, response, error) in
            guard let data = data else{return}
            guard error == nil else {return}
            do{
                let one = try JSONDecoder().decode(info.self, from: data)
                print(one)
            }
            catch{
                print("error")
            }
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    func dogList(){
        
        let path = Bundle.main.path(forResource: "dogs", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            
            let test = try JSONDecoder().decode(info.self, from: data)
        }
       
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dogCell") as! DogTableViewCell
        
        
        return cell
    }
}

