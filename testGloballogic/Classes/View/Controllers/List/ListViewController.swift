//
//  ListViewController.swift
//  testGloballogic
//
//  Created by Robert on 16-02-18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: ListViewModel = ListViewModel()
    var loading: Loading?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.registerTableView(nibName: "LaptopTableViewCell", cellIdentifier: "LaptopTableViewCell")
        
        loading = Loading()
        loading?.show()
        viewModel.getLaptop { (data, response, error) in
            
            DispatchQueue.main.async { [weak self] in
                self?.loading?.dismiss()
                if error != nil {
                    Message.show(text: "Ha ocurrido un error / Sin Internet. Intentelo mas tarde", type: .warning)
                    
                } else {
                    self?.tableView.reloadData()
                }
            }
            
        }
        
        tableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    
    func registerTableView(nibName: String, cellIdentifier: String) -> Void {
        self.tableView.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.laptop?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LaptopTableViewCell", for: indexPath) as! LaptopTableViewCell
        
        cell.configCell(data: viewModel.laptop![indexPath.row], index: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let vc = UIStoryboard(name: "DetailViewController", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            print("View controller DetailViewController not found")
            return
        }
        
        vc.laptop = viewModel.laptop?[indexPath.row]
        vc.index = indexPath
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
