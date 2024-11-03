library ieee;
use ieee.std_logic_1164.all;

entity comparador is 
	port(A,B: in std_logic_vector(9 downto 0);
		  AmaiorB, AmenorB, AigualB: out std_logic);
end comparador;

architecture logica of comparador is
	
	signal AxnorsB, ands: std_logic_vector(9 downto 0);
	signal igual, maior: std_logic;
begin 
	--- igualdade
	AxnorsB <= A xnor B; 	
	igual <= AxnorsB(0) and AxnorsB(1) and AxnorsB(2) and AxnorsB(3) and AxnorsB(4) and 
				  AxnorsB(5) and AxnorsB(6) and AxnorsB(7) and AxnorsB(8) and AxnorsB(9);
	--- A > B
	ands(9) <= AxnorsB(9) and AxnorsB(8) and AxnorsB(7) and AxnorsB(6) and AxnorsB(5) and 
				  AxnorsB(4) and AxnorsB(3) and AxnorsB(2) and AxnorsB(1) and A(0) and not B(0);
				  
	ands(8) <= AxnorsB(9) and AxnorsB(8) and AxnorsB(7) and AxnorsB(6) and AxnorsB(5) and 
				  AxnorsB(4) and AxnorsB(3) and AxnorsB(2) and A(1) and not B(1);
				
	ands(7) <= AxnorsB(9) and AxnorsB(8) and AxnorsB(7) and AxnorsB(6) and AxnorsB(5) and 
				  AxnorsB(4) and AxnorsB(3) and A(2) and not B(2);
				  
	ands(6) <= AxnorsB(9) and AxnorsB(8) and AxnorsB(7) and AxnorsB(6) and AxnorsB(5) and 
				  AxnorsB(4) and A(3) and not B(3);
	
	ands(5) <= AxnorsB(9) and AxnorsB(8) and AxnorsB(7) and AxnorsB(6) and AxnorsB(5) and A(4) and not B(4);

	ands(4) <= AxnorsB(9) and AxnorsB(8) and AxnorsB(7) and AxnorsB(6) and A(5) and not B(5);
	
	ands(3) <= AxnorsB(9) and AxnorsB(8) and AxnorsB(7) and A(6) and not B(6);
	
	ands(2) <= AxnorsB(9) and AxnorsB(8) and A(7) and not B(7);
	
	ands(1) <= AxnorsB(9) and A(8) and not B(8);
	
	ands(0) <= A(9) and not B(9);
	
	maior <= ands(0) or ands(1) or ands(2) or ands(3) or ands(4) or 
				  ands(5) or ands(6) or ands(7) or ands(8) or ands(9);
	
	----- A < B
	
	AmenorB <= not maior and not igual;
	AmaiorB <= maior;
	AigualB <= igual;
	
end logica;