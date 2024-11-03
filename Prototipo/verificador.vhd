library ieee;
use ieee.std_logic_1164.all;

entity verificador is
	port(entradavalor, entradavmax, entradavmin : in std_logic_vector(9 downto 0);
			clockver : in std_logic;
			ledcout : out std_logic;
			saidaverificador : out std_logic_vector(9 downto 0));
end entity;

architecture ver of verificador is
component registrador10bits is
	port(cin: in std_logic_vector(9 downto 0);
		  clk: in std_logic;
	     clear: in std_logic;
		  cout: out std_logic_vector(9 downto 0));
end component;
component mux_2x1_10bits is
	port(cin: in std_logic;
			val0, val1: in std_logic_vector(9 downto 0);
			cout: out std_logic_vector(9 downto 0));
end component;
component comparador is 
	port(A,B: in std_logic_vector(9 downto 0);
		  AmaiorB, AmenorB, AigualB: out std_logic);
end component;
signal maiorquemax,menorquemin, loadgen, gnd : std_logic;
signal entradaregistrador, saidaregistrador : std_logic_vector(9 downto 0) := "0000000000";
begin
comparamax : comparador port map(entradavalor, entradavmax, maiorquemax, gnd, gnd);
comparamin : comparador port map(entradavalor, entradavmin, gnd, menorquemin, gnd);
loadgen <= ((not maiorquemax) and (not menorquemin));
regisvalor : registrador10bits port map(entradaregistrador,clockver, '1', saidaregistrador);
muxfim : mux_2x1_10bits port map(loadgen, saidaregistrador, entradavalor, entradaregistrador);
saidaverificador <= saidaregistrador;
ledcout <= maiorquemax or menorquemin;
end architecture;

