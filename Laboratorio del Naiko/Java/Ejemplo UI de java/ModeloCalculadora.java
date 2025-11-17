// CalculatorModel.java
public class ModeloCalculadora {

    // The actual state (data) is minimal for this simple app, 
    // but the calculation logic belongs here.

    /**
     * Adds two integers and returns the sum.
     * @param num1 First integer
     * @param num2 Second integer
     * @return The sum of the two numbers
     */
    public int sumar(int num1, int num2) {
        return num1 + num2;
    }
    public String txtSumar(int num1, int num2){
        return "n1: " + num1 + ", n2: " + num2 + " res: " + sumar(num1, num2);
    }
}