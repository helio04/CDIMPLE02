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
	
	signal cin, valor_saida: std_logic_vector(9 downto 0);
begin
	ffjk1: ffjk
		port map(clk, clear, '1', '1','1', valor_saida(0));

	ffjk2: ffjk
		port map(clk, clear, '1', valor_saida(0),valor_saida(0), valor_saida(1));
	
	cin(0) <= valor_saida(0) and valor_saida(1);
	ffjk3: ffjk
		port map(clk, clear, '1', cin(0),cin(0), valor_saida(2));
	
	cin(1) <= valor_saida(1) and valor_saida(2);
	ffjk4: ffjk
		port map(clk, clear, '1', cin(1),cin(1), valor_saida(3));
	
	cin(2) <= valor_saida(2) and valor_saida(3);
	ffjk5: ffjk
		port map(clk, clear, '1', cin(2),cin(2), valor_saida(4));
	
	cin(3) <= valor_saida(3) and valor_saida(4);
	ffjk6: ffjk
		port map(clk, clear, '1', cin(3),cin(3), valor_saida(5));
		
	cin(4) <= valor_saida(4) and valor_saida(5);
	ffjk7: ffjk
		port map(clk, clear, '1', cin(4),cin(4), valor_saida(6));
	
	cin(5) <= valor_saida(5) and valor_saida(6);
	ffjk8: ffjk
		port map(clk, clear, '1', cin(5),cin(5), valor_saida(7));
	
	cin(6) <= valor_saida(6) and valor_saida(7);
	ffjk9: ffjk
		port map(clk, clear, '1', cin(6),cin(6), valor_saida(8));
	
	cin(7) <= valor_saida(7) and valor_saida(8);
	ffjk10: ffjk
		port map(clk, clear, '1', cin(7),cin(7), valor_saida(9));
	
	cout <= valor_saida;
end logica;