//
//  CollectionViewController.swift
//  Product Browser
//
//  Created by Emil Nielsen on 18/10/2020.
//

import Foundation
import UIKit

class CollectionViewController: UIViewController {
    
    private var productManager: ProductManager!
    private var products: [Product]!
    private var selectedProduct: Product!
    
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productManager = ProductManager()
        productManager.createProducts()
        products = productManager.products
        
        productCollectionView.dataSource = self
        productCollectionView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ScrollViewController {
            vc.productDescription = selectedProduct.description
        }
    }
    
    func segueToScrollView(for product: Product) {
        selectedProduct = product
        performSegue(withIdentifier: "collectionSegue", sender: self)
    }
    
}

extension CollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let product = products[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! ProductCollectionViewCell
        cell.productImage.image = UIImage(named: product.image)
        return cell
    }
    
}

extension CollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = products[indexPath.item]
        segueToScrollView(for: product)
    }
    
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.size.width / 3
        return CGSize(width: width, height: width)
    }
    
}
