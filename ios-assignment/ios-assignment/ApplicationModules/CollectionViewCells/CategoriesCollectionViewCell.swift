
//
//  CategoriesCollectionViewCell.swift
//  ios-assignment
//
//  Created by Binsu on 27/04/2021.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
   

    @IBOutlet weak var categoryCollectionView: UICollectionView!
   
    var categoryData: [Category] = [Category]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryCollectionView.register(UINib(nibName: "CategoryChildCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryChildCollectionViewCell")
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        categoryCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.itemSize = UICollectionViewFlowLayout.automaticSize
        
        categoryCollectionView.collectionViewLayout = layout
    }
    
    func setData(categoryDataHome : [Category]){
        self.categoryData.removeAll()
        self.categoryData = categoryDataHome
        self.categoryCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = categoryData[indexPath.row]
        let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: "CategoryChildCollectionViewCell", for: indexPath) as! CategoryChildCollectionViewCell
        cell.label.text = item.name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = categoryData[indexPath.row].name
        return CGSize.init(width: (item?.width(withConstrainedHeight: 25, font: UIFont.systemFont(ofSize: 14)) ?? 0) + 32, height: 41)
    }

}
