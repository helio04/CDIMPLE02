library ieee;
use ieee.std_logic_1164.all;

entity contadorfull is 
	port(upanddownfull,stepfull,maxandminfull,loadfull,clearfull,clockfpga : in std_logic;
			A0full,A1full,A2full : in std_logic_vector(3 downto 0);
			clockoutfull, ledoutfull : out std_logic;
			hex0,hex1,hex2 : out std_logic_vector(6 downto 0));
end contadorfull;

architecture clthanos of contadorfull is
component circuitoseletor is
	port(entradaseletiva : in std_logic_vector(9 downto 0);
			load1,mxmi1,clear1,step1,clock1sel, updownsel : in std_logic;
			saidaregmaximosel, saidaregminimosel, saidareginicialsel, saidaregstep : out std_logic_vector(9 downto 0));
			
end component;
component contadorbasico is
	port(valorinicialcontador, valorstep : in std_logic_vector(9 downto 0);
	upanddownctb, clockcontadorb : in std_logic;
	saidacontadorbasico : out std_logic_vector(9 downto 0));
	
end component;
component verificador is
	port(entradavalor, entradavmax, entradavmin : in std_logic_vector(9 downto 0);
			clockver : in std_logic;
			ledcout : out std_logic;
			saidaverificador : out std_logic_vector(9 downto 0));
end component;
component BCDBIN_10bits is
	port(
		BCD: in std_logic_vector(11 downto 0);
		SW: out std_logic_vector(9 downto 0)
	);

end component;
component BINBCD_10bits is
	port(
		SW: in std_logic_vector(9 downto 0);
		BCD: out std_logic_vector(11 downto 0)
	);
end component;
component segm is
	port(bdec : in std_logic_vector(3 downto 0);
	segmentos : out std_logic_vector(6 downto 0));
end component;
component divisorclock is
   port (ck_in : in  std_logic;
         ck_out: out std_logic);
end component;
signal saidabcdbin,saidaregmaxcs,saidaregmincs, saidaregincs, saidaregstepcs,
saidaregcontadorb, saidaverificadorbound : std_logic_vector(9 downto 0);
signal entradabcdbin, saidabintobcd : std_logic_vector(11 downto 0);
signal shex0,shex1,shex2 : std_logic_vector(3 downto 0);
signal clockfull : std_logic;
begin
div : divisorclock port map(clockfpga, clockfull);
entradabcdbin <= A2full&A1full&A0full;
csel : circuitoseletor port map(saidabcdbin, loadfull, maxandminfull, 
clearfull,stepfull, clockfull, upanddownfull, saidaregmaxcs, saidaregmincs, 
saidaregincs, saidaregstepcs);
ctb : contadorbasico port map(saidaregincs, saidaregstepcs, 
upanddownfull, clockfull, saidaregcontadorb);
vfv : verificador port map(saidaregcontadorb, saidaregmaxcs, 
saidaregmincs,clockfull, ledoutfull, saidaverificadorbound);
bcdtobin : BCDBIN_10bits port map(entradabcdbin, saidabcdbin);
bintobcd : binbCD_10bits port map(saidaverificadorbound, saidabintobcd);
shex2 <= saidabintobcd(11 downto 8);
shex1 <= saidabintobcd(7 downto 4);
shex0 <= saidabintobcd(3 downto 0);
segmh0 : segm port map(shex0, hex0);
segmh1 : segm port map(shex1, hex1);
segmh2 : segm port map(shex2, hex2);
clockoutfull <= clockfull;
end architecture;