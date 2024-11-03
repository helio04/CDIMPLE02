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