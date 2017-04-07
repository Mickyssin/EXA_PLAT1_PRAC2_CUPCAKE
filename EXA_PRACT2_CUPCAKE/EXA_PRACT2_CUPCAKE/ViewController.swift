//
//  ViewController.swift
//  EXA_PRACT2_CUPCAKE
//
//  Created by LEONARDO on 05/04/17.
//  Copyright © 2017 CUPCAKE. All rights reserved.
//

import UIKit

//Se agregan los UI para el manejo de la tabla y el ultimo delegate para el manejo de los datos entre nuestro MainViewController y el DetalleVieController
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, DataEnteredDelegate {
    
    //Arreglo de nombres
    var misDatos = ["Nombre del restaurant", "Nombre del restaurant", "Nombre del restaurant",
                    "Nombre del restaurant", "Nombre del restaurant", "Nombre del restaurant",
                    "Nombre del restaurant"]
    
    //Arreglo de las direcciones
    var misDir = ["Nombre del restaurant", "Nombre del restaurant", "Nombre del restaurant",
                    "Nombre del restaurant", "Nombre del restaurant", "Nombre del restaurant",
                    "Nombre del restaurant"]
    
    //Arreglo de las descripciones
    var misDesc = ["Nombre del restaurant", "Nombre del restaurant", "Nombre del restaurant",
                    "Nombre del restaurant", "Nombre del restaurant", "Nombre del restaurant",
                    "Nombre del restaurant"]
    
    //Arreglo de imagenes de restaurants
    var misImage = ["1", "2", "3", "4", "5", "6", "7"]
    
    //Arreglo de las estrellas
    var misOpiniones = [
            ["star-e", "star-e", "star-e"], ["star-e", "star-e", "star-e"], ["star-e", "star-e", "star-e"],
            ["star-e", "star-e", "star-e"], ["star-e", "star-e", "star-e"], ["star-e", "star-e", "star-e"],
            ["star-e", "star-e", "star-e"]
    ]
    
    //Variable de estado para recibir la opinion
    var opiEstre = ""
    
    //Variable para poner opinion en compartir
    var califa = ""
    
    @IBOutlet weak var tableView: UITableView!
    
    var index = 0 //No se pierde el valor psicón de la tabla

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return misDatos.count //agarra los datos del arreglo
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let controlador = UIAlertController(title: "Tus Datos", message: misDatos[indexPath.row], preferredStyle: .Alert) //selecciona el dato en el que se dio click
        
        let boton = UIAlertAction(title: "OK", style: .Default, handler: nil) //Crea un Boton con texto OK
        controlador.addAction(boton) //poner el controlador en el boton
        presentViewController(controlador, animated: true, completion: nil) // muestra el dato al que se le dio click
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell { //cellforRow reutiliza las celdas
        
        let celda = tableView.dequeueReusableCellWithIdentifier("micelda") as! MyTable1
        
        
        celda.lblName.text = misDatos[indexPath.row] //Se le da los datos a la celda --- indexPath para saber que fila fue seleccionada
        celda.lblDir.text = misDesc[indexPath.row] // Agrega una ubicacion para todos nuestros datos
        celda.lblDesc.text = misDir[indexPath.row] //Agrega una descripcion para todos nuestros datos
        let img = UIImage(named: misImage[indexPath.row])//seleccionar una imagen
        celda.imgImage.image = img // asigna la img del restaurant a la celda
        let imgOpi1 = UIImage(named: misOpiniones[indexPath.row][0]) //Creacion de constantes/imagenes
        celda.imgOp1.image = imgOpi1 //Asignación de la imagen
        let imgOpi2 = UIImage(named: misOpiniones[indexPath.row][1]) //Creacion de constantes/imagenes
        celda.imgOp2.image = imgOpi2 //Asignación de la imagen
        let imgOpi3 = UIImage(named: misOpiniones[indexPath.row][2]) //Creacion de constantes/imagenes
        celda.imgOp3.image = imgOpi3 //Asignación de la imagen
        return celda // regresamos la celda
    }
    
    //Botones que aparecen al hacer slide sobre elemento
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        index = indexPath.row
        let compartirAct = UITableViewRowAction(style: .Default, title: "Compartir", handler: comparteRest) //Boton de compartir que usa la funcion comparteRest
        //Boton que tiene un segue hacia el view de captura para modificar los valores mostrados en el MainViewController
        let calificarAct = UITableViewRowAction(style: .Default, title: "Capturar", handler: {action in self.performSegueWithIdentifier("detalle", sender: self)})
        calificarAct.backgroundColor = UIColor .purpleColor() //Cambia el color a morado
        //Boton tiene un segue hacia el view de opinion para calificar el restaurant
        let capturaAct = UITableViewRowAction(style: .Default, title: "Calificar", handler: {action in self.performSegueWithIdentifier("sOpinion", sender: self)})
        capturaAct.backgroundColor = UIColor.cyanColor() //Cambia el color a cyan
        //Regresa los valores para que se muestren
        return [compartirAct, capturaAct, calificarAct]
    }
    
    
    //Funcion para compartir
    func comparteRest(action: UITableViewRowAction, indexPath: NSIndexPath) -> Void {
    let miTexto = "Vine a comer en " + misDatos[indexPath.row] + " este lugar es: " + califa //Selecciona el arreglo de nombres y elige en el que se dio click
    let miImagen = UIImage(named: misImage[indexPath.row]) //Selecciona el arreglo de imagenes y elige en el que se dio click
    let actController = UIActivityViewController(activityItems: [miTexto, miImagen!], applicationActivities: nil) //Junta la imagen y texto
    presentViewController(actController, animated: true, completion: nil) // crea la animacion para compartir
    }
    
    //Esta es la funcion que hace el sgue con los identificadores
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detalle" { //Compara si el identificador tiene como valor "detalle"
            let miViewController = segue.destinationViewController as! DetalleViewController //Asignacion de variable para enviar datos
            miViewController.delegate = self //Comparte informacion, asigna el delegate de el contralador
            /*Elementos que se desean enviar en el segue:
            Dato a modificar en el segue = Dato que envias desde aqui*/
            miViewController.texto = misImage[index]
            miViewController.name = misDatos[index]
            miViewController.desc = misDesc[index]
            miViewController.location = misDir[index]
        }
        else if segue.identifier == "sOpinion" { //En caso de que el identificador sea sOpinion, se realiza lo siguiente
            let opViewController = segue.destinationViewController as! OpinionViewController //Variable de control para la clase en el segue
            /*Envio de datos:
            Elemento en el otro controlador a modificar = información que se envia*/
            opViewController.texto = misImage[index]
            opViewController.name = misDatos[index]
            opViewController.desc = misDesc[index]
            opViewController.location = misDir[index]
        }
    }
    
    //Funcion para modificar los atributos del nombre, imagen, direccion y descripcion
    func userDidEnterInformation(name: String, desc: String, loca: String, ashu: String) {
        //Asignación de datos en tabla con datos modificados en el "DetalleView"
        misDatos[index] = name
        misDesc[index] = desc
        misDir[index] = loca
        misImage[index] = ashu
        //Actualización de datos de la tabla
        updateInfo()
    }
    
    //Accion que obtiene el valor de la opinion seleccionada en el OpinionView
    @IBAction func unwindOpinionView(segue:UIStoryboardSegue){
        let sourceViewController = segue.sourceViewController as! OpinionViewController //Constante para uson del los datos en el OpinionViewController
        opiEstre = sourceViewController.seleccion //Asignacion de nuestra variable de control de calificacion al valor obtenido
        actualizarEstrella(opiEstre) //Ejecuta la funcion para actualizar la opinion
    }
    
    //Funcion para actualizar la opinion
    func actualizarEstrella(opiEstrella: String){
        //Variable de coomparacion se le asigna el valor
        var opiEstrella = opiEstre
        if opiEstrella == "star"{ //Se comparan los valores
            //Se asigna el texto que representa el nombre de la imagen para modificar en cada posición del arreglo y luego actualizar
            misOpiniones[index][0] = "star"
            misOpiniones[index][1] = "star-e"
            misOpiniones[index][2] = "star-e"
            califa = "malo" //Se cambia la variable para que al momento de compartir se muestre el texto "malo"
        }else if opiEstrella == "dos"{ //Se comparan los valores
            //Se asigna el texto que representa el nombre de la imagen para modificar en cada posición del arreglo y luego actualizar
            misOpiniones[index][0] = "star"
            misOpiniones[index][1] = "star"
            misOpiniones[index][2] = "star-e"
            califa = "bueno" //Se cambia la variable para que al momento de compartir se muestre el texto "bueno!"
        }else if opiEstrella == "tres"{ //Se comparan los valores
            //Se asigna el texto que representa el nombre de la imagen para modificar en cada posición del arreglo y luego actualizar
            misOpiniones[index][0] = "star"
            misOpiniones[index][1] = "star"
            misOpiniones[index][2] = "star"
            califa = "excelente!" //Se cambia la variable para que al momento de compartir se muestre el texto "excelente!"
        }
        
        //Actualización de datos de la tabla
        updateInfo()
    }
    
    //Funcion que actualiza los datos de la tabla
    func updateInfo(){
        tableView.beginUpdates()
        tableView.reloadRowsAtIndexPaths(tableView.indexPathsForVisibleRows!, withRowAnimation: .None)
        tableView.endUpdates()
    }
    

}

