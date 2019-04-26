//
//  CrearCursoViewController.swift
//  Notas
//
//  Created by Jose Cristobal on 25/04/19.
//  Copyright © 2019 Jose Cristobal. All rights reserved.
//

import UIKit

class CrearCursoViewController: UIViewController {
    
    @IBOutlet weak var txtNombreCurso: UITextField!
    @IBOutlet weak var txtPracticas: UITextField!
    @IBOutlet weak var txtLabs: UITextField!
    @IBOutlet weak var txtExamen: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func agregar(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let curso = Curso(context: context)
        curso.nombre = txtNombreCurso.text!
        curso.promPracs = Float(txtPracticas.text!)!
        curso.promLabs = Float(txtLabs.text!)!
        curso.examFinal = Float(txtExamen.text!)!
        var notaFinal : Float
        notaFinal = (curso.promLabs + curso.promPracs + curso.examFinal) / 3
        curso.notaFinal = notaFinal
        navigationController!.popViewController(animated: true)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
}

