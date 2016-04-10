//
//  listaTabla.swift
//  buscadorLibros
//
//  Created by Adrian Camacho Soriano on 24/03/16.
//  Copyright © 2016 Adrian Camacho Soriano acaso. All rights reserved.
//

import UIKit
import CoreData


class listaTabla: UITableViewController {
    
    //var tablaLibros:NSMutableArray! = NSMutableArray()
    var managedObjects = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recuperarDatos()

    }
    
    func recuperarDatos(){
        
        let delegado = UIApplication.sharedApplication().delegate as! AppDelegate // con esto llamamos al managedOjectContext que nos puso coredata al clicuear
        let managedContext = delegado.managedObjectContext
        let peticion = NSFetchRequest(entityName: "Libros")
        do{
            let resultadoPeticion = try managedContext.executeFetchRequest(peticion)
            managedObjects = resultadoPeticion as! [NSManagedObject]
            
        }catch let error as NSError{
            print("No se pudo recuperer datos, Error: \(error)")
        }
    }
    
    @IBAction func retornoListaTabla(segue: UIStoryboardSegue)
    {
        let registroTabla = segue.sourceViewController as! buscaLibrosVC
        let textotitulo = registroTabla.muestraTitulo.text
        let textoautor = registroTabla.muestraAutor.text
//        let nuevoDic = ["ktitulo":textotitulo,"kautor":textoautor]
//        tablaLibros.addObject(nuevoDic)
//        tableView.reloadData()
        let delegado = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = delegado.managedObjectContext
        let entidad = NSEntityDescription.entityForName("Libros", inManagedObjectContext: managedContext)
        let managedObject = NSManagedObject(entity: entidad!, insertIntoManagedObjectContext: managedContext)
        managedObject.setValue(textotitulo, forKey: "titulo")
        managedObject.setValue(textoautor, forKey: "autor")
        do{
            try managedContext.save()
            managedObjects.append(managedObject)
        }catch let error as NSError{
            print("No se pudo guaradr los datos, error tipo\(error)")
        }
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return managedObjects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("listaCelda", forIndexPath: indexPath)
        
//        let data = tablaLibros[indexPath.row] as! NSDictionary
//        let nombreTitulo = data["ktitulo"] as! String
//        print(nombreTitulo)
        let managedObject = managedObjects[indexPath.row]
        
        //cell.textLabel?.text = nombreTitulo
        cell.textLabel?.text = managedObject.valueForKey("titulo") as? String
        
        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        let identificador = segue.identifier as NSString!
        
        if(identificador.isEqualToString("caminoDetalle")){
            
            let indexPath = tableView.indexPathForSelectedRow as NSIndexPath!
            
            //let data = tablaLibros[indexPath.row] as! NSDictionary
            let managedObject = managedObjects[indexPath.row]
            //let titulo = data["ktitulo"] as! String
            //let autor = data["kautor"] as! String
            let titulo = managedObject.valueForKey("titulo") as! String
            let autor  = managedObject.valueForKey("autor") as! String
            
            let vistaDetalle = segue.destinationViewController as! detalleLibros
            vistaDetalle.nombreTitulo = titulo
            vistaDetalle.nombreAutor = autor
        }
    }

}
