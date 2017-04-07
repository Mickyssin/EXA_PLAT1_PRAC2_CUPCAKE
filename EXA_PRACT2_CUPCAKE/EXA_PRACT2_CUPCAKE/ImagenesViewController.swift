//
//  ImagenesViewController.swift
//  EXA_PRACT2_CUPCAKE
//
//  Created by administrador on 06/04/17.
//  Copyright © 2017 CUPCAKE. All rights reserved.
//

import UIKit

//Se implentan los UI para manejar el picker
class ImagenesViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    //Se crean las variables para modificar y cargar datos
    var misImages = ["1", "2", "3", "4", "5", "6", "7"]
    
    var images:[UIImage]!
    
    var seleccion = "1" //Variable de control
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //Se cargan las imagenes en el picker
        images = [UIImage(named: "1")!,UIImage(named: "2")!,UIImage(named: "3")!,UIImage(named: "4")!,UIImage(named: "5")!,UIImage(named: "6")!,UIImage(named: "7")!]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Función que regresa el renglon del pickerView
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return misImages[row]
    }
    
    //Función de las columnas del pickerView
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Modifica la altura de cada componente en el pickerView
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 300
    }
    
    //Funcion que regresa los datos al seleccionar algo en el componente (pickerView)
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        seleccion = misImages[row] //Guarda la columna seleccionada
        performSegueWithIdentifier("backDetail", sender: self) //Hace el segue "Inverso" y se envían sus datos
    }
    
    //Regresa el número de renglones en el pickerView
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return misImages.count
    }
    
    //Asigna las imagenes al picker
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
