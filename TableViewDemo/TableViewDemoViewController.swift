//
//  TableViewDemoViewController.swift
//  TableViewDemo
//
//  Created by Михаил Федоров on 10.07.17.
//  Copyright © 2017 Михаил Федоров. All rights reserved.
//

import UIKit

class TableViewDemoViewController: UIViewController {
    
    @IBOutlet weak var TableVew: UITableView!
    //наша модель
    var strings:[String] = "The designated initializer. If you subclass UIViewController, you must call the super implementation of this method, even if you aren't using a NIB.  (As a convenience, the default init method will do this for you,".components(separatedBy: " ")//разбили приложения на состовные части после пробела идет новая часть.разбили на подстроки

    override func viewDidLoad() {
        super.viewDidLoad()

        //станет lелегатом тейблвью,реализовава протокол UITTABLEVIEW DataSourse
        TableVew.dataSource = self
        
        // Do any additional setup after loading the view.
    }
}

extension TableViewDemoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return strings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //1. Запросим прототип у таблицы
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        
        //2. Найдем модель для конкретного индекса
        
        let text = strings[indexPath.row] //возращает номер строки
        
        //3. Настроим его в соответствии с его моделью
        
        cell.textLabel?.text = text
        cell.detailTextLabel?.text = "[\(indexPath.row)]"
        
        return cell
        
    }
    
}
