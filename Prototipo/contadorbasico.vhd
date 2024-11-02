library ieee;
use ieee.std_logic_1164.all;

entity contadorbasico is
	port(valorinicialcontador, valorstep : in std_logic_vector(9 downto 0);
	upanddownctb, clockcontadorb : in std_logic;
	saidacontadorbasico : out std_logic_vector(9 downto 0));
	
end entity;

architecture clthanos of contadorbasico is 
component Mutiplicador10bits is
	port(A: in std_logic_vector(9 downto 0);
		  B: in std_logic_vector(3 downto 0);
		  cout: out std_logic_vector(9 downto 0));
end component;
component somador_decrementador is
	port(A,B: in std_logic_vector(9 downto 0);
		  up_dw: in std_logic;
		  S: out std_logic_vector(9 downto 0));
end component;
component contador is
	port(clk, clear: in std_logic;
			cout: out std_logic_vector(9 downto 0));
end component;
signal saidacontadorsimples, saidamultiplicador : std_logic_vector(9 downto 0);
signal sinalstep : std_logic_vector(3 downto 0);
begin
sinalstep <= valorstep(3)&valorstep(2)&valorstep(1)&valorstep(0);
counterd : contador port map(clockcontadorb, '1', saidacontadorsimples);
multd : Mutiplicador10bits port map(saidacontadorsimples, sinalstep, saidamultiplicador);
sumd : somador_decrementador port map(valorinicialcontador, saidamultiplicador, upanddownctb,saidacontadorbasico);
end architecture;