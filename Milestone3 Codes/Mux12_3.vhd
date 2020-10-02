----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:05:52 10/28/2017 
-- Design Name: 
-- Module Name:    Mux9_3 - Behavioral 
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

entity Mux9_3 is
    Port ( Datain1 : in  STD_LOGIC_VECTOR (31 downto 0);
           tag1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Qin1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Datain2 : in  STD_LOGIC_VECTOR (31 downto 0);
           tag2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Qin2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Datain3 : in  STD_LOGIC_VECTOR (31 downto 0);
           tag3 : in  STD_LOGIC_VECTOR (4 downto 0);
           Qin3 : in  STD_LOGIC_VECTOR (4 downto 0);
			  Sel: in STD_LOGIC_VECTOR (1 downto 0);
			  Dataout : out  STD_LOGIC_VECTOR (31 downto 0);
           tagout : out  STD_LOGIC_VECTOR (4 downto 0);
           Qout : out  STD_LOGIC_VECTOR (4 downto 0));
end Mux9_3;

architecture Behavioral of Mux9_3 is

begin
Process(Sel,Datain1,Datain2,Datain3,tag1,tag2,tag3,qin1,qin2,qin3)
begin
	If (Sel="00") then		-- From FU1
		Dataout <= Datain1;
		tagout <= tag1;
		Qout <= qin1;
	elsif (Sel="01") then	--From FU2
		Dataout <= Datain2;
		tagout <= tag2;
		Qout <= qin2;
	elsif (Sel="10") then		--The uselessone
		Dataout <= Datain3;
		tagout <= tag3;
		Qout <= qin3;
	else
		Dataout <= "00000000000000000000000000000000";
		tagout <= "00000";
		Qout <= "00000";
	end if;
end process;

end Behavioral;

