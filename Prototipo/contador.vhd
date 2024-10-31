library ieee;
use ieee.std_logic_1164.all;

entity contador is
	port(clk, clear: in std_logic;
			cout: out std_logic_vector(9 downto 0));
end contador;

architecture logica of contador is
	component ffjk
	   port (ck, clr, set, j, k : in  std_logic;
                          q : out std_logic);
	end component;
	
	signal cin: std_logic_vector(7 downto 0);
begin
	ffjk1: ffjk
		port map(clk, clear, '1', '1','1', cout(0));

	ffjk2: ffjk
		port map(clk, clear, '1', cout(0),cout(0), cout(1));
	
	cin(0) <= cout(0) and cout(1);
	ffjk3: ffjk
		port map(clk, clear, '1', cin(0),cin(0), cout(2));
	
	cin(1) <= cout(1) and cout(2);
	ffjk4: ffjk
		port map(clk, clear, '1', cin(1),cin(1), cout(3));
	
	cin(2) <= cout(2) and cout(3);
	ffjk5: ffjk
		port map(clk, clear, '1', cin(2),cin(2), cout(4));
	
	cin(3) <= cout(3) and cout(4);
	ffjk6: ffjk
		port map(clk, clear, '1', cin(3),cin(3), cout(5));
		
	cin(4) <= cout(4) and cout(5);
	ffjk7: ffjk
		port map(clk, clear, '1', cin(4),cin(4), cout(6));
	
	cin(5) <= cout(5) and cout(6);
	ffjk8: ffjk
		port map(clk, clear, '1', cin(5),cin(5), cout(7));
	
	cin(6) <= cout(6) and cout(7);
	ffjk9: ffjk
		port map(clk, clear, '1', cin(6),cin(6), cout(8));
	
	cin(7) <= cout(7) and cout(8);
	ffjk10: ffjk
		port map(clk, clear, '1', cin(7),cin(7), cout(9));
end logica;