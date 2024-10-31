library ieee;
use ieee.std_logic_1164.all;

entity mux_2x1_10bits is
	port(cin: in std_logic;
			val0, val1: in std_logic_vector(9 downto 0);
			cout: out std_logic_vector(9 downto 0));
end mux_2x1_10bits;

architecture logica of mux_2x1_10bits is
	component Mux_2x1
		port(cin, val0, val1: in std_logic;
			  cout: out std_logic);
	end component;
begin 
	Mux1: mux_2x1
		port map(cin, val0(0),val1(0), cout(0));
	Mux2: mux_2x1
		port map(cin, val0(1),val1(1), cout(1));
	Mux3: mux_2x1
		port map(cin, val0(2),val1(2), cout(2));
	Mux4: mux_2x1
		port map(cin, val0(3),val1(3), cout(3));
	Mux5: mux_2x1
		port map(cin, val0(4),val1(4), cout(4));
	Mux6: mux_2x1
		port map(cin, val0(5),val1(5), cout(5));
	Mux7: mux_2x1
		port map(cin, val0(6),val1(6), cout(6));
	Mux8: mux_2x1
		port map(cin, val0(7),val1(7), cout(7));
	Mux9: mux_2x1
		port map(cin, val0(8),val1(8), cout(8));
	Mux10: mux_2x1
		port map(cin, val0(9),val1(9), cout(9));
end logica;
	