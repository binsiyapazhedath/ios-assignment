//
//  SliderCollectionViewCell.swift
//  ios-assignment
//
//  Created by Binsu on 27/04/2021.
//

import UIKit
import CHIPageControl
import Kingfisher

class SliderCollectionViewCell: UICollectionViewCell, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var slideCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: CHIPageControlJalapeno!
    
    var slidersData: [Slider] = [Slider]()
    
    var x = 1
    var timer: Timer?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        slideCollectionView.register(UINib(nibName: "SliderChildCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SliderChildCollectionViewCell")
        
        slideCollectionView.delegate = self
        slideCollectionView.dataSource = self
        
        slideCollectionView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        
        slideCollectionView.collectionViewLayout = layout
        
        initPageControl()
    }
    
    func initPageControl()
    {
        pageControl.numberOfPages = slidersData.count
    }
    
    func setData(slidersDataHome: [Slider])
    {
        self.slidersData.removeAll()
        self.slidersData.append(contentsOf: slidersDataHome)
        self.slideCollectionView.reloadData()
        initPageControl()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slidersData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = self.slidersData[indexPath.row]
        let cell = slideCollectionView.dequeueReusableCell(withReuseIdentifier: "SliderChildCollectionViewCell", for: indexPath) as! SliderChildCollectionViewCell
        let url = URL.init(string: item.imagePath)
        cell.sliderImage.kf.indicatorType = .activity
        cell.sliderImage.kf.setImage(with: url)
        cell.title.text = item.title
        cell.subTitle.text = item.descriptionField
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.slideCollectionView.frame.width, height: self.slideCollectionView.frame.height - 20)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let total = scrollView.contentSize.width - scrollView.bounds.width
        let offset = scrollView.contentOffset.x
        let percent = Double(offset / total)
        let progress = percent * Double(self.slidersData.count - 1)
        self.pageControl.progress = progress
    }

}
