//
//  SecondVC.swift
//  xib-practice-seondal
//
//  Created by 김선오 on 2022/01/06.
//

import UIKit

class SecondVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var MoveToThirdVC: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
//        let nib = UINib(nibName: TableViewCell.identifier, bundle: nil)
//        tableView.register(nib, forCellReuseIdentifier: TableViewCell.identifier)
        
        tableView.register(TableViewCell.self)
    }

    @IBAction func MoveToThirdVC(_ sender: Any) {
        let thirdVC = ThirdVC.instanceFromNib()
        self.present(thirdVC, animated: true)
    }
    

}

extension SecondVC : UITableViewDelegate{
    
}

extension SecondVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else {return UITableViewCell()}
//
//        return cell
        
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: TableViewCell.self)
        return cell
    }
    
}
