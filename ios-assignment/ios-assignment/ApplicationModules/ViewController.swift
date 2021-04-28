//
//  ViewController.swift
//  ios-assignment
//
//  Created by Binsu on 27/04/2021.
//

import UIKit
import BadgeHub

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet weak var notificationButton: UIBarButtonItem!
    
    var homeItems: [HomeItems] = [HomeItems]()
    
    var homeResponse: HomeResponseData?
    
    var notificationBadgeHub: BadgeHub?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationBadgeHub = BadgeHub(barButtonItem: notificationButton)
        notificationBadgeHub?.setCircleColor(UIColor.init(hex: "#91B14E"), label: .white)
        notificationBadgeHub?.setCircleBorderColor(.white, borderWidth: 1)
        notificationBadgeHub?.moveCircleBy(x: -4, y: 8)
        registerCells()
        registerHeader()
        
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .vertical
        
        homeCollectionView.collectionViewLayout = layout
        
        getHomeDetails()
    }
    
    func registerCells(){
        homeCollectionView.register(UINib(nibName: HomeItems.Slider.rawValue, bundle: nil), forCellWithReuseIdentifier: HomeItems.Slider.rawValue)
        homeCollectionView.register(UINib(nibName: HomeItems.Categories.rawValue, bundle: nil), forCellWithReuseIdentifier: HomeItems.Categories.rawValue)
        homeCollectionView.register(UINib(nibName: HomeItems.Courses.rawValue, bundle: nil), forCellWithReuseIdentifier: HomeItems.Courses.rawValue)
        homeCollectionView.register(UINib(nibName: HomeItems.Consultants.rawValue, bundle: nil), forCellWithReuseIdentifier: HomeItems.Consultants.rawValue)
    }
    
    func registerHeader(){
        homeCollectionView.register(UINib(nibName: "HeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionReusableView")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return homeItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = homeItems[indexPath.section]
        if(item == .Slider){
            let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: item.rawValue, for: indexPath) as! SliderCollectionViewCell
            cell.setData(slidersDataHome: homeResponse!.slider)
            return cell
        }
        if(item == .Categories){
            let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: item.rawValue, for: indexPath) as! CategoriesCollectionViewCell
            cell.setData(categoryDataHome: homeResponse!.categories)
            return cell
        }
        if(item == .Courses){
            let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: item.rawValue, for: indexPath) as! CoursesCollectionViewCell
            cell.setData(courseDataHome: homeResponse!.courses)
            return cell
        }
        if(item == .Consultants){
            let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: item.rawValue, for: indexPath) as! ConsultantsCollectionViewCell
            cell.setData(data: homeResponse!.consultants)
            cell.backgroundColor = UIColor.init(hex: "#FBF6F3")
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = homeItems[indexPath.section]
        return sizeForItem(item: item, collectionView: collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if(section != 0){
            return CGSize(width: collectionView.frame.width, height: 52)
        }
        else{
            return CGSize()}
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let item = homeItems[indexPath.section]
        if(item == .Slider)
        {
            return UICollectionReusableView()
        }
        else {
            let header = homeCollectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCollectionReusableView", for: indexPath) as! HeaderCollectionReusableView
            if(item == .Categories){
                header.title.text = "Explore Consultations"
            }
            if(item == .Courses){
                header.title.text = "Explore Courses"
            }
            if(item == .Consultants){
                header.title.text = "Online Now"
                header.allButton.isHidden = true
                header.backgroundColor = UIColor.init(hex: "#FBF6F3")
            }
            return header
        }
    }

    func getHomeDetails(){
        HomeAPI().getHome { (response) in
            print(response)
            if(response.data != nil){
                self.homeResponse = response.data
                if(!response.data.slider.isEmpty){
                    self.homeItems.append(.Slider)
                }
                if(!response.data.categories.isEmpty){
                    self.homeItems.append(.Categories)
                }
                if(!response.data.courses.isEmpty){
                    self.homeItems.append(.Courses)
                }
                if(!response.data.consultants.isEmpty){
                    self.homeItems.append(.Consultants)
                }
                self.homeCollectionView.reloadData()
                self.notificationBadgeHub?.setCount(response.data.notificationCount)
            }
        } failed: { (error) in
        }
    }
    
    func sizeForItem(item: HomeItems, collectionView : UICollectionView) -> CGSize{
        
        switch item {
        
        case .Slider:
            return CGSize(width: collectionView.frame.width, height: 250)
         
        case .Categories:
            return CGSize(width: collectionView.frame.width, height: 82)
            
        case .Courses :
            return CGSize(width: collectionView.frame.width, height: 160)
            
        case .Consultants:
            return CGSize(width: collectionView.frame.width, height: 100)
        }
    }
}

