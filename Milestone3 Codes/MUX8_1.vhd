----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:51:18 12/01/2017 
-- Design Name: 
-- Module Name:    MUX8_1 - Behavioral 
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

entity MUX8_1 is
    Port ( 
	        RegD0 : in  STD_LOGIC_VECTOR (4 downto 0);
           Value0 : in  STD_LOGIC_VECTOR (31 downto 0);
           InstrType0 : in  STD_LOGIC_VECTOR (1 downto 0);
           Ready0 : in  STD_LOGIC;
			   RegD1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Value1 : in  STD_LOGIC_VECTOR (31 downto 0);
           InstrType1 : in  STD_LOGIC_VECTOR (1 downto 0);
           Ready1 : in  STD_LOGIC;
			   RegD2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Value2 : in  STD_LOGIC_VECTOR (31 downto 0);
           InstrType2 : in  STD_LOGIC_VECTOR (1 downto 0);
           Ready2 : in  STD_LOGIC;
			   RegD3 : in  STD_LOGIC_VECTOR (4 downto 0);
           Value3 : in  STD_LOGIC_VECTOR (31 downto 0);
           InstrType3 : in  STD_LOGIC_VECTOR (1 downto 0);
           Ready3 : in  STD_LOGIC;
			   RegD4 : in  STD_LOGIC_VECTOR (4 downto 0);
           Value4 : in  STD_LOGIC_VECTOR (31 downto 0);
           InstrType4 : in  STD_LOGIC_VECTOR (1 downto 0);
           Ready4: in  STD_LOGIC;
			   RegD5 : in  STD_LOGIC_VECTOR (4 downto 0);
           Value5 : in  STD_LOGIC_VECTOR (31 downto 0);
           InstrType5 : in  STD_LOGIC_VECTOR (1 downto 0);
           Ready5 : in  STD_LOGIC;
			   RegD6 : in  STD_LOGIC_VECTOR (4 downto 0);
           Value6 : in  STD_LOGIC_VECTOR (31 downto 0);
           InstrType6 : in  STD_LOGIC_VECTOR (1 downto 0);
           Ready6 : in  STD_LOGIC;
			   RegD7 : in  STD_LOGIC_VECTOR (4 downto 0);
           Value7 : in  STD_LOGIC_VECTOR (31 downto 0);
           InstrType7 : in  STD_LOGIC_VECTOR (1 downto 0);
           Ready7 : in  STD_LOGIC;
			   RegD : out  STD_LOGIC_VECTOR (4 downto 0);
           Value : out  STD_LOGIC_VECTOR (31 downto 0);
           InstrType : out  STD_LOGIC_VECTOR (1 downto 0);
           Ready : out  STD_LOGIC;
			  sel : in std_Logic_vector(2 downto 0));
end MUX8_1;

architecture Behavioral of MUX8_1 is

begin

RegD <= regd0 when sel ="000" else regd1 when sel="001" else regd2 when sel="010" else regd3 when sel="011" else regd4 when sel ="100" else regd5 when sel="101" else regd6 when sel="110" else regd7 when sel="111";
Value <= value0 when sel ="000" else value1 when sel="001" else value2 when sel="010" else value3 when sel="011" else value4 when sel ="100" else value5 when sel="101" else value6 when sel="110" else value7 when sel="111";
InstrType <= InstrType0 when sel ="000" else InstrType1 when sel="001" else InstrType2 when sel="010" else InstrType3 when sel="011" else InstrType4 when sel ="100" else InstrType5 when sel="101" else InstrType6 when sel="110" else InstrType7 when sel="111";
Ready <= Ready0 when sel ="000" else Ready1 when sel="001" else Ready2 when sel="010" else Ready3 when sel="011" else Ready4 when sel ="100" else Ready5 when sel="101" else Ready6 when sel="110" else Ready7 when sel="111";

end Behavioral;

