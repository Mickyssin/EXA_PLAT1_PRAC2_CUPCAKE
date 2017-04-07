//
//  DetalleViewController.swift
//  EXA_PRACT2_CUPCAKE
//
//  Created by LEONARDO on 05/04/17.
//  Copyright © 2017 CUPCAKE. All rights reserved.
//

import UIKit

// protocolo usado para enviar los datos de regreso
protocol DataEnteredDelegate: class {
    func userDidEnterInformation(name: String, desc: String, loca: String, ashu: String)
}

class DetalleViewController: UIViewController{
    //outlests de la vista
    @IBOutlet weak var imgRest: UIImageView!
    @IBOutlet weak var lblNombreRest: UITextField!
    @IBOutlet weak var lblDescpRest: UITextField!
    @IBOutlet weak var lblDireccionRest: UITextField!
    
    @IBAction func cambiarImagen(sender: AnyObject) {
        
    }
    //Variable del delegate
    weak var delegate: DataEnteredDelegate? = nil
    //Variables para usar aqui
    var texto = ""
    var location = ""
    var desc = ""
    var name = ""
    var ashu = ""
    
    //Se cargan los datos
    override func viewDidLoad() {
        super.viewDidLoad()
        let imagenTexto = UIImage(named: texto)
        imgRest.image = imagenTexto
        lblDescpRest.text = desc
        lblDireccionRest.text = location
        lblNombreRest.text = name
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Los datos que se van a enviar
    @IBAction func enviarInfo(sender: UIButton) {
        //Metodo a llamar cuando la clase usa el delegate creado
        delegate?.userDidEnterInformation(lblNombreRest.text!, desc: lblDescpRest.text!, loca: lblDireccionRest.text!, ashu: texto)

        //Se regresa al ViewController anterior
        self.navigationController?.popViewControllerAnimated(true)
    }
    

    //Acción para asignar la modificación de la imagen
    @IBAction func unwindImagenesView(segue:UIStoryboardSegue){
        let sourceViewController = segue.sourceViewController as! ImagenesViewController //Controlador para manejo de datos
        imgRest.image = UIImage(named: sourceViewController.seleccion) //Cambio de imagen (solo visual)
        texto = sourceViewController.seleccion //Manejador para enviar el nombre de la imagen
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
