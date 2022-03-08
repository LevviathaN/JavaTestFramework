package ui.utils;

public interface BinaryOperation<X,Y,Z> {
    Z calculate(X operand1, Y operand2);
}
