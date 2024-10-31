library ieee;
use ieee.std_logic_1164.all;

entity Mux_2x1 is
	port(cin, val0, val1: in std_logic;
		  cout: out std_logic);
end Mux_2x1;

architecture logica of Mux_2x1 is
begin 
	cout <= (val0 and not cin) or (val1 and cin);
end logica;
			