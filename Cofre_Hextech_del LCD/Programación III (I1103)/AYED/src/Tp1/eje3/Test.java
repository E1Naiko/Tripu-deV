package Tp1.eje3;

public class Test {
	
	public static void main (String[] args) {
		Estudiante[] estu = new Estudiante[2];
		Profesor[] prof = new Profesor[3];
		estu[0] = new Estudiante("Alam","Meza","g21","alameza","enrique segoviano");
		estu[1] = new Estudiante("Meza","Meza","g21","azemeza","enrique segoviano");
		prof[0] = new Profesor("Alam","Meza","g21","alameza","enrique segoviano");
		prof[1] = new Profesor("Meza","Meza","g21","azemeza","enrique segoviano");
		prof[2] = new Profesor("Alam","Meza","g21","alameza","enrique segoviano");
		for (int i= 0; i < 2; i++) {
			System.out.println(estu[i].toString());
		}
		for(int j= 0; j< 3; j++) {
			System.out.println(prof[j].toString());
		}
		
	}
}
