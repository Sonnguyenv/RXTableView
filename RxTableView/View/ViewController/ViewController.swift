//
//  ViewController.swift
//  RxTableView
//
//  Created by SonNV-D1 on 5/6/20.
//  Copyright © 2020 SonNV-D1. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let bag = DisposeBag()
    private let viewModel = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        tableView.rx.setDelegate(self).disposed(by: bag)
        
        bindTableView()
    }
    
    private func bindTableView() {
        tableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "cellId")
        
        viewModel.items
            .bind(to: tableView.rx.items(cellIdentifier: "cellId", cellType: ProductTableViewCell.self)) { (row,item,cell) in
            cell.item(item)
        }.disposed(by: bag)
        
        tableView.rx.modelSelected(Product.self)
        .subscribe(onNext: { item in
            let vc = ExampleVC(nibName: "ExampleVC", bundle: nil) 
            self.navigationController?.pushViewController(vc, animated: true)
        }).disposed(by: bag)
        
        viewModel.fetchProductList()
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
