library ieee;
use ieee.std_logic_1164.all;

entity circuitoseletor is
	port(entradaseletiva : in std_logic_vector(9 downto 0);
			load1,mxmi1,clear1,step1,clock1sel, updownsel : in std_logic;
			saidaregmaximosel, saidaregminimosel, saidareginicialsel, saidaregstep : out std_logic_vector(9 downto 0));
			
end entity;

architecture selec of circuitoseletor is
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

signal loadmin,loadmax,loadstep : std_logic;
signal saidamuxmax1, saidamuxmax2, saidamuxmin1, saidamuxmin2, saidaregistradormax, 
saidaregistradormin, entradaregismax, entradaregismin : std_logic_vector(9 downto 0);
signal saidamuxstep1, saidamuxstep2, entradaregisstep, saidaregisstep : std_logic_vector(9 downto 0);
begin
loadmax <= (load1 and mxmi1 and (not step1)) or (not clear1);
loadmin <= (load1 and (not mxmi1) and (not step1)) or (not clear1);
loadstep <=(load1 and step1 and (not mxmi1)) or (not clear1);
muxmax1 : mux_2x1_10bits port map(clear1,"1111100111",entradaseletiva , saidamuxmax1);
muxmax2 : mux_2x1_10bits port map(loadmax, saidaregistradormax,saidamuxmax1, entradaregismax);
resmax1 : registrador10bits port map(entradaregismax, clock1sel, '1', saidaregistradormax);
saidaregmaximosel <= saidaregistradormax;
muxmin1 : mux_2x1_10bits port map(clear1,"0000000000",entradaseletiva, saidamuxmin1);
muxmin2 : mux_2x1_10bits port map(loadmin, saidaregistradormin, saidamuxmin1, entradaregismin);
resmin1 : registrador10bits port map(entradaregismin, clock1sel, '1', saidaregistradormin);
saidaregminimosel <= saidaregistradormin;
muxstep1 : mux_2x1_10bits port map(clear1,"0000000001",entradaseletiva , saidamuxstep1);
muxstep2 : mux_2x1_10bits port map(loadstep,saidaregisstep,saidamuxstep1, entradaregisstep);
resstep1 : registrador10bits port map(entradaregisstep, clock1sel, '1', saidaregisstep);
muxupdown :  mux_2x1_10bits port map(updownsel,saidaregistradormax, saidaregistradormin , saidareginicialsel);
saidaregstep <= saidaregisstep;
end architecture;