//
//  TableViewController.swift
//  Product Browser
//
//  Created by Emil Nielsen on 18/10/2020.
//

import Foundation
import UIKit

class TableViewController: UIViewController {
    
    private var productManager: ProductManager!
    private var products: [Product]!
    private var selectedProduct: Product!

    @IBOutlet weak var productTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productManager = ProductManager()
        productManager.createProducts()
        products = productManager.products
        
        productTableView.dataSource = self
        productTableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ScrollViewController {
            vc.productDescription = selectedProduct.description
        }
    }
    
    func segueToScrollView(for product: Product) {
        selectedProduct = product
        performSegue(withIdentifier: "tableSegue", sender: self)
    }
}

extension TableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = products[indexPath.item]
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! ProductTableViewCell
        cell.productName.text = product.name
        cell.productImage.image = UIImage(named: product.image)
        return cell
    }
    
}

extension TableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = products[indexPath.item]
        segueToScrollView(for: product)
    }
    
}
