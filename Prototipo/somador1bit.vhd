library ieee;
use ieee.std_logic_1164.all;

entity somador1bit is
	port (entrada, max, min, c_0, ud: in std_logic;
		  saida, c: out std_logic);
end somador1bit;

architecture hardware of somador1bit is 
	signal dmax: std_logic;
	signal smin: std_logic;
	signal eout: std_logic;
	signal cout: std_logic;
	signal cin: std_logic;
	signal ein: std_logic;
begin
	cin <= c_0;
	ein<= c_0;
	dmax <= (entrada and max and ein) or ((not entrada) and max and (not ein)) or ((not entrada) and (not max) and ein) or (entrada and (not max) and (not ein));
	eout <= ((not max) and entrada) or (ein and entrada) or ((not max) and ein);
	smin <= (entrada XOR min XOR cin) OR (entrada and min and cin);
	cout <= (min AND cin) OR (entrada AND cin) OR (entrada AND min);
	saida <= (smin and ud) OR (dmax and (not ud));
	c <= (cout and ud) OR (eout and (not ud));
end hardware;
