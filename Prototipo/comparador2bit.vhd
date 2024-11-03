--biblioteca
library ieee;
use ieee.std_logic_1164.all;

--entidade
entity comparador2bit is
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

end comparador2bit;

--arquitetura
architecture comportamento of comparador2bit is
	signal aMaior, aMenor, aIgual: std_logic;
	
begin
	aMaior <= (a1 AND NOT b1) OR ( (a0 AND NOT b0) AND (a1 OR NOT b1) );
	aIgual <= (a1 XNOR b1) AND (a0 XNOR b0);
	aMenor <= (NOT a1 AND b1) OR ( (NOT a0 AND b0) AND (NOT a1 OR b1) );
	
	aMaiorb <= aMaiorb_baixa OR (aIgualb_baixa AND aMaior);
	aMenorb <= aMenorb_baixa OR (aIgualb_baixa AND aMenor);
	aIgualb <= aIgualb_baixa AND aIgual;
	
end comportamento;