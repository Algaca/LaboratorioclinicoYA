package co.edu.unab.apirest.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import co.edu.unab.apirest.Repositories.CitaRepository;
import co.edu.unab.apirest.models.CitaModel;

@RestController
@RequestMapping("/cita")
public class CitaController {
    @Autowired
    CitaRepository citaRepository;
    
    @GetMapping(path = "/all")
    public Iterable<CitaModel> getAllArticulos(){
        return citaRepository.findAll();
    }

    @PostMapping(path = "/guardar")
    public CitaModel saveCita(@RequestBody CitaModel articulo){
        return citaRepository.save(articulo);
    }

    @DeleteMapping(path ="/eliminar/{id}" )
    public void deleteCita(@PathVariable("id") int id){
        citaRepository.deleteById(id);
    }

}
