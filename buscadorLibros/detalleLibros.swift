//
//  detalleLibros.swift
//  buscadorLibros
//
//  Created by Adrian Camacho Soriano on 24/03/16.
//  Copyright © 2016 Adrian Camacho Soriano acaso. All rights reserved.
//

import UIKit

class detalleLibros: UIViewController {
    
    var nombreTitulo:String!
    var nombreAutor:String!
    
    
    @IBOutlet weak var labelTitulo: UILabel!
    
    @IBOutlet weak var labelAutor: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelTitulo.text = nombreTitulo as String
        labelAutor.text = nombreAutor as String

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
