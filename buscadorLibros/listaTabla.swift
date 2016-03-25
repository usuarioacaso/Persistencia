//
//  listaTabla.swift
//  buscadorLibros
//
//  Created by Adrian Camacho Soriano on 24/03/16.
//  Copyright © 2016 Adrian Camacho Soriano acaso. All rights reserved.
//

import UIKit

class listaTabla: UITableViewController {
    
    //var tablaLibros:NSDictionary = NSDictionary()
    var tablaLibros:NSMutableArray! = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    @IBAction func retornoListaTabla(segue: UIStoryboardSegue)
    {
        let registroTabla = segue.sourceViewController as! buscaLibrosVC
        let textotitulo = registroTabla.muestraTitulo.text
        let textoautor = registroTabla.muestraAutor.text
        let nuevoDic = ["ktitulo":textotitulo,"kautor":textoautor]
        tablaLibros.addObject(nuevoDic)
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tablaLibros.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("listaCelda", forIndexPath: indexPath)
        
        let data = tablaLibros[indexPath.row] as! NSDictionary
        //let data = tablaLibros[indexPath.row] as! String
        let nombreTitulo = data["ktitulo"] as! String
        print(nombreTitulo)
        
        //let nombreAutor = data["kautor"] as! String
        
        cell.textLabel?.text = nombreTitulo
        //cell.detailTextLabel?.text = nombreAutor
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        let identificador = segue.identifier as NSString!
        
        if(identificador.isEqualToString("caminoDetalle")){
            
            let indexPath = tableView.indexPathForSelectedRow as NSIndexPath!
            
            let data = tablaLibros[indexPath.row] as! NSDictionary
            let titulo = data["ktitulo"] as! String
            let autor = data["kautor"] as! String
            
            let vistaDetalle = segue.destinationViewController as! detalleLibros
            vistaDetalle.nombreTitulo = titulo
            vistaDetalle.nombreAutor = autor
        }
    }

}
