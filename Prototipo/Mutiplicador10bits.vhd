library ieee;
use ieee.std_logic_1164.all;

entity Mutiplicador10bits is
	port(A: in std_logic_vector(9 downto 0);
		  B: in std_logic_vector(3 downto 0);
		  cout: out std_logic_vector(9 downto 0));
end Mutiplicador10bits;

architecture Hardware of Mutiplicador10bits is
	component Somador10bits
		port(A,B: in std_logic_vector(9 downto 0);
			  cin: in std_logic;
			  S: out std_logic_vector(9 downto 0));
	end component;
	signal AB0,AB1,AB2,AB3: std_logic_vector(9 downto 0);
	signal pp1,pp2,pp3,pp4: std_logic_vector(9 downto 0);
	signal soma1, soma2: std_logic_vector(9 downto 0);
begin
--- criando os pps
	AB0 <= (A(9 downto 0)) and (B(0),B(0),B(0),B(0),B(0),B(0),B(0),B(0),B(0),B(0));
	AB1 <= (A(9 downto 0)) and (B(1),B(1),B(1),B(1),B(1),B(1),B(1),B(1),B(1),B(1));
	AB2 <= (A(9 downto 0)) and (B(2),B(2),B(2),B(2),B(2),B(2),B(2),B(2),B(2),B(2));
	AB3 <= (A(9 downto 0)) and (B(3),B(3),B(3),B(3),B(3),B(3),B(3),B(3),B(3),B(3));
--- fazendo deslocamento dos pps
	pp1 <= AB0;
	pp2 <= AB1(8 downto 0) & '0';      -- desloca pp2 1 bit à esquerda
	pp3 <= AB2(7 downto 0) & "00";     -- desloca pp3 2 bits à esquerda
	pp4 <= AB3(6 downto 0) & "000";    -- desloca pp4 3 bits à esquerda
--- produzindo resultado
	sum1: somador10bits
		port map(pp1,pp2,'0',soma1);
	sum2: somador10bits
		port map(soma1,pp3,'0',soma2);
	sum3: somador10bits
		port map(soma2,pp4,'0',cout);
end Hardware;