//
//  ColorTableVC.swift
//  color-[iOS]
//
//  Created by Praval Gautam on 25/04/23.
//

import UIKit

class ColorTableVC: UIViewController{
    
    var colors:[UIColor]=[]   // array of color
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createRandomColor()
        
        
    }
    
    func createRandomColor(){
        for _ in 0..<50{
            colors.append(randomColor())   // adding colors to array 
            
        }
    }
    
    func randomColor()->UIColor{
        let randomcolor = UIColor(red: CGFloat.random(in: 0...1),
                                  green: CGFloat.random(in: 0...1),
                                  blue: CGFloat.random(in: 0...1),
                                  alpha: 1)
        return randomcolor
    }
    
    //sending data to color detail file
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! ColorDetailVC
        destVC.color = sender as? UIColor
        
    }
   //sending data to color detail file
    
}
    extension ColorTableVC:UITableViewDelegate,UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return colors.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "colorcells") else{
                return UITableViewCell()
            }
            cell.backgroundColor = colors[indexPath.row]
            
            return cell
        
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let color = colors[indexPath.row]
            performSegue(withIdentifier: "ToColorDetailVC", sender: color)
        }
    }

