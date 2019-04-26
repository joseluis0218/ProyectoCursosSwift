//
//  DetalleCursoViewController.swift
//  Notas
//
//  Created by Jose Cristobal on 25/04/19.
//  Copyright © 2019 Jose Cristobal. All rights reserved.
//

import UIKit

class DetalleCursoViewController: UIViewController {

    
    var curso : Curso? = nil
    
    @IBOutlet weak var labelCurso: UILabel!
    @IBOutlet weak var labelPracs: UILabel!
    @IBOutlet weak var labelLabs: UILabel!
    @IBOutlet weak var labelExamen: UILabel!
    @IBOutlet weak var labelNotaFinal: UILabel!
    @IBOutlet weak var labelEstado: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        labelCurso.text = curso!.nombre!
        labelPracs.text = String(curso!.promPracs)
        labelLabs.text = String(curso!.promLabs)
        labelExamen.text = String(curso!.examFinal)
        labelNotaFinal.text = String(curso!.notaFinal)
        
        if curso!.notaFinal >= 13{
            labelEstado.text = "😌 Aprobado!!"
            labelEstado.textColor = UIColor.green
        }else{
            labelEstado.text = "😰 Desaprobado!!"
            labelEstado.textColor = UIColor.red
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
