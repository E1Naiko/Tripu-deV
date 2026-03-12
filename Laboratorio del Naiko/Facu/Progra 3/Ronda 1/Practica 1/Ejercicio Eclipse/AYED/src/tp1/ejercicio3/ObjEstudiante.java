package tp1.ejercicio3;
/* a. Cree una clase llamada Estudiante con los atributos especificados abajo y sus
	correspondientes métodos getters y setters (haga uso de las facilidades que brinda
	eclipse)
		● nombre
		● apellido
		● comision
		● email
		● direccion
		
 c. Agregue un método de instancia llamado tusDatos() en la clase Estudiante y en la
	clase Profesor, que retorne un String con los datos de los atributos de las mismas.

	Para acceder a los valores de los atributos utilice los getters previamente
	definidos.
*/

public class ObjEstudiante {
	private String nombre;
	private String apellido;
	private int comision;
	private String email;
	private String direccion;
		
	public ObjEstudiante(String nombre, String apellido, int comision, String email, String direccion) {
		this.nombre = nombre;
		this.apellido = apellido;
		this.comision = comision;
		this.email = email;
		this.direccion = direccion;
	}

	public String getApellido() {
		return apellido;
	}
	
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}



	public int getComision() {
		return comision;
	}



	public void setComision(int comision) {
		this.comision = comision;
	}
	
	
	
	
	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getDireccion() {
		return direccion;
	}



	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}



	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	
	
	public String tusDatos(){
		return "Datos - Estudiante: " +
				getNombre() + " - " +
				getApellido() + " - " +
				getComision() + " - " +
				getEmail() + " - " +
				getDireccion();
	}
	
	
	
	@Override
	public String toString() {
		return "Datos - Estudiante: " +
				getNombre() + " - " +
				getApellido() + " - " +
				getComision() + " - " +
				getEmail() + " - " +
				getDireccion();
	}
}
