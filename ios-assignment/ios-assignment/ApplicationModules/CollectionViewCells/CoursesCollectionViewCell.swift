//
//  CoursesCollectionViewCell.swift
//  ios-assignment
//
//  Created by Binsu on 27/04/2021.
//

import UIKit

class CoursesCollectionViewCell: UICollectionViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var coursecollectionView: UICollectionView!
    
    var courseData : [Course] = [Course]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        coursecollectionView.register(UINib(nibName: "CourseChildCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CourseChildCollectionViewCell")
        
        coursecollectionView.delegate = self
        coursecollectionView.dataSource = self
        
        coursecollectionView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        
        coursecollectionView.collectionViewLayout = layout
    }
    
    func setData(courseDataHome : [Course]){
        self.courseData.removeAll()
        self.courseData = courseDataHome
        self.coursecollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return courseData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = courseData[indexPath.row]
        let cell = coursecollectionView.dequeueReusableCell(withReuseIdentifier: "CourseChildCollectionViewCell", for: indexPath) as! CourseChildCollectionViewCell
        let url = URL.init(string: item.imagePath)
        cell.imageView.kf.indicatorType = .activity
        cell.imageView.kf.setImage(with: url)
        cell.price.text = "\(item.price ?? 0)"
        cell.title.text = item.name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: coursecollectionView.frame.width*0.7, height: coursecollectionView.frame.height)
    }

}
