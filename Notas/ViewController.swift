//
//  ViewController.swift
//  Notas
//
//  Created by Jose Cristobal on 23/04/19.
//  Copyright © 2019 Jose Cristobal. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    var cursos:[Curso] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        obtenerCursos()
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        let curso = cursos[indexPath.row]
        if editingStyle == .delete {
            print("Delete")
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            context.delete(curso)
            cursos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cursos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let curso = cursos[indexPath.row]
        cell.textLabel?.text = "📖\(curso.nombre!)"
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath){
        let curso = cursos[indexPath.row]
        if curso.notaFinal >= 13{
            cell.backgroundColor = UIColor.green
        }else{
            cell.backgroundColor = UIColor.red
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let curso = cursos[indexPath.row]
        performSegue(withIdentifier: "detalleSegue", sender: curso)
    }
    
    @IBAction func agregarCurso(_ sender: Any) {
        performSegue(withIdentifier: "agregarSegue", sender: nil)
    }
    func obtenerCursos(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            cursos = try context.fetch(Curso.fetchRequest()) as! [Curso]
        } catch {
            print("Ha ocurrido un error")
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "detalleSegue"{
            let siguienteVC = segue.destination as! DetalleCursoViewController
            siguienteVC.curso = sender as? Curso
            
        }
    }
    
}

