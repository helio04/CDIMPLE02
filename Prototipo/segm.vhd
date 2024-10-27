library ieee;
use ieee.std_logic_1164.all;

entity segm is
	port(bdec : in std_logic_vector(3 downto 0);
	segmentos : out std_logic_vector(6 downto 0));
end segm;

architecture conversor of segm is
signal A,B,C,D : std_logic;
begin
A <= bdec(3);
B <= bdec(2);
C <= bdec(1);
D <= bdec(0);
	segmentos(0) <= C or A or (B and D) or ((not B) and (not D));
	segmentos(1) <= (not b) or ((not C) and (not D));
	segmentos(2) <= (not C) or D or B;
	segmentos(3) <= A or (C and not D) or (C and not B) or ((not b) and (not D)) or (B and D and (not C));
	segmentos(4) <= (C and not D) or ((not b) and (not d));
	segmentos(5) <= A or (B and D and not C) or (B and C and not D) or ((not b) and (not c) and (not d));
	segmentos(6) <= A or (C and not D) or (B and not C) or (C and not B);

end architecture;	
