//
//  LayoutValues.swift
//  myCollceionView
//
//  Created by Binsu on 16/09/2020.
//  Copyright © 2020 Binsu. All rights reserved.
//

import UIKit

extension UICollectionView{
    func getCellWidth(forColumnCount columnCount: CGFloat) -> CGFloat
    {
        let contentInset = self.contentInset.left + self.contentInset.right
        let contentWidth = self.frame.width - contentInset
            
        let totalGap = (columnCount - 1) * (collectionViewLayout as! UICollectionViewFlowLayout).minimumInteritemSpacing
        return (contentWidth - totalGap) / columnCount
    }
}
