<<<<<<< Updated upstream
--biblioteca
library ieee;
use ieee.std_logic_1164.all;

--entidade
entity comparador is
	port(
		A,B: in std_logic_vector(9 downto 0);
		AmaiorB: out std_logic;
		AmenorB: out std_logic;
		AigualB: out std_logic
	);

end comparador;

--arquitetura
architecture Hardware of comparador is
	component comparador2bit is
		port(
			a1,a0: in std_logic;
			b1,b0: in std_logic;
			
			aMaiorb_baixa: in std_logic;
			aMenorb_baixa: in std_logic;
			aIgualb_baixa: in std_logic;
			
			aMaiorb: out std_logic;
			aMenorb: out std_logic;
			aIgualb: out std_logic
		);

	end component;

	signal ma1, i1, me1: std_logic; -- saída do comparador 1
	signal ma2, i2, me2: std_logic; -- saída do comparador 2
	signal ma3, i3, me3: std_logic; -- saída do comparador 3
	signal ma4, i4, me4: std_logic; -- saída do comparador 4
	
begin
	comparador1: comparador2bit port map(A(9),A(8),B(9),B(8), '0', '0', '1', ma1, me1, i1);
	comparador2: comparador2bit port map(A(7),A(6),B(7),B(6), ma1, me1, i1, ma2, me2, i2);
	comparador3: comparador2bit port map(A(5),A(4),B(5),B(4), ma2, me2, i2, ma3, me3, i3);
	
	comparador4: comparador2bit port map(A(3),A(2),B(3),B(2), ma3, me3, i3, ma4, me4, i4);
	comparador5: comparador2bit port map(A(1),A(0),B(1),B(0), ma4, me4, i4, AmaiorB, AmenorB, AigualB);

	
	
end Hardware;
=======
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
>>>>>>> Stashed changes
