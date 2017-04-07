//
//  OpinionViewController.swift
//  EXA_PRACT2_CUPCAKE
//
//  Created by administrador on 06/04/17.
//  Copyright © 2017 CUPCAKE. All rights reserved.
//

import UIKit

class OpinionViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    //Outlets de los componentes en la vista
    @IBOutlet weak var lblNRes: UILabel!
    @IBOutlet weak var lblDes: UILabel!
    @IBOutlet weak var lblDir: UILabel!
    @IBOutlet weak var imgRes: UIImageView!
    
    //Variables para usar y enviar
    var opinEst = ["star", "dos", "tres"]
    
    var images:[UIImage]!
    
    var seleccion = "1" //Variable de control
    
    var texto = ""
    var location = ""
    var desc = ""
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Se cargan los datos y se les asigna a las variables
        let imagenTexto = UIImage(named: texto)
        imgRes.image = imagenTexto
        lblDes.text = desc
        lblDir.text = location
        lblNRes.text = name
        images = [UIImage(named: "star")!,UIImage(named: "dos")!,UIImage(named: "tres")!]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Regresa la columna en el picker
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return opinEst[row]
    }
    
    //Función que modifica las columnas a mostrar en el picker
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Modifica la altura de los elementos en el picker
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 200
    }
    
    //Función que envia los datos y regresa al controlador anterior al seleccionar un elemento en el componente
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        seleccion = opinEst[row] //La variable de control se asigna los datos de lo seleccionado
        performSegueWithIdentifier("oBackV", sender: self) //El segue que ejecuta
    }
    
    //Regresa los elementos en el componente
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return opinEst.count
    }
    
    //Asigna la vista para el componente
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        let imagen = images[row]
        let imgView = UIImageView(image: imagen)
        return imgView
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
