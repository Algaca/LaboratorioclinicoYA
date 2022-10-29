package co.edu.unab.apirest.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity 
@Table(name = "cita")
@NoArgsConstructor   
@AllArgsConstructor 
@Getter
@Setter 
public class CitaModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idCita;
    private String nombreDoctor;
    private String servicio;
    private String fecha; 
}
