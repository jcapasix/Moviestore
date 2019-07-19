//
//  CategoriesViewController.swift
//  Presentation
//
//  Created by Jordan Capa on 7/18/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import UIKit

protocol CategoriesViewControllerDelegate {
    func categoryDidSelectItemAt(index:Int)
}

class CategoriesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var closeButton: UIButton!
    
    var categories:[Genre] = []
    
    let allGenres = "Todos los Generos"
    
    var delegate:CategoriesViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
    }
    
    func initView(){
    
        self.tableView.register(UINib.init(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryTableViewCell")
        view?.backgroundColor = UIColor(white: 1, alpha: 0.5)
        
        var contentInset = self.tableView.contentInset
        contentInset.top = contentInset.top + 100
        contentInset.bottom = contentInset.bottom + 150
        
        self.tableView.contentInset = contentInset
        
        self.closeButton.layer.masksToBounds = true
        self.closeButton.layer.cornerRadius = 25.0

    }
    
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.dismiss(animated: true) {
            self.delegate?.categoryDidSelectItemAt(index: indexPath.row)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as! CategoryTableViewCell
        cell.nameLabel.text = (indexPath.row == 0) ? self.allGenres : self.categories[indexPath.row - 1].name ?? ""
        return cell
    }
    
    
}
