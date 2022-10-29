package co.edu.unab.apirest.Repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import co.edu.unab.apirest.models.CitaModel;
@Repository
public interface CitaRepository extends CrudRepository<CitaModel, Integer>{
    
}
