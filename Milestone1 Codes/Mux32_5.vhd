----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:34:16 10/28/2017 
-- Design Name: 
-- Module Name:    Mux32_5 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mux32_5 is
Port ( 	  Re0  : in  STD_LOGIC_VECTOR (4 downto 0);
           Re1  : in  STD_LOGIC_VECTOR (4 downto 0);
           Re2  : in  STD_LOGIC_VECTOR (4 downto 0);
           Re3  : in  STD_LOGIC_VECTOR (4 downto 0);
           Re4  : in  STD_LOGIC_VECTOR (4 downto 0);
           Re5  : in  STD_LOGIC_VECTOR (4 downto 0);
           Re6  : in  STD_LOGIC_VECTOR (4 downto 0);
           Re7  : in  STD_LOGIC_VECTOR (4 downto 0);
           Re8  : in  STD_LOGIC_VECTOR (4 downto 0);
           Re9  : in  STD_LOGIC_VECTOR (4 downto 0);
           Re10 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re11 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re12 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re13 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re14 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re15 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re16 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re17 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re18 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re19 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re20 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re21 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re22 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re23 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re24 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re25 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re26 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re27 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re28 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re29 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re30 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re31 : in  STD_LOGIC_VECTOR (4 downto 0);
           SEL  : in  STD_LOGIC_VECTOR (4 downto 0);
           Dout : out STD_LOGIC_VECTOR (4 downto 0));


end Mux32_5;

architecture Behavioral of Mux32_5 is

begin

Dout <= 	  Re0 when SEL="00000"   else
			  Re1 when SEL="00001"	else
			  Re2 when SEL="00010"	else
			  Re3 when SEL="00011"	else
			  Re4 when SEL="00100"	else
			  Re5 when SEL="00101"	else  
			  Re6 when SEL="00110"	else
			  Re7 when SEL="00111"	else
			  Re8 when SEL="01000"	else
			  Re9 when SEL="01001"	else
			  Re10 when SEL="01010"	else
			  Re11 when SEL="01011"	else
			  Re12 when SEL="01100"	else
			  Re13 when SEL="01101"	else
			  Re14 when SEL="01110"	else
			  Re15 when SEL="01111"	else
			  Re16 when SEL="10000"	else	
			  Re17 when SEL="10001"	else
			  Re18 when SEL="10010"	else
			  Re19 when SEL="10011"	else
			  Re20 when SEL="10100"	else
			  Re21 when SEL="10101"	else
			  Re22 when SEL="10110"	else
			  Re23 when SEL="10111"	else
			  Re24 when SEL="11000"	else
			  Re25 when SEL="11001"	else
			  Re26 when SEL="11010"	else
			  Re27 when SEL="11011"	else
			  Re28 when SEL="11100"	else
			  Re29 when SEL="11101"	else
			  Re30 when SEL="11110"	else
			  Re31;
			 



end Behavioral;

