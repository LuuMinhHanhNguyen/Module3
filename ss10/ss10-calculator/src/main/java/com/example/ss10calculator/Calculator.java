package com.example.ss10calculator;

public class Calculator {
    public static double calculate(double firstNum, String operator, double secondNum) {
        switch (operator) {
            case "+":
                return firstNum + secondNum;
            case "-":
                return firstNum - secondNum;
            case "*":
                return firstNum * secondNum;
            case "/":
                if (secondNum != 0)
                    return firstNum / secondNum;
                else
                    throw new RuntimeException("Can't divide by zero");
            default:
                throw new RuntimeException("Invalid operation");
        }
    }
}
