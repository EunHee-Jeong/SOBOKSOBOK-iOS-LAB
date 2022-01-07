//
//  ThirdVC.swift
//  xib-practice-seondal
//
//  Created by 김선오 on 2022/01/06.
//

import UIKit

class ThirdVC: UIViewController {

    @IBOutlet weak var CollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CollectionView.dataSource = self
        CollectionView.delegate = self
        CollectionView.register(CollectionViewCell.self)
    }
}

extension ThirdVC : UICollectionViewDelegate {
    
}

extension ThirdVC : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: CollectionViewCell.self)
        
        return cell
    }
    
    
}
