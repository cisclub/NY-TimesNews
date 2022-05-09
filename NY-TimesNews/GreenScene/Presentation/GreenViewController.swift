//
//  
//  GreenViewController.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 09/05/2022.
//
//


import UIKit


class GreenViewController: StandardViewController<GreenViewModel> {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addLeftNavigationBarItem()
        addRightNavigationBarItems()
        removeSperatorFrom()
    }
    
    private func removeSperatorFrom() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
        
    }
    func addShadowToBar() {
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.gray.cgColor
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 4.0
        self.navigationController?.navigationBar.layer.shadowOpacity = 1.0
    }
    func addLeftNavigationBarItem() {
        
        let backImage = UIImage(named: "icon_backArrow")?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.leftBarButtonItem =
        UIBarButtonItem(image: backImage, style: .plain, target: self, action: #selector(backButtonPressed(sender:)))
    }
    func addRightNavigationBarItems() {
        let infoImage = UIImage(named: "iconActionsInfoCircleInfoCircleBlack")?.withRenderingMode(.alwaysOriginal)

        let infoItem: UIBarButtonItem =  UIBarButtonItem(image: infoImage, style: .plain, target: self, action: #selector(infoButtonPressed(sender:)))
        
        
        let shareImage = UIImage(named: "icon_share_iOS")?.withRenderingMode(.alwaysOriginal)
        let shareItem: UIBarButtonItem =
        UIBarButtonItem(image: shareImage, style: .plain, target: self, action: #selector(shareButtonPressed(sender:)))
        self.navigationItem.rightBarButtonItems = [infoItem, shareItem]
    }
    
    @objc func backButtonPressed(sender:UIButton) {
        print(">>>>>>>>>>back")
    }
    
    @objc func infoButtonPressed(sender:UIButton) {
        print(">>>>>>>>>>info")
    }
    
    @objc func shareButtonPressed(sender:UIButton) {
        print(">>>>>>>>>>share")
    }
}

extension GreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = StandardCell()
        cell.textLabel?.text = "\(indexPath)"
        cell.state = .loading
        
        return cell
    }
    
    
}
