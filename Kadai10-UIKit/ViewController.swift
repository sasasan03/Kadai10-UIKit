//
//  ViewController.swift
//  Kadai10-UIKit
//
//  Created by sako0602 on 2023/06/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let prefectures = Prefecture()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  prefectures.name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var identifier: String
        
        switch indexPath.row % 3 {
        case 0:
            identifier = "Cell1"
        case 1:
            identifier = "Cell2"
        case 2:
            identifier = "Cell3"
        default :
            fatalError("invaild")
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        var content = cell.defaultContentConfiguration()
        //print(content)
        content.text = prefectures.name[indexPath.row]
        content.secondaryText = "\(indexPath.row + 1)番目の数です"
       // content.secondaryText = "\(indexPath.row + 1)番目の数です"
       // print(">>>",content.secondaryText ?? "nil")
        cell.contentConfiguration = content
        
        return cell
    }
}
