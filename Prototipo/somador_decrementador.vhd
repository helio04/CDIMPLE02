library ieee;
use ieee.std_logic_1164.all;

entity somador_decrementador is
	port(A,B: in std_logic_vector(9 downto 0);
		  up_dw: in std_logic;
		  S: out std_logic_vector(9 downto 0));
end somador_decrementador;

architecture Hardware of somador_decrementador is
	component Somador10bits
		port(A,B: in std_logic_vector(9 downto 0);
			  cin: in std_logic;
			  S: out std_logic_vector(9 downto 0));
	end component;
	
	signal new_B:std_logic_vector(9 downto 0);
	signal notupdw : std_logic;
begin 
	new_B <= B(9 downto 0) xor not(up_dw,up_dw,up_dw,up_dw,up_dw,up_dw,up_dw,up_dw,up_dw,up_dw) ;
	notupdw <= (not up_dw);
	soma: Somador10bits
		port map(A, new_B, notupdw , S);

end Hardware;