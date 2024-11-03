library ieee;
use ieee.std_logic_1164.all;

entity somador10bits is
	port(entradaSomador, max, min: in std_logic_vector(9 downto 0);
		  c_in, up_down: in std_logic;
		  S: out std_logic_vector(9 downto 0));
end somador10bits;

architecture Hardware of somador10bits is
	component somador1bit
		port (entrada, max, min, c_0, ud: in std_logic;
		  saida, c: out std_logic);
	end component;
	
	signal c_0: std_logic_vector(8 downto 0);
	
begin 
	Somador1: somador1bit
		port map(entradaSomador(0),max(0),min(0),c_in,up_down,S(0),c_0(0));
	Somador2: somador1bit
		port map(entradaSomador(1),max(1),min(1),c_0(0),up_down,S(1),c_0(1));
	Somador3: somador1bit
		port map(entradaSomador(2),max(2),min(2),c_0(1),up_down,S(2),c_0(2));
	Somador4: somador1bit
		port map(entradaSomador(3),max(3),min(3),c_0(2),up_down,S(3),c_0(3));
	Somador5: somador1bit
		port map(entradaSomador(4),max(4),min(4),c_0(3),up_down,S(4),c_0(4));
	Somador6: somador1bit
		port map(entradaSomador(5),max(5),min(5),c_0(4),up_down,S(5),c_0(5));
	Somador7: somador1bit
		port map(entradaSomador(6),max(6),min(6),c_0(5),up_down,S(6),c_0(6));
	Somador8: somador1bit
		port map(entradaSomador(7),max(7),min(7),c_0(6),up_down,S(7),c_0(7));
	Somador9: somador1bit
		port map(entradaSomador(8),max(8),min(8),c_0(7),up_down,S(8),c_0(8));
	Somador10: somador1bit
		port map(entradaSomador(9),max(9),min(9),c_0(8),up_down,S(9),open);
end Hardware;
