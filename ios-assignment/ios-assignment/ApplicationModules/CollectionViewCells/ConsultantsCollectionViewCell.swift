//
//  ConsultantsCollectionViewCell.swift
//  ios-assignment
//
//  Created by Binsu on 27/04/2021.
//

import UIKit

class ConsultantsCollectionViewCell: UICollectionViewCell,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var consultantsCollectionView: UICollectionView!
    
    var consultants : [Consultant] = [Consultant]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        consultantsCollectionView.register(UINib(nibName: "ConsultantsChildCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ConsultantsChildCollectionViewCell")
        
        consultantsCollectionView.delegate = self
        consultantsCollectionView.dataSource = self
        
        consultantsCollectionView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        
        consultantsCollectionView.collectionViewLayout = layout
    }

    func setData(data: [Consultant])
    {
        self.consultants.removeAll()
        self.consultants = data
        self.consultantsCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.consultants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let consultant = consultants[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ConsultantsChildCollectionViewCell", for: indexPath) as! ConsultantsChildCollectionViewCell
        cell.name.text = consultant.name
        let url = URL.init(string: consultant.imagePath)
        cell.thumbNail.kf.indicatorType = .activity
        cell.thumbNail.kf.setImage(with: url)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 70, height: 100)
    }
}
