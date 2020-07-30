//
//  ViewController.swift
//  GroceryList
//
//  Created by Murat Merekov on 17.07.2020.
//  Copyright © 2020 Murat Merekov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var addItemButton: UIButton!
    var removeItemButton: UIButton!
    
    var nameField: UITextField!
    var numberField: UITextField!
    
    var name: UILabel!
    var number: UILabel!
    var squadList: UILabel!
    var listLable: UILabel!
    var arr: [String] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "Player Name:"
        view.addSubview(name)
        
        number = UILabel()
        number.translatesAutoresizingMaskIntoConstraints = false
        number.text = "Player Number:"
        view.addSubview(number)
        
        squadList = UILabel()
        squadList.translatesAutoresizingMaskIntoConstraints = false
        squadList.text = ""
        squadList.font = UIFont.systemFont(ofSize: 20)
        squadList.textAlignment = .center
        view.addSubview(squadList)
        
        listLable = UILabel()
        listLable.translatesAutoresizingMaskIntoConstraints = false
        listLable.text = "Squad List:"
        listLable.font = UIFont.boldSystemFont(ofSize: 25.0)
        view.addSubview(listLable)
        
        nameField = UITextField()
        nameField.translatesAutoresizingMaskIntoConstraints = false
        nameField.text = "Enter Name"
        nameField.borderStyle = .roundedRect
        nameField.backgroundColor = .gray
        nameField.textAlignment = .center
        nameField.clearsOnBeginEditing = true
        view.addSubview(nameField)
        
        numberField = UITextField()
        numberField.translatesAutoresizingMaskIntoConstraints = false
        numberField.text = "Enter Number"
        numberField.borderStyle = .roundedRect
        numberField.backgroundColor = .gray
        numberField.textAlignment = .center
        numberField.clearsOnBeginEditing = true
        view.addSubview(numberField)
        
        addItemButton = UIButton()
        addItemButton.translatesAutoresizingMaskIntoConstraints = false
        addItemButton.setTitle("Add player to team", for: .normal)
        addItemButton.setTitleColor(.blue, for: .normal)
        addItemButton.addTarget(self, action: #selector(addPlayer), for: .touchUpInside)
        view.addSubview(addItemButton)
        
        removeItemButton = UIButton()
        removeItemButton.translatesAutoresizingMaskIntoConstraints = false
        removeItemButton.setTitle("Remove player from team", for: .normal)
        removeItemButton.setTitleColor(.red, for: .normal)
        removeItemButton.addTarget(self, action: #selector(removePlayer), for: .touchUpInside)
        view.addSubview(removeItemButton)
        
        setupConstraints()
        
    }
   
    func setupConstraints(){
        NSLayoutConstraint.activate([
            
            name.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            name.trailingAnchor.constraint(equalTo: view.centerXAnchor),
            nameField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            nameField.leadingAnchor.constraint(equalTo: name.trailingAnchor, constant: 7),
            nameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameField.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            number.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 15),
            number.trailingAnchor.constraint(equalTo: view.centerXAnchor),
            numberField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 7),
            numberField.leadingAnchor.constraint(equalTo: number.trailingAnchor, constant: 8),
            numberField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            numberField.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            addItemButton.topAnchor.constraint(equalTo: number.bottomAnchor, constant: 100),
            addItemButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            removeItemButton.topAnchor.constraint(equalTo: addItemButton.bottomAnchor, constant: 6),
            removeItemButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            listLable.topAnchor.constraint(equalTo: removeItemButton.bottomAnchor, constant: 60),
            listLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            squadList.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            squadList.topAnchor.constraint(equalTo: listLable.bottomAnchor, constant: 8)
            
        ])
        
    }
    
    @objc func addPlayer(){
        
        
        var flag1: Bool = false
        var flag2: Bool = false
        
        
        if let nameText = nameField.text, nameText != ""{
            flag1 = true
        }
        if let numberText = numberField.text, numberText != ""{
            flag2 = true
        }
        
        if flag1, flag2 {
            
            arr.append(nameField.text! + " " + numberField.text!)
            squadList.lineBreakMode = .byWordWrapping
            squadList.numberOfLines = 0
            squadList.text = squadList.text! + nameField.text!
            squadList.text = squadList.text! + " "
            squadList.text = squadList.text! + numberField.text!
            squadList.text = squadList.text! + "\n"
            
        }
        nameField.text = ""
        numberField.text = ""
    }
    
    @objc func removePlayer(){
        var flag1: Bool = false
            var flag2: Bool = false
            
            
            if let nameText = nameField.text, nameText != ""{
                flag1 = true
            }
            if let numberText = numberField.text, numberText != ""{
                flag2 = true
            }
            if flag1, flag2 {
                let str: String = nameField.text! + " " + numberField.text!
                var iter = 0
                if arr.contains(str){
                    for item in arr{
                        if(str == item){
                            arr.remove(at: iter)
                            break
                        }
                        iter += 1
                    }
                    squadList.text = ""
                    squadList.lineBreakMode = .byWordWrapping
                    squadList.numberOfLines = 0
                    for player in arr{
                        squadList.text = squadList.text! + player
                        squadList.text = squadList.text! + "\n"
                    }
                }
                nameField.text = ""
                numberField.text = ""
            }
    }

}

