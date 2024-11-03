library ieee;
use ieee.std_logic_1164.all;

entity Somador10bits is
	port(A,B: in std_logic_vector(9 downto 0);
		  cin: in std_logic;
		  S: out std_logic_vector(9 downto 0));
end Somador10bits;

architecture Hardware of Somador10bits is
	component somador_completo
		port (a, b, cin: in std_logic;
		  s, cout: out std_logic);
	end component;
	
	signal vaium: std_logic_vector(8 downto 0);
	
begin 
	Somador1: somador_completo
		port map(A(0),B(0),cin,S(0),vaium(0));
	Somador2: somador_completo
		port map(A(1),B(1),vaium(0),S(1),vaium(1));
	Somador3: somador_completo
		port map(A(2),B(2),vaium(1),S(2),vaium(2));
	Somador4: somador_completo
		port map(A(3),B(3),vaium(2),S(3),vaium(3));
	Somador5: somador_completo
		port map(A(4),B(4),vaium(3),S(4),vaium(4));
	Somador6: somador_completo
		port map(A(5),B(5),vaium(4),S(5),vaium(5));
	Somador7: somador_completo
		port map(A(6),B(6),vaium(5),S(6),vaium(6));
	Somador8: somador_completo
		port map(A(7),B(7),vaium(6),S(7),vaium(7));
	Somador9: somador_completo
		port map(A(8),B(8),vaium(7),S(8),vaium(8));
	Somador10: somador_completo
		port map(A(9),B(9),vaium(8),S(9),open);
end Hardware;
